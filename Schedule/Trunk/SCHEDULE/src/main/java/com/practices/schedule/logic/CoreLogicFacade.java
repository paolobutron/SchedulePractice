
package com.practices.schedule.logic;

import com.practices.schedule.exceptions.ProcessException;
import com.practices.schedule.model.ClassInformation;
import com.practices.schedule.model.Student;
import com.practices.schedule.model.StudentClassPeriod;
import com.practices.schedule.persistence.CoreDAO;
import com.practices.schedule.persistence.ICoreDAO;
import com.practices.schedule.utils.LoggerHelper;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pbutron
 */
public class CoreLogicFacade implements ICoreLogicFacade {

    private final ICoreDAO coreDAO;

    public CoreLogicFacade() {
        coreDAO = new CoreDAO();
    }

    public CoreLogicFacade(ICoreDAO coreDAO) {
        this.coreDAO = coreDAO;
    }

    @Override
    public void saveStudent(Student student) throws ProcessException {
        try {
            coreDAO.saveStudent(student);            
        } catch (SQLException ex) {
            LoggerHelper.logSevere("(CoreLogicFacade - saveStudent) Error while save student." + ex);
            throw new ProcessException("Error al guardar estudiante");
        }
    }

    @Override
    public void updateStudent(Student student) throws ProcessException {
        try {
            coreDAO.updateStudent(student);            
        } catch (SQLException ex) {
            LoggerHelper.logSevere("(CoreLogicFacade - updateStudent) Error while update student." + ex);
            throw new ProcessException("Error al actualizar estudiante");
        }
    }

    @Override
    public void deleteStudent(String studentId) throws ProcessException {
        try {
            coreDAO.deleteStudent(studentId);            
        } catch (SQLException ex) {
            LoggerHelper.logSevere("(CoreLogicFacade - deleteStudent) Error while delete student." + ex);
            throw new ProcessException("Error al eliminar estudiante");
        }
    }

    @Override
    public List<Student> retrieveStudents(String classCode, String period, boolean retrieveAll) throws ProcessException {
        List<Student> result = new ArrayList<>();
        try {
            result = coreDAO.retrieveStudents(classCode, period, retrieveAll);            
        } catch (SQLException ex) {
            LoggerHelper.logSevere("(CoreLogicFacade - retrieveStudents) Error while retrieve students." + ex);
            throw new ProcessException("Error al recuperar estudiantes");
        }
        return result;
    }

    @Override
    public void saveClass(ClassInformation classInfo) throws ProcessException {
        try {
            coreDAO.saveClass(classInfo);            
        } catch (SQLException ex) {
            LoggerHelper.logSevere("(CoreLogicFacade - saveClass) Error while save class." + ex);
            throw new ProcessException("Error al guardar clase");
        }
    }

    @Override
    public void updateClass(ClassInformation classInfo) throws ProcessException {
        try {
            coreDAO.updateClass(classInfo);            
        } catch (SQLException ex) {
            LoggerHelper.logSevere("(CoreLogicFacade - updateClass) Error while update class." + ex);
            throw new ProcessException("Error al actualizar clase");
        }
    }

    @Override
    public void deleteClass(String classCode) throws ProcessException {
        try {
            coreDAO.deleteClass(classCode);            
        } catch (SQLException ex) {
            LoggerHelper.logSevere("(CoreLogicFacade - deleteClass) Error while delete class." + ex);
            throw new ProcessException("Error al eliminar clase");
        }
    }

    @Override
    public List<ClassInformation> retrieveClasses(String studentId, String period, boolean retrieveAll) throws ProcessException {
        List<ClassInformation> result = new ArrayList<>();
        try {
            result = coreDAO.retrieveClasses(studentId, period, retrieveAll);            
        } catch (SQLException ex) {
            LoggerHelper.logSevere("(CoreLogicFacade - retrieveClasses) Error while retrieve classes." + ex);
            throw new ProcessException("Error al recuperar clases");
        }
        return result;
    }

    @Override
    public void saveStudentInClass(StudentClassPeriod studentClass) throws ProcessException {
        try {
            coreDAO.saveStudentInClass(studentClass);            
        } catch (SQLException ex) {
            LoggerHelper.logSevere("(CoreLogicFacade - saveStudentInClass) Error while save student in class." + ex);
            throw new ProcessException("Error al guardar estudiante en clase");
        }
    }

    

}
