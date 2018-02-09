
package com.practices.schedule.sql.util;

/**
 *
 * @author pbutron
 */
public class ScheduleTables {

    public enum StudentColumns {

        studentId("student_id"),
        lastName("last_name"),
        firstName("first_name");
        
        private final String columnName;

        private StudentColumns(String columnName) {
            this.columnName = columnName;
        }

        @Override
        public String toString() {
            return columnName;
        }
    }
    
    public enum ClassInformationColumns {

        classCode("class_code"),
        title("title"),
        description("description");
        

        private final String columnName;

        private ClassInformationColumns(String columnName) {
            this.columnName = columnName;
        }

        @Override
        public String toString() {
            return columnName;
        }
    }
    
    public enum StudentClassPeriodColumns {

        studentId("student_id"),
        classCode("class_code"),
        period("period");
        
        private final String columnName;

        private StudentClassPeriodColumns(String columnName) {
            this.columnName = columnName;
        }

        @Override
        public String toString() {
            return columnName;
        }
    }

}
