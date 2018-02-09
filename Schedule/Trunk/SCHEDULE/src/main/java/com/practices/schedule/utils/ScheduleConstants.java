package com.practices.schedule.utils;

import com.practices.connection.DBResourceData;
import java.io.IOException;

/**
 *
 * @author pbutron
 */
public class ScheduleConstants {

    public static final int WS_OK_RESPONSE = 0;
    public static final int WS_FAILED_RESPONSE = -1;
    
    public static DBResourceData MYSQL_RESOURCE_DATA;
    
    static {
        try {
            MYSQL_RESOURCE_DATA = new DBResourceData("MysqlDBProperties");
        } catch (IOException ex) {
            LoggerHelper.logSevere("Invalid DB resource: " + ex.getMessage(), ex);
        }
    }
}
