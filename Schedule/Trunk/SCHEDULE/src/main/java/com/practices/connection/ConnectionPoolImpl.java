package com.practices.connection;

import com.practices.connection.exceptions.DbUnreacheableException;
import com.practices.schedule.utils.LoggerHelper;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author pbutron
 */
class ConnectionPoolImpl implements IConnectionPool {

    private static final int POOL_SLEEP_TIME = 1000; //1000ms
    private static final int IS_ALIVE_TIMEOUT = 1000; //1000ms
    private static final int TOTAL_DB_RETRIES = 120; //retries

    private final String connectionTestQuery;
    private final ConnectionData connectionData;
    private final List<DBConnection> connectionsList;
    private final DBConnection isDbAliveConnection;

    public ConnectionPoolImpl(String connectionTestQuery, ConnectionData connectionData)
            throws SQLException, ClassNotFoundException {
        this.connectionTestQuery = connectionTestQuery;
        this.connectionData = connectionData;
        connectionsList = initConnections();
        isDbAliveConnection = openDBConnection();
    }

    protected ConnectionPoolImpl(String connectionTestQuery, ConnectionData connectionData,
            List<DBConnection> connectionsList, DBConnection isDbAliveConnection) {
        this.connectionTestQuery = connectionTestQuery;
        this.connectionData = connectionData;
        this.connectionsList = connectionsList;
        this.isDbAliveConnection = isDbAliveConnection;
    }

    List<DBConnection> getConnectionsList() {
        return new ArrayList<>(connectionsList);
    }

    @Override
    public void closeConnections() {
        for (DBConnection dbConnection : connectionsList) {
            dbConnection.closeConnection();
        }
    }

    @Override
    public Connection getConnection() throws DbUnreacheableException {
        return getConnection(null);
    }

    @Override
    public Connection getConnection(Integer timeoutInSec) throws DbUnreacheableException {
        if (connectionsList.isEmpty()) {
            throw new IllegalStateException("No connections available on pool!!!");
        }

        Connection result = null;

        while (result == null) {

            boolean connectionFound = false;
            for (int i = 0; i <= TOTAL_DB_RETRIES; i++) {
                LoggerHelper.logSevere("Retrying to obtain connection: " + i);
                result = retrieveAvailableConnection(timeoutInSec);
                if (result == null) {
                    sleepThread();
                } else {
                    connectionFound = true;
                    break;
                }
            }

            if (!connectionFound) {
                checkDbIsAlive();
            }
        }

        return result;

    }

    @Override
    public void returnConnection(Connection connection) {
        if (connection == null) {
            LoggerHelper.logSevere("Returned connection was null");
        } else {
            returnDBConnection(connection);
            try {
                String conecctionId = connection.toString();
                boolean closed = connection.isClosed();
                if (closed) {
                    LoggerHelper.logInfo("Connection retrieved: " + conecctionId
                            + "with isClosed: " + closed);
                }
            } catch (SQLException ex) {
                LoggerHelper.logSevere("Unexepcted error while checking if connection was closed: ", ex);
            }
            LoggerHelper.logInfo("Connection retrieved: " + connection.toString());
        }
    }

    @Override
    protected void finalize() throws Throwable {
        closeConnections();
        super.finalize();
    }

    @Override
    public String toString() {
        return "ConnectionPoolImpl{" + connectionData + '}';
    }

    private void checkDbIsAlive() throws DbUnreacheableException {

        if (isDbAliveConnection.retrieveConnection(IS_ALIVE_TIMEOUT) == null) {
            throw new DbUnreacheableException("It was not posible to obtain a connection from the DB");
        } else {
            isDbAliveConnection.changeStateToIdle();
        }
    }

    private void sleepThread() {
        try {
            Thread.sleep(POOL_SLEEP_TIME);
        } catch (InterruptedException ex) {
            LoggerHelper.logSevere("Error while sleeping on retrieve connection", ex);
        }
    }

    private List<DBConnection> initConnections() throws SQLException, ClassNotFoundException {
        if (connectionData.getPoolSize() <= 0) {
            throw new IllegalArgumentException("Invalid pool size: " + connectionData.getPoolSize());
        }

        List<DBConnection> localConnectionsList = new ArrayList<>();

        for (int i = 0; i < connectionData.getPoolSize(); i++) {
            localConnectionsList.add(openDBConnection());
        }

        return Collections.unmodifiableList(localConnectionsList);
    }

    private Connection retrieveAvailableConnection(Integer timeoutInSec) {
        Connection connection = null;
        for (DBConnection dbConnection : connectionsList) {
            synchronized (dbConnection) {
                if (!dbConnection.isBusy()) {
                    if (timeoutInSec == null) {
                        connection = dbConnection.retrieveConnection();
                    } else {
                        connection = dbConnection.retrieveConnection(timeoutInSec);
                    }
                    break;
                }
            }
        }
        return connection;
    }

    private void returnDBConnection(Connection connection) {
        for (DBConnection dbConnection : connectionsList) {
            synchronized (dbConnection) {
                if (dbConnection.isMineConnection(connection)) {
                    dbConnection.changeStateToIdle();
                    break;
                }
            }
        }
    }

    private DBConnection openDBConnection() throws SQLException, ClassNotFoundException {
        return new DBConnection(connectionData, connectionTestQuery);
    }

}
