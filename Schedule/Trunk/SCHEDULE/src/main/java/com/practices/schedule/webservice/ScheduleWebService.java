/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.practices.schedule.webservice;

import com.practices.schedule.exceptions.ProcessException;
import com.practices.schedule.logic.CoreLogicFacade;
import com.practices.schedule.logic.ICoreLogicFacade;
import com.practices.schedule.model.ClassInformation;
import com.practices.schedule.model.Student;
import com.practices.schedule.response.BooleanResponse;
import com.practices.schedule.response.ClassesResponse;
import com.practices.schedule.response.StudentsResponse;
import com.practices.schedule.utils.LoggerHelper;
import com.practices.schedule.utils.ScheduleConstants;
import java.util.List;
import javax.ws.rs.core.Context;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.enterprise.context.RequestScoped;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author pbutron
 */
@Path("schedules")
@RequestScoped
public class ScheduleWebService {

    @Context
    private HttpServletRequest request;
    private final ICoreLogicFacade coreLogicFacade;

    /**
     * Creates a new instance of ScheduleWebService
     */
    public ScheduleWebService() {
        coreLogicFacade = new CoreLogicFacade();
    }

    public ScheduleWebService(HttpServletRequest request, ICoreLogicFacade coreLogicFacade) {
        this.request = request;
        this.coreLogicFacade = coreLogicFacade;
    }

    /**
     * Retrieves representation of an instance of
     * com.practices.schedule.webservice.ScheduleWebService
     *
     * @param studentId
     * @param lastName
     * @param firstName
     * @return
     */
    @POST
    @Path("saveStudent")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public BooleanResponse saveStudent(@QueryParam("studentId") String studentId,
            @QueryParam("lastName") String lastName, @QueryParam("firstName") String firstName) {

        BooleanResponse response = new BooleanResponse(ScheduleConstants.WS_OK_RESPONSE, "");
        Student student = new Student(studentId, lastName, firstName);
        try {
            coreLogicFacade.saveStudent(student);
        } catch (ProcessException ex) {
            LoggerHelper.logWarning("Ocurrio un error al ejecutar el servicio "
                    + "'saveStudent': " + ex.getMessage(), ex);
            response = new BooleanResponse(ScheduleConstants.WS_FAILED_RESPONSE, ex.getMessage());
        }

        return response;
    }
    
    /**
     * Retrieves representation of an instance of
     * com.practices.schedule.webservice.ScheduleWebService
     *
     * @param studentId
     * @param lastName
     * @param firstName
     * @return
     */
    @POST
    @Path("updateStudent")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public BooleanResponse updateStudent(@QueryParam("studentId") String studentId,
            @QueryParam("lastName") String lastName, @QueryParam("firstName") String firstName) {

        BooleanResponse response = new BooleanResponse(ScheduleConstants.WS_OK_RESPONSE, "");
        Student student = new Student(studentId, lastName, firstName);
        try {
            coreLogicFacade.updateStudent(student);
        } catch (ProcessException ex) {
            LoggerHelper.logWarning("Ocurrio un error al ejecutar el servicio "
                    + "'updateStudent': " + ex.getMessage(), ex);
            response = new BooleanResponse(ScheduleConstants.WS_FAILED_RESPONSE, ex.getMessage());
        }

        return response;
    }
    
    /**
     * Retrieves representation of an instance of
     * com.practices.schedule.webservice.ScheduleWebService
     *
     * @param studentId
     * @return
     */
    @POST
    @Path("deleteStudent")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public BooleanResponse deleteStudent(@QueryParam("studentId") String studentId) {

        BooleanResponse response = new BooleanResponse(ScheduleConstants.WS_OK_RESPONSE, "");
        try {
            coreLogicFacade.deleteStudent(studentId);
        } catch (ProcessException ex) {
            LoggerHelper.logWarning("Ocurrio un error al ejecutar el servicio "
                    + "'deleteStudent': " + ex.getMessage(), ex);
            response = new BooleanResponse(ScheduleConstants.WS_FAILED_RESPONSE, ex.getMessage());
        }

        return response;
    }
    
    /**
     * Retrieves representation of an instance of
     * com.practices.schedule.webservice.ScheduleWebService
     *
     * @return
     */
    @POST
    @Path("retrieveAllStudents")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public StudentsResponse retrieveAllStudents() {
        StudentsResponse response = new StudentsResponse(ScheduleConstants.WS_OK_RESPONSE, "");
        try {
            List<Student> result = coreLogicFacade.retrieveStudents(null, null, true);
            response.setStudentsList(result);
        } catch (ProcessException ex) {
            LoggerHelper.logWarning("Ocurrio un error al ejecutar el servicio "
                    + "'retrieveAllStudents': " + ex.getMessage(), ex);
            response = new StudentsResponse(ScheduleConstants.WS_FAILED_RESPONSE, ex.getMessage());
        }

        return response;
    }
    
