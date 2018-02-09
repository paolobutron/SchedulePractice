package com.practices.connection;

import com.practices.connection.exceptions.DbUnreacheableException;
import java.sql.Connection;

/**
 *
 * @author pbutron
 */
public interface IConnectionPool {

    void returnConnection(Connection connection);

    Connection getConnection() throws DbUnreacheableException;

    Connection getConnection(Integer timeOutInSec) throws DbUnreacheableException;

    void closeConnections();
}
