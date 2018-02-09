package com.practices.connection;

import java.sql.Connection;

/**
 *
 * @author pbutron
 */
public interface IMultipleConnectionPool {

    void returnConnection(Connection connection);

    Connection getConnection();

    Connection getConnection(Integer timeOutInSec);

    void closeConnections();
}
