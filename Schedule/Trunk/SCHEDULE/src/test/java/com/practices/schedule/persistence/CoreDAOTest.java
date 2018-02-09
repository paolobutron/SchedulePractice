
package com.practices.schedule.persistence;

import com.practices.connection.IMultipleConnectionPool;
import com.practices.schedule.model.Student;
import com.practices.schedule.utils.Utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author pbutron
 */
public class CoreDAOTest {

    private final CoreDAO coreDAO = new CoreDAO();
    private final IMultipleConnectionPool connectionPool = coreDAO.getPoolConnection();

    @Test
    public void testSaveStudent_CheckIfDataWasSaved() throws Exception {

        System.out.println("testSaveStudent_CheckIfDataWasSaved");
        Connection connection = connectionPool.getConnection();
        String studentId = Utils.generateUniqueId();

        try {
            Student student = new Student(studentId, "lastName1", "firstName1");
            coreDAO.saveStudent(student);

            String query = "select * from schedule.student where student_id = ?;";

            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, studentId);
                try (ResultSet rs = preparedStatement.executeQuery()) {
                    if (rs.next()) {
                        assertEquals(studentId, rs.getInt("student_id"));
                        assertEquals("lastName1", rs.getInt("last_name"));
                        assertEquals("firstName1", rs.getInt("first_name"));
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoreDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            deleteStudent(studentId);
            connectionPool.returnConnection(connection);
        }
    }

    /*@Test
    public void testRetieveWimaxAnnualBandDUFReport_CheckIfDataIsRetrieved() throws Exception {

        System.out.println("testRetieveWimaxAnnualBandDUFReport_CheckIfDataIsRetrieved");
        Connection connection = connectionPool.getConnection();
        int dufId = Utils.nextSequenceNumber();

        try {
            BasicInformation basicInformation = new BasicInformation("MW", "Radioenlace", 0, 0, 0, 0);
            DufCalculations dufCalculations = new DufCalculations(0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
            TechnicalInformation technicalInformation = new TechnicalInformation(0.0, 0.0, 0, 0.0, 0);
            AdditionalInformation additionalInformation = new AdditionalInformation(0, "LA PAZ", "201401", "DUF_ANUAL_AB_WIMAX_201401");
            DUF duf1 = new DUF(basicInformation, dufCalculations, technicalInformation, additionalInformation, dufId);
            coreDAO.saveDufDafReport(duf1);
            DUF duf2 = new DUF(basicInformation, dufCalculations, technicalInformation, additionalInformation, dufId + 1);
            coreDAO.saveDufDafReport(duf2);
            DUF duf3 = new DUF(basicInformation, dufCalculations, technicalInformation, additionalInformation, dufId + 2);
            coreDAO.saveDufDafReport(duf3);

            List<DUF> dufList = coreDAO.retrieveDUFReportByPeriodAndTypes("201401",
                    new String[]{AbstractReport.DUF_ANUAL_AB_WIMAX_REPORT_TYPE});

            assertEquals(3, dufList.size());

        } catch (SQLException ex) {
            Logger.getLogger(DufDafReportDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            deleteDUF(dufId);
            deleteDUF(dufId + 1);
            deleteDUF(dufId + 2);
            connectionPool.returnConnection(connection);
        }
    }

    @Test(expected = IllegalArgumentException.class)
    public void testRetieveWimaxAnnualBandDUFReport_checkThrowsIllegalArgumentExceptionWhenPeriodIsNull() throws SQLException {
        System.out.println("testRetieveWimaxAnnualBandDUFReport_checkThrowsIllegalArgumentExceptionWhenPeriodIsNull");
        coreDAO.retrieveDUFReportByPeriodAndTypes(null);
    }

    @Test
    public void testRetrieveWimaxAnnualTerminalsAndRadiobasesReport_CheckIfDataIsRetrieved() throws Exception {

        System.out.println("testRetrieveWimaxAnnualTerminalsAndRadiobasesReport_CheckIfDataIsRetrieved");
        Connection connection = connectionPool.getConnection();
        int dufId = Utils.nextSequenceNumber();

        try {
            BasicInformation basicInformation = new BasicInformation("MW", "Radioenlace", 0, 0, 0, 0);
            DufCalculations dufCalculations = new DufCalculations(0.0, 0.0, 0.0, 0.0, 0.0, 5.5);
            TechnicalInformation technicalInformation = new TechnicalInformation(0.0, 0.0, 0, 0.0, 0);
            AdditionalInformation additionalInformation = new AdditionalInformation(0, "LA PAZ", "201401", "DUF_ANUAL_RBS_WIMAX_201401");
            AdditionalInformation additionalInformation2 = new AdditionalInformation(0, "LA PAZ", "201401", "DUF_ANUAL_TERM_WIMAX_201401");
            DUF duf1 = new DUF(basicInformation, dufCalculations, technicalInformation, additionalInformation, dufId);
            coreDAO.saveDufDafReport(duf1);
            DUF duf2 = new DUF(basicInformation, dufCalculations, technicalInformation, additionalInformation2, dufId + 1);
            coreDAO.saveDufDafReport(duf2);
            DUF duf3 = new DUF(basicInformation, dufCalculations, technicalInformation, additionalInformation, dufId + 2);
            coreDAO.saveDufDafReport(duf3);

            List<DUF> dufList = coreDAO.retrieveDUFReportByPeriodAndTypes("201401",
                    new String[]{AbstractReport.DUF_ANUAL_RBS_WIMAX_REPORT_TYPE, AbstractReport.DUF_ANUAL_TERM_WIMAX_REPORT_TYPE});

            assertEquals(3, dufList.size());
            assertEquals(new Double(5.5), dufList.get(0).getDufCalculations().getDuft());
            assertEquals(new Double(5.5), dufList.get(1).getDufCalculations().getDuft());

        } catch (SQLException ex) {
            Logger.getLogger(DufDafReportDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            deleteDUF(dufId);
            deleteDUF(dufId + 1);
            deleteDUF(dufId + 2);
            connectionPool.returnConnection(connection);
        }
    }

    @Test
    public void testRetrieveMobileDUFReport_CheckIfDataIsRetrieved() throws Exception {

        System.out.println("testRetrieveMobileDUFReport_CheckIfDataIsRetrieved");
        Connection connection = connectionPool.getConnection();
        int dufId = Utils.nextSequenceNumber();

        try {
            BasicInformation basicInformation = new BasicInformation("MW", "Radioenlace", 0, 0, 0, 0);
            DufCalculations dufCalculations = new DufCalculations(0.0, 0.0, 0.0, 0.0, 0.0, 5.5);
            TechnicalInformation technicalInformation = new TechnicalInformation(0.0, 0.0, 0, 0.0, 0);
            AdditionalInformation additionalInformation = new AdditionalInformation(0, "LA PAZ", "201401", "DUF_ANUAL_AB_MOVIL_201401");
            AdditionalInformation additionalInformation2 = new AdditionalInformation(0, "LA PAZ", "201401", "DUF_ANUAL_RBS_MOVIL_201401");
            AdditionalInformation additionalInformation3 = new AdditionalInformation(0, "LA PAZ", "201401", "DUF_ANUAL_TERM_MOVIL_201401");
            DUF duf1 = new DUF(basicInformation, dufCalculations, technicalInformation, additionalInformation, dufId);
            coreDAO.saveDufDafReport(duf1);
            DUF duf2 = new DUF(basicInformation, dufCalculations, technicalInformation, additionalInformation2, dufId + 1);
            coreDAO.saveDufDafReport(duf2);
            DUF duf3 = new DUF(basicInformation, dufCalculations, technicalInformation, additionalInformation3, dufId + 2);
            coreDAO.saveDufDafReport(duf3);

            List<DUF> dufList = coreDAO.retrieveDUFReportByPeriodAndTypes("201401",
                    new String[]{AbstractReport.DUF_ANUAL_AB_MOVIL_REPORT_TYPE,
                        AbstractReport.DUF_ANUAL_RBS_MOVIL_REPORT_TYPE,
                        AbstractReport.DUF_ANUAL_TERM_MOVIL_REPORT_TYPE});

            assertEquals(3, dufList.size());
            assertEquals("DUF_ANUAL_AB_MOVIL_201401", dufList.get(0).getAdditionalInformation().getReportType());
            assertEquals("DUF_ANUAL_RBS_MOVIL_201401", dufList.get(1).getAdditionalInformation().getReportType());
            assertEquals("DUF_ANUAL_TERM_MOVIL_201401", dufList.get(2).getAdditionalInformation().getReportType());

        } catch (SQLException ex) {
            Logger.getLogger(DufDafReportDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            deleteDUF(dufId);
            deleteDUF(dufId + 1);
            deleteDUF(dufId + 2);
            connectionPool.returnConnection(connection);
        }
    }

    @Test(expected = IllegalArgumentException.class)
    public void testRetrieveWimaxAnnualTerminalsAndRadiobasesReport_checkThrowsIllegalArgumentExceptionWhenPeriodIsNull() throws SQLException {
        System.out.println("testRetrieveWimaxAnnualTerminalsAndRadiobasesReport_checkThrowsIllegalArgumentExceptionWhenPeriodIsNull");
        coreDAO.retrieveDUFReportByPeriodAndTypes(null);
    }

    @Test
    public void testRetrieveReportsByPeriodAndType_CheckIfDataIsRetrieved() throws Exception {

        System.out.println("testRetrieveReportsByPeriodAndType_CheckIfDataIsRetrieved");
        Connection connection = connectionPool.getConnection();
        int dufId = Utils.nextSequenceNumber();

        try {
            BasicInformation basicInformation = new BasicInformation("MW", "Radioenlace", 0, 0, 0, 0);
            DufCalculations dufCalculations = new DufCalculations(0.0, 0.0, 0.0, 0.0, 0.0, 5.5);
            TechnicalInformation technicalInformation = new TechnicalInformation(0.0, 0.0, 0, 0.0, 0);
            AdditionalInformation additionalInformation = new AdditionalInformation(0, "LA PAZ", "2014", "DUF_ANUAL_LINK_MW_2014");
            AdditionalInformation additionalInformation2 = new AdditionalInformation(0, "LA PAZ", "2014", "DUF_ANUAL_LINK_SAT_2014");
            DUF duf1 = new DUF(basicInformation, dufCalculations, technicalInformation, additionalInformation, dufId);
            coreDAO.saveDufDafReport(duf1);
            DUF duf2 = new DUF(basicInformation, dufCalculations, technicalInformation, additionalInformation2, dufId + 1);
            coreDAO.saveDufDafReport(duf2);
            DUF duf3 = new DUF(basicInformation, dufCalculations, technicalInformation, additionalInformation, dufId + 2);
            coreDAO.saveDufDafReport(duf3);

            List<DUF> dufList = coreDAO.retrieveDUFReportByPeriodAndTypes("2014", "DUF_ANUAL_LINK_MW_");
            List<DUF> dufSecondList = coreDAO.retrieveDUFReportByPeriodAndTypes("2014", "DUF_ANUAL_LINK_SAT_");
            List<DUF> dufThirdList = coreDAO.retrieveDUFReportByPeriodAndTypes("2014", "DUF_ANUAL_BANDA_1900_");

            assertEquals(2, dufList.size());
            assertEquals(1, dufSecondList.size());
            assertEquals(0, dufThirdList.size());

        } catch (SQLException ex) {
            Logger.getLogger(DufDafReportDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            deleteDUF(dufId);
            deleteDUF(dufId + 1);
            deleteDUF(dufId + 2);
            connectionPool.returnConnection(connection);
        }
    }

    @Test(expected = IllegalArgumentException.class)
    public void testRetrieveReportsByPeriodAndType_checkThrowsIllegalArgumentExceptionWhenPeriodIsNull() throws SQLException {
        System.out.println("testRetrieveReportsByPeriodAndType_checkThrowsIllegalArgumentExceptionWhenPeriodIsNull");
        coreDAO.retrieveDUFReportByPeriodAndTypes(null, "2014");
    }

    @Test
    public void testRetrieveManualPaperworkReportsPeriods_CheckCorrectDataIsRetrieved() throws Exception {

        System.out.println("testRetrieveManualPaperworkReportsPeriods_CheckCorrectDataIsRetrieved");
        Connection connection = connectionPool.getConnection();
        int dufId = Utils.nextSequenceNumber();

        try {
            BasicInformation basicInformation = new BasicInformation("MW", "Radioenlace", 0, 0, 0, 0);
            DufCalculations dufCalculations = new DufCalculations(0.0, 0.0, 0.0, 0.0, 0.0, 5.5);
            TechnicalInformation technicalInformation = new TechnicalInformation(0.0, 0.0, 0, 0.0, 0);
            AdditionalInformation additionalInformation = new AdditionalInformation(0, "LA PAZ", "20010101", AbstractReport.DUF_ANUAL_PAPERWORK_SAT_REPORT_TYPE + "T. 077/15_20010101");
            AdditionalInformation additionalInformation2 = new AdditionalInformation(0, "LA PAZ", "20010101", AbstractReport.DUF_ANUAL_PAPERWORK_MW_REPORT_TYPE + "T. 099/15_20010101");
            AdditionalInformation additionalInformation3 = new AdditionalInformation(0, "LA PAZ", "20010102", AbstractReport.DUF_ANUAL_PAPERWORK_SAT_REPORT_TYPE + "T. 077/15_20010102");
            DUF duf1 = new DUF(basicInformation, dufCalculations, technicalInformation, additionalInformation, dufId);
            coreDAO.saveDufDafReport(duf1);
            DUF duf2 = new DUF(basicInformation, dufCalculations, technicalInformation, additionalInformation2, dufId + 1);
            coreDAO.saveDufDafReport(duf2);
            DUF duf3 = new DUF(basicInformation, dufCalculations, technicalInformation, additionalInformation3, dufId + 2);
            coreDAO.saveDufDafReport(duf3);

            List<String> periodsSATList = coreDAO.retrieveManualPaperworkReportsPeriods(true, "T. 077/15");
            List<String> periodsMWList = coreDAO.retrieveManualPaperworkReportsPeriods(false, "T. 099/15");

            assertEquals(2, periodsSATList.size());
            assertEquals(1, periodsMWList.size());

        } catch (SQLException ex) {
            Logger.getLogger(DufDafReportDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            deleteDUF(dufId);
            deleteDUF(dufId + 1);
            deleteDUF(dufId + 2);
            connectionPool.returnConnection(connection);
        }
    }

    @Test
    public void testRetrieveManualPaperworkDufNumbers_CheckCorrectDataIsRetrieved() throws Exception {

        System.out.println("testRetrieveManualPaperworkDufNumbers_CheckCorrectDataIsRetrieved");
        Connection connection = connectionPool.getConnection();
        int dufId = Utils.nextSequenceNumber();

        try {
            BasicInformation basicInformation = new BasicInformation("MW", "Radioenlace", 0, 0, 0, 0);
            DufCalculations dufCalculations = new DufCalculations(0.0, 0.0, 0.0, 0.0, 0.0, 5.5);
            TechnicalInformation technicalInformation = new TechnicalInformation(0.0, 0.0, 0, 0.0, 0);
            AdditionalInformation additionalInformation = new AdditionalInformation(0, "LA PAZ", "20010101", AbstractReport.DUF_ANUAL_PAPERWORK_SAT_REPORT_TYPE + "T. 077/15_20010101");
            AdditionalInformation additionalInformation2 = new AdditionalInformation(0, "LA PAZ", "20010102", AbstractReport.DUF_ANUAL_PAPERWORK_MW_REPORT_TYPE + "T. 099/15_20010102");
            AdditionalInformation additionalInformation3 = new AdditionalInformation(0, "LA PAZ", "20010101", AbstractReport.DUF_ANUAL_PAPERWORK_SAT_REPORT_TYPE + "T. 079/15_20010101");
            DUF duf1 = new DUF(basicInformation, dufCalculations, technicalInformation, additionalInformation, dufId);
            coreDAO.saveDufDafReport(duf1);
            DUF duf2 = new DUF(basicInformation, dufCalculations, technicalInformation, additionalInformation2, dufId + 1);
            coreDAO.saveDufDafReport(duf2);
            DUF duf3 = new DUF(basicInformation, dufCalculations, technicalInformation, additionalInformation3, dufId + 2);
            coreDAO.saveDufDafReport(duf3);

            List<String> numbersSATList = coreDAO.retrieveManualPaperworkDufNumbers(true);
            List<String> numbersMWList = coreDAO.retrieveManualPaperworkDufNumbers(false);

            assertEquals(2, numbersSATList.size());
            assertEquals(1, numbersMWList.size());

        } catch (SQLException ex) {
            Logger.getLogger(DufDafReportDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            deleteDUF(dufId);
            deleteDUF(dufId + 1);
            deleteDUF(dufId + 2);
            connectionPool.returnConnection(connection);
        }
    }

    @Test
    public void testsaveReport_CheckReportIsSaved() throws Exception {

        System.out.println("testsaveReport_CheckReportIsSaved");
        Connection connection = connectionPool.getConnection();
        URL absolutePath = ReportFormGenerator.class.getResource("");
        LoggerHelper.logInfo(absolutePath.getPath());
        
        String stringPath = System.getProperty("PDFFilesDir");
        File finalFolder = new File(stringPath + "test.pdf");
        PDFFileInfo result;
        try {
            PDFFileInfo report = new PDFFileInfo("test.pdf", "803M", finalFolder, "testP");
            coreDAO.savePdfFile(report);
            result = coreDAO.retrievePDFFile("testP", "803M");
            assertNotNull(result);
            assertEquals("test.pdf", result.getFileName());

        } catch (SQLException ex) {
            Logger.getLogger(DufDafReportDAO.class.getName()).log(Level.SEVERE, null, ex);
            fail("Error in test testsaveReport_CheckReportIsSaved");
        } finally {
            deletePDFFile("testP", "803M");
            connectionPool.returnConnection(connection);
        }
    }

    @Test
    public void testUpdateReport_CheckReportIsUpdated() throws Exception {

        System.out.println("testUpdateReport_CheckReportIsUpdated");
        Connection connection = connectionPool.getConnection();
        URL absolutePath = ReportFormGenerator.class.getResource("");
        LoggerHelper.logInfo(absolutePath.getPath());
        
        String stringPath = System.getProperty("PDFFilesDir");
        File finalFolder = new File(stringPath + "test.pdf");
        File finalFolder2 = new File(stringPath + "test2.pdf");
        PDFFileInfo result;
        PDFFileInfo result2;
        try {
            PDFFileInfo report = new PDFFileInfo("test.pdf", "803M", finalFolder, "testP");
            PDFFileInfo report2 = new PDFFileInfo("test2.pdf", "803M", finalFolder2, "testP");
            coreDAO.savePdfFile(report);
            result = coreDAO.retrievePDFFile("testP", "803M");
            coreDAO.updatePdfFile(report2);
            result2 = coreDAO.retrievePDFFile("testP", "803M");
            assertNotNull(result);
            assertEquals("test.pdf", result.getFileName());
            assertEquals("test2.pdf", result2.getFileName());
        } catch (SQLException ex) {
            Logger.getLogger(DufDafReportDAO.class.getName()).log(Level.SEVERE, null, ex);
            fail("Error in test testUpdateReport_CheckReportIsUpdated");
        } finally {
            deletePDFFile("testP", "803M");
            connectionPool.returnConnection(connection);
        }
    }
    
    @Test
    public void testSaveDUFBalance_CheckReportIsSaved() throws Exception {

        System.out.println("testSaveDUFBalance_CheckReportIsSaved");
        Connection connection = connectionPool.getConnection();
        int balanceId = Utils.nextSequenceNumber();
        try {
            DUFBalance balance = new DUFBalance("Wimax", "201506", 10.0, balanceId);
            coreDAO.saveDUFBalance(balance);

            StringBuilder query = new StringBuilder();
            query.append("Select * from duf_daf_reports.duf_balance where id = ");
            query.append(balanceId).append(";");
            try (PreparedStatement preparedStatement = connection.prepareStatement(query.toString())) {
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        assertEquals(10.0, resultSet.getDouble("balance"), 0);
                        assertEquals("201506", resultSet.getString("period"));
                        assertEquals("Wimax", resultSet.getString("type"));
                    }
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(DufDafReportDAO.class.getName()).log(Level.SEVERE, null, ex);
            fail("Error in test testSaveDUFBalance_CheckReportIsSaved");
        } finally {
            deleteDUFBalance(balanceId);
            connectionPool.returnConnection(connection);
        }
    }

    @Test
    public void testRetrieveDUFBalance_CheckDataIsRetrived() throws Exception {

        System.out.println("testRetrieveDUFBalance_CheckDataIsRetrived");
        Connection connection = connectionPool.getConnection();
        int balanceId = 797;
        insertDUFBalance(balanceId);
        try {
            DUFBalance result = coreDAO.retrieveDUFBalance("201006", "Wimax");

            assertEquals(balanceId, result.getId(), 0);
            assertEquals(10.0, result.getBalance(), 0);
            assertEquals("201006", result.getPeriod());
            assertEquals("Wimax", result.getType());

        } catch (SQLException ex) {
            Logger.getLogger(DufDafReportDAO.class.getName()).log(Level.SEVERE, null, ex);
            fail("Error in test testRetrieveDUFBalance_CheckDataIsRetrived");
        } finally {
            deleteDUFBalance(balanceId);
            connectionPool.returnConnection(connection);
        }
    }
    
    @Test
    public void testDeleteDUFBalance_CheckReportIsDeleted() throws Exception {

        System.out.println("testDeleteDUFBalance_CheckReportIsDeleted");
        Connection connection = connectionPool.getConnection();
        int balanceId = Utils.nextSequenceNumber();
        try {
            DUFBalance balance = new DUFBalance("Wimax", "202506", 10.0, balanceId);
            coreDAO.saveDUFBalance(balance);            
            
            DUFBalance result = coreDAO.retrieveDUFBalance("202506", "Wimax");
            coreDAO.deleteDufBalanceByPeriodAndType("202506", "Wimax");
            DUFBalance result2 = coreDAO.retrieveDUFBalance("202506", "Wimax");
            assertEquals(new Double(10.0), result.getBalance());
            assertEquals("202506", result.getPeriod());
            assertEquals("Wimax", result.getType());
            assertNull(result2);
        } catch (SQLException ex) {
            Logger.getLogger(DufDafReportDAO.class.getName()).log(Level.SEVERE, null, ex);
            fail("Error in test testDeleteDUFBalance_CheckReportIsDeleted");
        } finally {
            deleteDUFBalance(balanceId);
            connectionPool.returnConnection(connection);
        }
    }
    
    @Test
    public void testsaveAnnualDuf_CheckIfDataWasSaved() throws Exception {

        System.out.println("testsaveAnnualDuf_CheckIfDataWasSaved");
        Connection connection = connectionPool.getConnection();
        int dufId = Utils.nextSequenceNumber();

        try {
            List<ReportSummaryInfo> info = new ArrayList<>();
            info.add(new ReportSummaryInfo("test", new BigDecimal(0), "test", "test", dufId));
            coreDAO.saveAnnualDuf(info);

            String query = "select * from duf_daf_reports.annual_duf where id = ?;";

            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setInt(1, dufId);
                try (ResultSet rs = preparedStatement.executeQuery()) {
                    if (rs.next()) {
                        assertEquals(dufId, rs.getInt("id"));
                    }
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(DufDafReportDAO.class.getName()).log(Level.SEVERE, null, ex);
            fail("error while save duf");
        } finally {
            deleteAnnualDUF(dufId);
            connectionPool.returnConnection(connection);
        }
    }
    
    @Test
    public void testRetrieveAnnualDufInfoByPeriod_CheckDataIsRetrived() throws Exception {

        System.out.println("testRetrieveAnnualDufInfoByPeriod_CheckDataIsRetrived");
        Connection connection = connectionPool.getConnection();
        int annualDufId = Utils.nextSequenceNumber();        
        try {
            insertAnnualDUF(annualDufId,"201007","type1");
            insertAnnualDUF(annualDufId+1,"201007","type2");
            insertAnnualDUF(annualDufId+2,"201006","type1");
            
            Map<String, ReportSummaryInfo> result = coreDAO.retrieveAnnualDufInfoByPeriod("201007");
            Map<String, ReportSummaryInfo> result2 = coreDAO.retrieveAnnualDufInfoByPeriod("201006");

            assertEquals(2, result.size());
            assertEquals(1, result2.size());

        } catch (SQLException ex) {
            Logger.getLogger(DufDafReportDAO.class.getName()).log(Level.SEVERE, null, ex);
            fail("Error in test testRetrieveDUFBalance_CheckDataIsRetrived");
        } finally {
            deleteAnnualDUF(annualDufId);
            deleteAnnualDUF(annualDufId+1);
            deleteAnnualDUF(annualDufId+2);
            connectionPool.returnConnection(connection);
        }
    }

    @Test
    public void testDeleteAnnualDuf_CheckIfDataWasDeleted() throws Exception {

        System.out.println("testDeleteAnnualDuf_CheckIfDataWasDeleted");
        Connection connection = connectionPool.getConnection();
        int dufId = Utils.nextSequenceNumber();

        try {
            List<ReportSummaryInfo> info = new ArrayList<>();
            info.add(new ReportSummaryInfo("test", new BigDecimal(0), "test", "test", dufId));
            coreDAO.saveAnnualDuf(info);
            Map<String, ReportSummaryInfo> annualDufs = coreDAO.retrieveAnnualDufInfoByPeriod("test");
            coreDAO.deleteAnnualDufByPeriodAndType("test", "test");
            Map<String, ReportSummaryInfo> annualDufs2 = coreDAO.retrieveAnnualDufInfoByPeriod("test");
            
            assertEquals(1, annualDufs.keySet().size());
            assertEquals(0, annualDufs2.keySet().size());           
            
        } catch (SQLException ex) {
            Logger.getLogger(DufDafReportDAO.class.getName()).log(Level.SEVERE, null, ex);
            fail("error while delete annual duf");
        } finally {
            deleteAnnualDUF(dufId);
            connectionPool.returnConnection(connection);
        }
    }
    
    private void deletePDFFile(String period, String type) {
        Connection connection = connectionPool.getConnection();
        StringBuilder query = new StringBuilder();
        query.append("delete from duf_daf_reports.pdf_file where period = '");
        query.append(period).append("' and type = '").append(type).append("' ;");

        try {
            try (PreparedStatement preparedStatement = connection.prepareStatement(query.toString())) {
                preparedStatement.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoreDAOTest.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            connectionPool.returnConnection(connection);
        }
    }

    private void insertDUFBalance(int id) {
        Connection connection = connectionPool.getConnection();
        StringBuilder query = new StringBuilder();
        query.append("INSERT INTO duf_daf_reports.`duf_balance` (`id`, `type`, `period`, `balance`) VALUES (");
        query.append(id).append(", 'Wimax', '201006', 10.00);");

        try {
            try (PreparedStatement preparedStatement = connection.prepareStatement(query.toString())) {
                preparedStatement.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoreDAOTest.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            connectionPool.returnConnection(connection);
        }
    }

    private void deleteDUFBalance(int id) {
        Connection connection = connectionPool.getConnection();
        StringBuilder query = new StringBuilder();
        query.append("delete from duf_daf_reports.duf_balance where id = ");
        query.append(id).append(";");

        try {
            try (PreparedStatement preparedStatement = connection.prepareStatement(query.toString())) {
                preparedStatement.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoreDAOTest.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            connectionPool.returnConnection(connection);
        }
    }

    private void insertAnnualDUF(int id, String period, String type) {
        Connection connection = connectionPool.getConnection();
        StringBuilder query = new StringBuilder();
        query.append("INSERT INTO duf_daf_reports.annual_duf (`id`, `payment_type`, `amount`, `period`, `type`) VALUES (");
        query.append(id).append(", '', '0.0', ");
        query.append(period).append(", '");
        query.append(type).append(period).append("');");

        try {
            try (PreparedStatement preparedStatement = connection.prepareStatement(query.toString())) {
                preparedStatement.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoreDAOTest.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            connectionPool.returnConnection(connection);
        }
    }
    
    private void deleteAnnualDUF(int id) {
        Connection connection = connectionPool.getConnection();
        StringBuilder query = new StringBuilder();
        query.append("delete from duf_daf_reports.annual_duf where id = ");
        query.append(id).append(";");

        try {
            try (PreparedStatement preparedStatement = connection.prepareStatement(query.toString())) {
                preparedStatement.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoreDAOTest.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            connectionPool.returnConnection(connection);
        }
    }*/
    
    private void deleteStudent(String studentId) {
        Connection connection = connectionPool.getConnection();
        StringBuilder query = new StringBuilder();
        query.append("delete from schedule.student where student_id = '");
        query.append(studentId).append("';");
        try {
            try (PreparedStatement preparedStatement = connection.prepareStatement(query.toString())) {
                preparedStatement.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(CoreDAOTest.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            connectionPool.returnConnection(connection);
        }
    }

}
