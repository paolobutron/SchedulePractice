
package com.practices.schedule.logic;

import com.practices.schedule.exceptions.ProcessException;
import com.practices.schedule.model.ClassInformation;
import com.practices.schedule.model.Student;
import com.practices.schedule.model.StudentClassPeriod;
import java.util.List;

/**
 *
 * @author pbutron
 */
public interface ICoreLogicFacade {

    void saveStudent(Student student) throws ProcessException;
    
    void updateStudent(Student student) throws ProcessException;
    
    void deleteStudent(String studentId) throws ProcessException;
    
    List<Student> retrieveStudents(String classCode, String period, boolean retrieveAll) throws ProcessException;
    
    void saveClass(ClassInformation classInfo) throws ProcessException;
    
    void updateClass(ClassInformation classInfo) throws ProcessException;
    
    void deleteClass(String classCode) throws ProcessException;
    
    List<ClassInformation> retrieveClasses(String studentId, String period, boolean retrieveAll) throws ProcessException;
    
    void saveStudentInClass(StudentClassPeriod studentClass) throws ProcessException;
}
