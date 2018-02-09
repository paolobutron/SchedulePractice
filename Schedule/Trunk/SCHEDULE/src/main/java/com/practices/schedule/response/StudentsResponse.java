
package com.practices.schedule.response;

import com.practices.schedule.model.Student;
import java.util.List;

/**
 *
 * @author pbutron
 */
public class StudentsResponse extends BooleanResponse {

    private List<Student> studentsList;

    public StudentsResponse(int errorCode, String message) {
        super(errorCode, message);
    }

    public List<Student> getStudentsList() {
        return studentsList;
    }

    public void setStudentsList(List<Student> studentsList) {
        this.studentsList = studentsList;
    }
    
}
