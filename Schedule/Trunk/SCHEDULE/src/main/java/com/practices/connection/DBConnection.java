package com.practices.connection;

import com.practices.utils.ConnectionCommons;
import com.practices.schedule.utils.LoggerHelper;
import java.sql.*;
import java.util.Timer;
import java.util.TimerTask;

/**
 *
 * @author pbutron
 */
class DBConnection {

    private static final long DELAY_TIME_OUT_CONN = 1000 * 60 * 15;
    private static final int BUSY_STATE = 0;
    private static final int IDLE_STATE = 1;

    private int state;
    private Connection connection;
    private Timer timer;
    private final long returnConnTimeout;
    private final ConnectionData connectionData;
    private final String connectionTestQuery;

    public DBConnection(ConnectionData connectionData, String connectionTestQuery) 
            throws SQLException, ClassNotFoundException {
        state = IDLE_STATE;
        this.connectionTestQuery = connectionTestQuery;
        this.connectionData = connectionData;
        connection = openConnection();
        returnConnTimeout = DELAY_TIME_OUT_CONN;
    }

    public boolean isMineConnection(Connection connection) {
        return this.connection.equals(connection);
    }

    public void closeConnection() {
        try {
            if (!connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException ex) {
            LoggerHelper.logSevere("Error while closing connections: ", ex);
        }
    }

    public Connection retrieveConnection(int timeoutInSec) {
        long returnConnTimeOut = timeoutInSec * ConnectionCommons.MILISECONDS_VALUE;
        return retrieveConnection(returnConnTimeOut);
    }

    public Connection retrieveConnection() {
        return retrieveConnection(returnConnTimeout);
    }

    public void changeStateToIdle() {
        state = IDLE_STATE;
        if (timer != null) {
            timer.cancel();
        }
    }

    public boolean isBusy() {
        return state == BUSY_STATE;
    }

    private Connection retrieveConnection(long returnConnTimeOut) {
        if (isBusy()) {
            throw new IllegalStateException("This connection must not have been invoked"
                    + ", because is already BUSY.");
        }

        if (!isConnectionValid()) {
            try {
                renewConnection();
            } catch (ClassNotFoundException | SQLException ex) {
                LoggerHelper.logSevere("Could't open a new connection: ", ex);
                return null;
            }
        }

        state = BUSY_STATE;
        timer = new Timer();
        timer.schedule(new ConnnectionMonitor(this), returnConnTimeOut);

        return connection;
    }

    private Connection openConnection() throws SQLException, ClassNotFoundException {
        LoggerHelper.logInfo("Opennig a connection for class: " + connectionData.getClassDriver());
        return connectionData.createNewConnection();
    }

    private void renewConnection() throws SQLException, ClassNotFoundException {
        LoggerHelper.logInfo("Renewing Connection: " + connection);
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException ex) {
            LoggerHelper.logSevere("Error while closing a connection: ", ex);
        }
        connection = openConnection();
        LoggerHelper.logInfo("Connection renew: " + connection);
        changeStateToIdle();
    }

    private boolean isConnectionValid() {
        boolean result = true;
        try {
            if (connection.isClosed()) {
                LoggerHelper.logSevere("Connection was closed when validating! " + connection);
                result = false;
            } else {
                String query = connectionTestQuery;
                try (Statement stmt = connection.createStatement()) {
                    ResultSet rst = stmt.executeQuery(query);
                    rst.close();
                }
            }
        } catch (SQLException e) {
            LoggerHelper.logSevere("Connection was not valid! ", e);
            result = false;
        }
        return result;
    }

    class ConnnectionMonitor extends TimerTask {

        private final DBConnection m_Connection;

        public ConnnectionMonitor(DBConnection connection) {
            m_Connection = connection;
        }

        @Override
        public void run() {
            if (m_Connection.state == BUSY_STATE) {
                try {
                    LoggerHelper.logInfo("Timeout connection " + m_Connection);
                    renewConnection();
                } catch (Exception ex) {
                    LoggerHelper.logSevere("Won't able to renew connection: ", ex);
                }
            }
        }
    }

}
