package com.practices.connection;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author pbutron
 */
public final class ConnectionPoolFactory {

    private static final Map<DBResourceData, IConnectionPool> MYSQL_INSTACE_MAP = new HashMap();
    private static final Map<DBResourceData, IConnectionPool> ORACLE_INSTANCE_MAP = new HashMap();
    private static final Map<DBResourceData, IConnectionPool> SYBASE_INSTANCE_MAP = new HashMap();

    private ConnectionPoolFactory() {
    }

    public static synchronized IMultipleConnectionPool getMysqlInstance(List<DBResourceData> resourceDataList) 
            throws SQLException, ClassNotFoundException {
        IMultipleConnectionPool multipleInstance;
        List<IConnectionPool> availableConnectionPools = new ArrayList<>();
        for (DBResourceData resourceData : resourceDataList) {
            IConnectionPool instance = MYSQL_INSTACE_MAP.get(resourceData);
            if (instance == null) {
                ConnectionData connectionData = ConnectionData.getMysqlInstance(resourceData);
                instance = new ConnectionPoolImpl("select date('2011-03-03');", connectionData);
                MYSQL_INSTACE_MAP.put(resourceData, instance);
            }
            availableConnectionPools.add(instance);
        }
        multipleInstance = new MultipleConnectionPoolImpl(availableConnectionPools);
        return multipleInstance;
    }

    public static synchronized IMultipleConnectionPool getOracleInstance(List<DBResourceData> resourceDataList) 
            throws SQLException, ClassNotFoundException {
        IMultipleConnectionPool multipleInstance;
        List<IConnectionPool> availableConnectionPools = new ArrayList<>();
        for (DBResourceData resourceData : resourceDataList) {
            IConnectionPool instance = ORACLE_INSTANCE_MAP.get(resourceData);
            if (instance == null) {
                ConnectionData connectionData = ConnectionData.getOracleInstance(resourceData);
                instance = new ConnectionPoolImpl("select sysdate from dual", connectionData);
                ORACLE_INSTANCE_MAP.put(resourceData, instance);
            }
            availableConnectionPools.add(instance);
        }
        multipleInstance = new MultipleConnectionPoolImpl(availableConnectionPools);
        return multipleInstance;
    }

    public static synchronized IMultipleConnectionPool getSybaseInstance(List<DBResourceData> resourceDataList) 
            throws SQLException, ClassNotFoundException {
        IMultipleConnectionPool multipleInstance;
        List<IConnectionPool> availableConnectionPools = new ArrayList<>();
        for (DBResourceData resourceData : resourceDataList) {
            IConnectionPool instance = SYBASE_INSTANCE_MAP.get(resourceData);
            if (instance == null) {
                ConnectionData connectionData = ConnectionData.getSybaseInstance(resourceData);
                instance = new ConnectionPoolImpl("select getdate()", connectionData);
                SYBASE_INSTANCE_MAP.put(resourceData, instance);
            }
            availableConnectionPools.add(instance);
        }
        multipleInstance = new MultipleConnectionPoolImpl(availableConnectionPools);
        return multipleInstance;
    }

    static void clearPoolCache() {
        MYSQL_INSTACE_MAP.clear();
        ORACLE_INSTANCE_MAP.clear();
        SYBASE_INSTANCE_MAP.clear();
    }
}
