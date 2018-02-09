
package com.practices.schedule.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Handler;
import java.util.logging.Level;
import java.util.logging.LogRecord;
import java.util.logging.Logger;

/**
 *
 * @author pbutron
 */
public class LoggerHelper extends Handler {

    private final static String Record = "%1$s\t%2$s\t%3$s\t%4$s\t%5$s\r\n";
    private final static DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss.SSS");
    private final static DateFormat nameFormat = new SimpleDateFormat("yyyyMMdd_HHmmss");
    private static File logFile;
    private static FileOutputStream out;
    private static Handler instance;

    @SuppressWarnings("LeakingThisInConstructor")
    LoggerHelper() {
        createNewLogFile();
    }

    public static void logWarning(String message) {
        getLogger().warning(message);
    }

    public static void logInfo(String message) {
        getLogger().info(message);
    }

    public static void logSevere(String message) {
        getLogger().severe(message);
    }

    public static void logWarning(String message, Exception ex) {
        getLogger().log(Level.WARNING, "{0}{1}", new Object[]{message, ex.getMessage()});
        printStackTrace(ex.getStackTrace());
    }

    public static void logSevere(String message, Exception ex) {
        getLogger().log(Level.SEVERE, "{0}{1}", new Object[]{message, ex.getMessage()});
        printStackTrace(ex.getStackTrace());
    }

    public static void logInfo(String message, Exception ex) {
        getLogger().log(Level.INFO, "{0}{1}", new Object[]{message, ex.getMessage()});
        printStackTrace(ex.getStackTrace());
    }

    public static Logger getLogger() {
        return Logger.getLogger("SCHEDULE");
    }

    public static synchronized void iniLoggerHandler() {
        if (instance == null) {
            instance = new LoggerHelper();
        }
    }

    @Override
    public void publish(LogRecord record) {
        String logRecord;
        logRecord = String.format(Record, dateFormat.format(new Date(record.getMillis())),
                record.getLevel().getName(),
                record.getSourceClassName(),
                record.getSourceMethodName(),
                record.getMessage());
        try {
            out.write(logRecord.getBytes("UTF-8"));
        } catch (IOException ex) {
            Logger.getLogger("com.practices.schedule").log(Level.SEVERE, "Error while writting in file", ex);
        }
        record.setMessage(logRecord);
        System.out.flush();
    }

    @Override
    public void flush() {
    }

    @Override
    public void close() throws SecurityException {
    }

    private static void printStackTrace(StackTraceElement[] stackTraceElement) {
        StringBuilder errorStackTrace = new StringBuilder();
        for (StackTraceElement element : stackTraceElement) {
            errorStackTrace.append(element);
            errorStackTrace.append("\n");
        }
        System.err.println(errorStackTrace.toString());
    }
    
    private synchronized void createNewLogFile() {
        logFile = new File(nameFormat.format(new Date()) + "_CInfo.log");
        try {
            out = new FileOutputStream(logFile);
            Logger.getLogger("com.practices.schedule").addHandler(this);
        } catch (FileNotFoundException ex) {
            Logger.getLogger("com.practices.schedule").log(Level.SEVERE, "Can' open a stream log file.", ex);
        }
    }
}
