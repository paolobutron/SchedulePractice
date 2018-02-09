
package com.practices.schedule.logic;

import com.practices.schedule.exceptions.ProcessException;
import com.practices.schedule.model.Student;
import com.practices.schedule.persistence.ICoreDAO;
import java.sql.SQLException;
import static org.easymock.EasyMock.*;
import static org.easymock.classextension.EasyMock.createNiceMock;
import static org.easymock.classextension.EasyMock.replay;
import static org.easymock.classextension.EasyMock.verify;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 *
 * @author pbutron
 */
public class CoreLogicTest {

    private final ICoreDAO coreDao;

    public CoreLogicTest() {
        coreDao = createNiceMock(ICoreDAO.class);
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }
    
    @Test
    public void testSaveStudent_CheckCorrectCallsAreMade() throws ProcessException, SQLException {
        System.out.println("testSaveStudent_CheckCorrectCallsAreMade");


        coreDao.saveStudent(isA(Student.class));
        expectLastCall().times(1);

        replay(coreDao);
        ICoreLogicFacade instance = new CoreLogicFacade(coreDao);
        instance.saveStudent(new Student("test", "test", "test"));
        verify(coreDao);
    }

    /*@Test
    public void testRetrieveMobileDUFReport_CheckAllCallsAreMade() throws Exception {
        System.out.println("testRetrieveMobileDUFReport_CheckAllCallsAreMade");
        String period = "";

        expect(dufDafDao.retrieveDUFReportByPeriodAndTypes(isA(String.class))).andReturn(null);

        List<DUF> expResult = null;

        replay(dufDafDao, securityDAOMock);
        DufDafLogic instance = new DufDafLogic(dufDafDao, securityDAOMock, reportsDao);
        List<DUF> result = instance.retrieveReportsByPeriodAndType(period);
        assertEquals(expResult, result);

        verify(dufDafDao, securityDAOMock);
    }

    @Test
    public void testRetrieveManualReportPaperworkNumbers_checkCallsAreMade() throws SQLException, ProcessException {
        System.out.println("testRetrieveManualReportPaperworkNumbers_checkCallsAreMade");

        List<String> paperworkNumbersList = new ArrayList<>();
        expect(reportsDao.retrieveManualReportPaperworkNumbers()).andReturn(paperworkNumbersList).times(1);
        replay(reportsDao);

        DufDafLogic instance = new DufDafLogic(dufDafDao, securityDAOMock, reportsDao);
        List<String> result = instance.retrieveManualReportPaperworkNumbers();
        verify(reportsDao);
        assertNotNull(result);
    }

    @Test
    public void testRetrieveManualPaperWorkReportByNumerAndType_CheckCorrectCallsAreMade() throws ProcessException, ValidationException, SQLException {
        System.out.println("testRetrieveManualPaperWorkReportByNumerAndType_CheckCorrectCallsAreMade");

        List<RadioLinkSummary> list = new ArrayList<>();

        expect(reportsDao.retrieveManualPaperworkReportByNumberAndType(isA(String.class), anyBoolean())).andReturn(list).times(1);

        replay(reportsDao);
        DufDafLogic instance = new DufDafLogic(dufDafDao, securityDAOMock, reportsDao);
        instance.retrieveManualPaperWorkReportByNumerAndType("", true);
        verify(reportsDao);
    }

    @Test
    public void testGetManualDufPaperworkPeriods_CheckCorrectCallsAreMade() throws ProcessException, ValidationException, SQLException {
        System.out.println("testGetManualDufPaperworkPeriods_CheckCorrectCallsAreMade");

        List<String> periodsList = new ArrayList<>();

        expect(dufDafDao.retrieveManualPaperworkReportsPeriods(true, "T_043")).andReturn(periodsList).times(1);

        replay(dufDafDao);
        DufDafLogic instance = new DufDafLogic(dufDafDao, securityDAOMock, reportsDao);
        instance.retrieveManualDufPaperworkPeriods(true, "T_043");
        verify(dufDafDao);
    }

    @Test
    public void testRetrieveManualPaperworkDufNumbers_CheckCorrectCallsAreMade() throws ProcessException, ValidationException, SQLException {
        System.out.println("testRetrieveManualPaperworkDufNumbers_CheckCorrectCallsAreMade");

        List<String> paperworkNumbersList = new ArrayList<>();

        expect(dufDafDao.retrieveManualPaperworkDufNumbers(anyBoolean())).andReturn(paperworkNumbersList).times(1);

        replay(dufDafDao);
        DufDafLogic instance = new DufDafLogic(dufDafDao, securityDAOMock, reportsDao);
        instance.retrieveManualPaperworkDufNumbers(true);
        verify(dufDafDao);
    }
    
    
     @Test
    public void testretirvePdfFile_CheckCorrectCallsAreMade() throws ProcessException, ValidationException, SQLException {
        System.out.println("testretirvePdfFile_CheckCorrectCallsAreMade");


        expect(dufDafDao.retrievePDFFile(isA(String.class),isA(String.class))).andReturn(null).times(1);

        replay(dufDafDao);
        DufDafLogic instance = new DufDafLogic(dufDafDao, securityDAOMock, reportsDao);
        instance.createPdfFile("","");
        verify(dufDafDao);
    }
    @Test
    public void testsaveAnnualDuf_CheckCorrectCallsAreMade() throws ProcessException, ValidationException, SQLException {
        System.out.println("testsaveAnnualDuf_CheckCorrectCallsAreMade");

        List<ReportSummaryInfo> annualDufList = new ArrayList<>();
        Map<String, ReportSummaryInfo> annualDufMap = new HashMap<>();
        ReportSummaryInfo annualDuf = new ReportSummaryInfo("test", BigDecimal.ZERO, "test", "test", 0);
        annualDufList.add(annualDuf);
        annualDufMap.put("test", annualDuf);
        
        expect(dufDafDao.retrieveAnnualDufInfoByPeriod(isA(String.class))).andReturn(annualDufMap).times(1);
        dufDafDao.saveAnnualDuf(isA(ArrayList.class));        
        expectLastCall().times(1);

        replay(dufDafDao);
        DufDafLogic instance = new DufDafLogic(dufDafDao, securityDAOMock, reportsDao);
        instance.saveAnnualDuf(annualDufList);
        verify(dufDafDao);
    }
     
    @Test
    public void testRetrieveDUFBalance_CheckCorrectCallsAreMade() throws ProcessException, SQLException {
        System.out.println("testRetrieveManualPaperworkDufNumbers_CheckCorrectCallsAreMade");

        DUFBalance dufBalance = new DUFBalance("","",0.0,1);

        expect(dufDafDao.retrieveDUFBalance(isA(String.class),isA(String.class))).andReturn(dufBalance).times(1);

        replay(dufDafDao);
        DufDafLogic instance = new DufDafLogic(dufDafDao, securityDAOMock, reportsDao);
        instance.retrieveDUFBalance("","");
        verify(dufDafDao);
    }
    
    @Test
    public void testSaveDUFBalance_CheckCorrectCallsAreMade() throws ProcessException, SQLException {
        System.out.println("testsavePdfFile_CheckCorrectCallsAreMade");


        dufDafDao.saveDUFBalance(isA(DUFBalance.class));
        expectLastCall().times(1);

        replay(dufDafDao);
        DufDafLogic instance = new DufDafLogic(dufDafDao, securityDAOMock, reportsDao);
        instance.saveDUFBalance(new DUFBalance("","",0.0,1));
        verify(dufDafDao);
    }
    
    @Test
    public void testRetrieveAnnualDufInfoByPeriod_CheckCorrectCallsAreMade() throws ProcessException, SQLException {
        System.out.println("testRetrieveManualPaperworkDufNumbers_CheckCorrectCallsAreMade");

        Map<String, ReportSummaryInfo> result = new HashMap<>();

        expect(dufDafDao.retrieveAnnualDufInfoByPeriod(isA(String.class))).andReturn(result).times(1);

        replay(dufDafDao);
        DufDafLogic instance = new DufDafLogic(dufDafDao, securityDAOMock, reportsDao);
        instance.retrieveAnnualDufInfoByPeriod("");
        verify(dufDafDao);
    }    */
}
