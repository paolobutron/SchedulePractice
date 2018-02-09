package com.practices.connection;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;
import java.util.ResourceBundle;

/**
 *
 * @author pbutron
 */
public class DBResourceData {

    private static final String HOST = "hostdb";
    private static final String SCHEMA = "schemadb";
    private static final String USER = "userdb";
    private static final String PASSWORD = "passworddb";
    private static final String PORT = "portdb";
    private static final String POOL = "dbpoolsize";

    private final String fileName;
    private ResourceBundle resourceBundle;
    private Properties properties;
    private String urlConnection;

    public DBResourceData(String fileName) throws FileNotFoundException, IOException {
        this.fileName = fileName;
        loadResource();
    }

    void buildURLConnection(String template) {
        urlConnection = String.format(template, getHost(), getPort(), getSchema());
    }

    String getUrlConnection() {
        return urlConnection;
    }

    public int getPort() {
        return getInt(PORT);
    }

    public int getPool() {
        return getInt(POOL);
    }

    public String getHost() {
        return getString(HOST);
    }

    public String getSchema() {
        return getString(SCHEMA);
    }

    String getUser() {
        return getString(USER);
    }

    String getPassword() {
        return getString(PASSWORD);
    }

    @Override
    public boolean equals(Object obj) {
        boolean result = false;
        if (obj == null) {
            return result;
        }
        if (getClass() != obj.getClass()) {
            return result;
        }
        final DBResourceData other = (DBResourceData) obj;

        if (fileName == null) {
            result = other.fileName == null;
        } else {
            result = fileName.equals(other.fileName);
        }

        return result;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        int diff = 0;

        if (this.fileName != null) {
            diff = this.fileName.hashCode();
        }
        hash = 41 * hash + diff;
        return hash;
    }

    private int getInt(String propertyName) {
        if (resourceBundle != null) {
            return Integer.valueOf(resourceBundle.getString(propertyName));
        }

        if (properties != null) {
            return Integer.valueOf(properties.getProperty(propertyName));
        }

        throw new IllegalArgumentException("No resources loaded.");
    }

    private String getString(String propertyName) {
        if (resourceBundle != null) {
            return resourceBundle.getString(propertyName);
        }

        if (properties != null) {
            return properties.getProperty(propertyName);
        }

        throw new IllegalArgumentException("No resources loaded.");
    }

    private void loadResource() throws FileNotFoundException, IOException {
        resourceBundle = ResourceBundle.getBundle(fileName);

        if (properties == null && resourceBundle == null) {
            throw new IllegalArgumentException("Invalid resource bundle or invalid properties file path.");
        }

    }

}
