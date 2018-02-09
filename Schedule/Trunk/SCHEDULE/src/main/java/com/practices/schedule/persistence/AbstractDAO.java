
package com.practices.schedule.persistence;

import com.practices.connection.ConnectionPoolFactory;
import com.practices.connection.DBResourceData;
import com.practices.connection.IMultipleConnectionPool;
import com.practices.schedule.utils.LoggerHelper;
import com.practices.schedule.utils.ScheduleConstants;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pbutron
 */
public abstract class AbstractDAO {
    
    protected static final int SQL_QUERY_POSITION_2 = 2;
    protected static final int SQL_QUERY_POSITION_3 = 3;
    protected static final int SQL_QUERY_POSITION_4 = 4;
    
    protected final IMultipleConnectionPool connectionPool;
    
    public AbstractDAO() {
        try {
            List<DBResourceData> resourcesList = new ArrayList<>();
            resourcesList.add(ScheduleConstants.MYSQL_RESOURCE_DATA);
            connectionPool = ConnectionPoolFactory.getMysqlInstance(resourcesList);
        } catch (SQLException | ClassNotFoundException ex) {
            LoggerHelper.logSevere("Couldn't open connections", ex);
            throw new IllegalStateException("Verify if your project has Mysql "
                    + "driver in libs or check if your data base is runnig.");
        }
    }
    
    IMultipleConnectionPool getPoolConnection() {
        return connectionPool;
    }
    
}