    /**
     * Retrieves representation of an instance of
     * com.practices.schedule.webservice.ScheduleWebService
     *
     * @param classCode
     * @param period
     * @return
     */
    @POST
    @Path("retrieveStudentsByClassAndPeriod")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public StudentsResponse retrieveStudentsByClassAndPeriod(@QueryParam("classCode") String classCode, 
            @QueryParam("period") String period) {
        StudentsResponse response = new StudentsResponse(ScheduleConstants.WS_OK_RESPONSE, "");
        try {
            List<Student> result = coreLogicFacade.retrieveStudents(classCode, period, false);
            response.setStudentsList(result);
        } catch (ProcessException ex) {
            LoggerHelper.logWarning("Ocurrio un error al ejecutar el servicio "
                    + "'retrieveStudentsByClassAndPeriod': " + ex.getMessage(), ex);
            response = new StudentsResponse(ScheduleConstants.WS_FAILED_RESPONSE, ex.getMessage());
        }

        return response;
    }
    
    
    
    
    
    
    
    
    /**
     * Retrieves representation of an instance of
     * com.practices.schedule.webservice.ScheduleWebService
     *
     * @param classCode
     * @param title
     * @param description
     * @return
     */
    @POST
    @Path("saveClass")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public BooleanResponse saveClass(@QueryParam("classCode") String classCode,
            @QueryParam("title") String title, @QueryParam("description") String description) {

        BooleanResponse response = new BooleanResponse(ScheduleConstants.WS_OK_RESPONSE, "");
        ClassInformation classInfo = new ClassInformation(classCode, title, description);
        try {
            coreLogicFacade.saveClass(classInfo);
        } catch (ProcessException ex) {
            LoggerHelper.logWarning("Ocurrio un error al ejecutar el servicio "
                    + "'saveClass': " + ex.getMessage(), ex);
            response = new BooleanResponse(ScheduleConstants.WS_FAILED_RESPONSE, ex.getMessage());
        }

        return response;
    }
    
    /**
     * Retrieves representation of an instance of
     * com.practices.schedule.webservice.ScheduleWebService
     *
     * @param classCode
     * @param title
     * @param description
     * @return
     */
    @POST
    @Path("updateClass")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public BooleanResponse updateClass(@QueryParam("classCode") String classCode,
            @QueryParam("title") String title, @QueryParam("description") String description) {

        BooleanResponse response = new BooleanResponse(ScheduleConstants.WS_OK_RESPONSE, "");
        ClassInformation classInfo = new ClassInformation(classCode, title, description);
        try {
            coreLogicFacade.updateClass(classInfo);
        } catch (ProcessException ex) {
            LoggerHelper.logWarning("Ocurrio un error al ejecutar el servicio "
                    + "'updateClass': " + ex.getMessage(), ex);
            response = new BooleanResponse(ScheduleConstants.WS_FAILED_RESPONSE, ex.getMessage());
        }

        return response;
    }
    
    /**
     * Retrieves representation of an instance of
     * com.practices.schedule.webservice.ScheduleWebService
     *
     * @param classCode
     * @return
     */
    @POST
    @Path("deleteClass")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public BooleanResponse deleteClass(@QueryParam("classCode") String classCode) {

        BooleanResponse response = new BooleanResponse(ScheduleConstants.WS_OK_RESPONSE, "");
        try {
            coreLogicFacade.deleteClass(classCode);
        } catch (ProcessException ex) {
            LoggerHelper.logWarning("Ocurrio un error al ejecutar el servicio "
                    + "'deleteClass': " + ex.getMessage(), ex);
            response = new BooleanResponse(ScheduleConstants.WS_FAILED_RESPONSE, ex.getMessage());
        }

        return response;
    }
    
    /**
     * Retrieves representation of an instance of
     * com.practices.schedule.webservice.ScheduleWebService
     *
     * @return
     */
    @POST
    @Path("retrieveAllClasses")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public ClassesResponse retrieveAllClasses() {
        ClassesResponse response = new ClassesResponse(ScheduleConstants.WS_OK_RESPONSE, "");
        try {
            List<ClassInformation> result = coreLogicFacade.retrieveClasses(null, null, true);
            response.setClassesList(result);
        } catch (ProcessException ex) {
            LoggerHelper.logWarning("Ocurrio un error al ejecutar el servicio "
                    + "'retrieveAllClasses': " + ex.getMessage(), ex);
            response = new ClassesResponse(ScheduleConstants.WS_FAILED_RESPONSE, ex.getMessage());
        }

        return response;
    }
    
    /**
     * Retrieves representation of an instance of
     * com.practices.schedule.webservice.ScheduleWebService
     *
     * @param studentId
     * @param period
     * @return
     */
    @POST
    @Path("retrieveClassesByStudentAndPeriod")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public ClassesResponse retrieveClassesByStudentAndPeriod(@QueryParam("studentId") String studentId, 
            @QueryParam("period") String period) {
        ClassesResponse response = new ClassesResponse(ScheduleConstants.WS_OK_RESPONSE, "");
        try {
            List<ClassInformation> result = coreLogicFacade.retrieveClasses(studentId, period, false);
            response.setClassesList(result);
        } catch (ProcessException ex) {
            LoggerHelper.logWarning("Ocurrio un error al ejecutar el servicio "
                    + "'retrieveClassesByStudentAndPeriod': " + ex.getMessage(), ex);
            response = new ClassesResponse(ScheduleConstants.WS_FAILED_RESPONSE, ex.getMessage());
        }

        return response;
    }
    
}
