
package com.practices.schedule.sql.util;

/**
 *
 * @author pbutron
 */
public enum ScheduleSqlQuery {

    insertStudentSQLQuery("INSERT INTO schedule.student VALUES (?, ?, ?)"),
    updateStudentSQLQuery("UPDATE schedule.student a set a.last_name = ?, a.first_name = ? where a.student_id = ?;"),
    deleteStudentSQLQuery("DELETE FROM schedule.student a, schedule.student_class_period b FROM a INNER JOIN b ON a.student_id = b.student_id WHERE a.student_id = ?;"),
    retrieveAllStudentsSQLQuery("SELECT * FROM schedule.student;"),
    retrieveStudentSQLQuery("SELECT * FROM schedule.student where student_id = ?;"),
    
    insertClassSQLQuery("INSERT INTO schedule.class_information VALUES (?, ?, ?)"),
    updateClassSQLQuery("UPDATE schedule.class_information a set a.title = ?, a.description = ? where a.class_code = ?;"),
    deleteClassSQLQuery("DELETE FROM schedule.class_information a, schedule.student_class_period b FROM a INNER JOIN b ON a.class_code = b.class_code WHERE a.class_code = ?;"),
    retrieveAllClassesSQLQuery("SELECT * FROM schedule.class_information;"),
    retrieveClassSQLQuery("SELECT * FROM schedule.class_information where class_code = ?;"),
    
    insertStudentClassPeriodSQLQuery("INSERT INTO schedule.student_class_period VALUES (?, ?, ?)"),
    deleteStudentClassPeriodByStudentSQLQuery("DELETE FROM schedule.student_class_period where student_id = ?;"),
    deleteStudentClassPeriodByClassSQLQuery("DELETE FROM schedule.student_class_period where class_code = ?;"),
    retrieveStudentsByClassSQLQuery("SELECT * FROM schedule.student a, schedule.student_class_period b "
            + "WHERE a.student_id = b.student_id AND b.class_code = ? AND b.period = ?;"),
    retrieveClassesByStudentSQLQuery("SELECT * FROM schedule.class_information a, schedule.student_class_period b "
            + "WHERE a.class_code = b.class_code AND b.student_id = ? AND b.period = ?;");

    protected String name;

    private ScheduleSqlQuery(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return name;
    }

}
