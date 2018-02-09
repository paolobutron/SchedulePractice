package com.practices.connection;

import com.practices.utils.ConnectionCommons;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author pbutron
 */
final class ConnectionData {

    private final String conectionURL;
    private final String classDriver;
    private final int poolSize;
    private final String user;
    private final String password;

    private ConnectionData(String classDriver, DBResourceData resourceData) {
        this.poolSize = resourceData.getPool();
        this.user = resourceData.getUser();
        this.password = resourceData.getPassword();
        this.conectionURL = resourceData.getUrlConnection();
        this.classDriver = classDriver;
    }

    public static ConnectionData getOracleInstance(DBResourceData resourceData) {
        resourceData.buildURLConnection(ConnectionCommons.ORACLE_C0NNECTION_URL);
        return new ConnectionData(ConnectionCommons.ORACLE_DRIVER, resourceData);
    }

    public static ConnectionData getMysqlInstance(DBResourceData resourceData) {
        resourceData.buildURLConnection(ConnectionCommons.MYSQL_C0NNECTION_URL);
        return new ConnectionData(ConnectionCommons.MYSQL_DRIVER, resourceData);
    }

    public static ConnectionData getSybaseInstance(DBResourceData resourceData) {
        resourceData.buildURLConnection(ConnectionCommons.SYBASE_C0NNECTION_URL);
        return new ConnectionData(ConnectionCommons.SYBASE_DRIVER, resourceData);
    }

    public int getPoolSize() {
        return poolSize;
    }

    String getClassDriver() {
        return classDriver;
    }

    String getConectionURL() {
        return conectionURL;
    }

    String getPassword() {
        return password;
    }

    String getUser() {
        return user;
    }

    public Connection createNewConnection() throws SQLException, ClassNotFoundException {
        try {
            Class.forName(classDriver).newInstance();
        } catch (InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(ConnectionData.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connection connection = DriverManager.getConnection(conectionURL, user, password);
        return connection;
    }

    @Override
    public String toString() {
        return "ConnectionData{" + "conectionURL=" + conectionURL + ", classDriver=" + classDriver + '}';
    }

}
