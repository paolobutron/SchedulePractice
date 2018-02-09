package com.practices.connection;

import com.practices.connection.exceptions.DbUnreacheableException;
import com.practices.schedule.utils.LoggerHelper;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pbutron
 */
public class MultipleConnectionPoolImpl implements IMultipleConnectionPool {

    private final List<IConnectionPool> connectionsList;
    private final Object dummyLock = new Object();
    private IConnectionPool validConnectionPool;

    public MultipleConnectionPoolImpl(List<IConnectionPool> connectionsList) {
        this.connectionsList = new ArrayList<>(connectionsList);
        this.validConnectionPool = connectionsList.get(0);
    }

    public MultipleConnectionPoolImpl(List<IConnectionPool> connectionsList, IConnectionPool validConnectionPool) {
        this.connectionsList = new ArrayList<>(connectionsList);
        this.validConnectionPool = validConnectionPool;
    }

    @Override
    public void returnConnection(Connection connection) {
        this.validConnectionPool.returnConnection(connection);
    }

    @Override
    public Connection getConnection() {
        return this.getConnection(null);
    }

    @Override
    public Connection getConnection(Integer timeOutInSec) {
        if (connectionsList.size() <= 0) {
            throw new IllegalStateException("No connection pools available on list!!!");
        }

        Connection result;
        synchronized (dummyLock) {
            try {
                result = validConnectionPool.getConnection();
            } catch (DbUnreacheableException ex) {
                LoggerHelper.logSevere("DB was unreacheable: " + validConnectionPool.toString() + ex);
                validConnectionPool.closeConnections();
                result = changeValidConnectionPool();
            }
        }

        return result;
    }

    @Override
    public void closeConnections() {
        for (IConnectionPool connectionPool : connectionsList) {
            connectionPool.closeConnections();
        }
    }

    private Connection changeValidConnectionPool() {

        Connection result = null;
        int positionToGet = 0;
        while (result == null) {
            try {
                validConnectionPool = connectionsList.get(positionToGet);
                result = validConnectionPool.getConnection();

            } catch (DbUnreacheableException ex) {
                LoggerHelper.logSevere("DB was unreacheable: " + validConnectionPool.toString() + ex);
                positionToGet = getNextConnectionOnList(positionToGet);
            }
        }

        return result;
    }

    private int getNextConnectionOnList(int positionToGet) {
        if (positionToGet == connectionsList.size() - 1) {
            positionToGet = 0;
        } else {
            positionToGet++;
        }
        return positionToGet;
    }
}
