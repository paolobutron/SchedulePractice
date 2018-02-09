
package com.practices.schedule.persistence;

import com.practices.schedule.model.ClassInformation;
import com.practices.schedule.model.Student;
import com.practices.schedule.model.StudentClassPeriod;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author pbutron
 */
public interface ICoreDAO {

    void saveStudent(Student student) throws SQLException;
    
    void updateStudent(Student student) throws SQLException;
    
    void deleteStudent(String studentId) throws SQLException;
    
    List<Student> retrieveStudents(String classCode, String period, boolean retrieveAll) throws SQLException;
    
    void saveClass(ClassInformation classInfo) throws SQLException;
    
    void updateClass(ClassInformation classInfo) throws SQLException;
    
    void deleteClass(String classCode) throws SQLException;
    
    List<ClassInformation> retrieveClasses(String studentId, String period, boolean retrieveAll) throws SQLException;
    
    void saveStudentInClass(StudentClassPeriod studentClass) throws SQLException;
    
}
