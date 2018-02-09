
package com.practices.schedule.model;

import java.io.Serializable;

/**
 *
 * @author pbutron
 */
public class Student implements Serializable {
    
    private String studentId;
    private String lastName;
    private String firstName;

    public Student() {
        this.studentId = "";
        this.lastName = "";
        this.firstName = "";
    }

    public Student(String studentId, String lastName, String firstName) {
        this.studentId = studentId;
        this.lastName = lastName;
        this.firstName = firstName;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
}
