
package com.practices.schedule.model;

import java.io.Serializable;

/**
 *
 * @author pbutron
 */
public class StudentClassPeriod implements Serializable {
    
    private String studentId;
    private String classCode;
    private String period;

    public StudentClassPeriod() {
        this.studentId = "";
        this.classCode = "";
        this.period = "";
    }

    public StudentClassPeriod(String studentId, String classCode, String period) {
        this.studentId = studentId;
        this.classCode = classCode;
        this.period = period;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getClassCode() {
        return classCode;
    }

    public void setClassCode(String classCode) {
        this.classCode = classCode;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }
    
}
