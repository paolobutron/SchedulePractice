
package com.practices.schedule.persistence;

import com.practices.schedule.model.ClassInformation;
import com.practices.schedule.model.Student;
import com.practices.schedule.model.StudentClassPeriod;
import com.practices.schedule.sql.util.ScheduleSqlQuery;
import com.practices.schedule.utils.LoggerHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pbutron
 */
public class CoreDAO extends AbstractDAO implements ICoreDAO {

    @Override
    public void saveStudent(Student student) throws SQLException {
        Connection connection = connectionPool.getConnection();

        try (PreparedStatement preparedStatement = connection.prepareStatement(ScheduleSqlQuery.insertStudentSQLQuery.toString())) {
            preparedStatement.setObject(1, student.getStudentId());
            preparedStatement.setString(SQL_QUERY_POSITION_2, student.getLastName());
            preparedStatement.setString(SQL_QUERY_POSITION_3, student.getFirstName());
            
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            LoggerHelper.logSevere("(CoreDAO - saveStudent) Error while saving student. " + ex);
            throw ex;
        } finally {
            connectionPool.returnConnection(connection);
        }
    }

    @Override
    public void updateStudent(Student student) throws SQLException {
        Connection conn = connectionPool.getConnection();

        try (PreparedStatement preparedStatement = conn.prepareStatement(ScheduleSqlQuery.updateStudentSQLQuery.toString())) {

            preparedStatement.setString(1, student.getLastName());
            preparedStatement.setString(SQL_QUERY_POSITION_2, student.getLastName());
            preparedStatement.setString(SQL_QUERY_POSITION_3, student.getStudentId());
            
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            LoggerHelper.logSevere("(CoreDAO - updateStudent)  error while update student. ", ex);
            throw ex;
        } finally {
            connectionPool.returnConnection(conn);
        }
    }

    @Override
    public void deleteStudent(String studentId) throws SQLException {
        Connection connection = connectionPool.getConnection();

        try (PreparedStatement preparedStatement = connection.prepareStatement(ScheduleSqlQuery.deleteStudentSQLQuery.toString())) {
            preparedStatement.setString(1, studentId);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            LoggerHelper.logSevere("(CoreDAO - deleteStudent) Error while delete Student. " + ex);
            throw ex;
        } finally {
            connectionPool.returnConnection(connection);
        }
    }

    @Override
    public List<Student> retrieveStudents(String classCode, String period, boolean retrieveAll) throws SQLException {
        String query = (retrieveAll) ? ScheduleSqlQuery.retrieveAllStudentsSQLQuery.toString() : ScheduleSqlQuery.retrieveStudentsByClassSQLQuery.toString();
        List<Student> result = new ArrayList<>();
        Connection connection = connectionPool.getConnection();
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            if(!retrieveAll) {
                preparedStatement.setString(1, classCode);
                preparedStatement.setString(SQL_QUERY_POSITION_2, period);
            }
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    String studentId = resultSet.getString("student_id");
                    String lastName = resultSet.getString("last_name");
                    String firstName = resultSet.getString("last_name");
                    Student student = new Student(studentId, lastName, firstName);
                    result.add(student);
                }
            }
        } catch (SQLException ex) {
            LoggerHelper.logSevere("(CoreDAO - retrieveStudents) Error while retriving students. " + ex);
            throw ex;
        } finally {
            connectionPool.returnConnection(connection);
        }
        return result;
    }

    @Override
    public void saveClass(ClassInformation classInfo) throws SQLException {
        Connection connection = connectionPool.getConnection();

        try (PreparedStatement preparedStatement = connection.prepareStatement(ScheduleSqlQuery.insertClassSQLQuery.toString())) {
            preparedStatement.setObject(1, classInfo.getClassCode());
            preparedStatement.setString(SQL_QUERY_POSITION_2, classInfo.getTitle());
            preparedStatement.setString(SQL_QUERY_POSITION_3, classInfo.getDescription());
            
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            LoggerHelper.logSevere("(CoreDAO - saveClass) Error while saving class. " + ex);
            throw ex;
        } finally {
            connectionPool.returnConnection(connection);
        }
    }

    @Override
    public void updateClass(ClassInformation classInfo) throws SQLException {
        Connection conn = connectionPool.getConnection();

        try (PreparedStatement preparedStatement = conn.prepareStatement(ScheduleSqlQuery.updateStudentSQLQuery.toString())) {

            preparedStatement.setString(1, classInfo.getTitle());
            preparedStatement.setString(SQL_QUERY_POSITION_2, classInfo.getDescription());
            preparedStatement.setString(SQL_QUERY_POSITION_3, classInfo.getClassCode());
            
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            LoggerHelper.logSevere("(CoreDAO - updateClass)  error while update class. ", ex);
            throw ex;
        } finally {
            connectionPool.returnConnection(conn);
        }
    }

    @Override
    public void deleteClass(String classCode) throws SQLException {
        Connection connection = connectionPool.getConnection();

        try (PreparedStatement preparedStatement = connection.prepareStatement(ScheduleSqlQuery.deleteClassSQLQuery.toString())) {
            preparedStatement.setString(1, classCode);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            LoggerHelper.logSevere("(CoreDAO - deleteClass) Error while delete Class. " + ex);
            throw ex;
        } finally {
            connectionPool.returnConnection(connection);
        }
    }

    @Override
    public List<ClassInformation> retrieveClasses(String studentId, String period, boolean retrieveAll) throws SQLException {
        String query = (retrieveAll) ? ScheduleSqlQuery.retrieveAllClassesSQLQuery.toString() : ScheduleSqlQuery.retrieveClassesByStudentSQLQuery.toString();
        List<ClassInformation> result = new ArrayList<>();
        Connection connection = connectionPool.getConnection();
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            if(!retrieveAll) {
                preparedStatement.setString(1, studentId);
                preparedStatement.setString(SQL_QUERY_POSITION_2, period);
            }
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    String classCode = resultSet.getString("class_code");
                    String title = resultSet.getString("title");
                    String description = resultSet.getString("description");
                    ClassInformation classInfo = new ClassInformation(classCode, title, description);
                    result.add(classInfo);
                }
            }
        } catch (SQLException ex) {
            LoggerHelper.logSevere("(CoreDAO - retrieveClasses) Error while retriving classes. " + ex);
            throw ex;
        } finally {
            connectionPool.returnConnection(connection);
        }
        return result;
    }

    @Override
    public void saveStudentInClass(StudentClassPeriod studentClass) throws SQLException {
        Connection connection = connectionPool.getConnection();

        try (PreparedStatement preparedStatement = connection.prepareStatement(ScheduleSqlQuery.insertStudentClassPeriodSQLQuery.toString())) {
            preparedStatement.setObject(1, studentClass.getStudentId());
            preparedStatement.setString(SQL_QUERY_POSITION_2, studentClass.getClassCode());
            preparedStatement.setString(SQL_QUERY_POSITION_3, studentClass.getPeriod());
            
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            LoggerHelper.logSevere("(CoreDAO - saveStudentInClass) Error while saving student in class. " + ex);
            throw ex;
        } finally {
            connectionPool.returnConnection(connection);
        }
    }

    
}
