
package com.practices.utils;

/**
 *
 * @author pbutron
 */
public class ConnectionCommons {
    public static final String ORACLE_DRIVER = "oracle.jdbc.driver.OracleDriver";
    public static final String MYSQL_DRIVER = "com.mysql.jdbc.Driver";
    public static final String SYBASE_DRIVER = "com.sybase.jdbc3.jdbc.SybDriver";
    
    public static final String ORACLE_C0NNECTION_URL = "jdbc:oracle:thin:@%s:%s:%s";
    public static final String MYSQL_C0NNECTION_URL = "jdbc:mysql://%s:%s/%s?allowMultiQueries=true";
    public static final String SYBASE_C0NNECTION_URL = "jdbc:sybase:Tds:%s:%s?ServiceName=%s";
    
    public static final int MILISECONDS_VALUE = 1000;
}
