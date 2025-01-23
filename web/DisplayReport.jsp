<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="model.*" %>
<%@page contentType="text/html;charset=UTF-8" %>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%
    try {
        // Hibernate configuration and session setup
        Configuration conn = new Configuration().configure().addAnnotatedClass(TotalStock.class);
        SessionFactory sf = conn.buildSessionFactory();
        Session sess = sf.openSession();

        // Correct file path for the JRXML file
        String jrxmlFilePath = session.getServletContext().getRealPath("/Reports/StockReport.jrxml");

        if (jrxmlFilePath == null) {
            throw new FileNotFoundException("Report file not found at: /Reports/StockReport.jrxml");
        }

        // Compile JRXML to JasperReport
        JasperReport jasperReport = JasperCompileManager.compileReport(jrxmlFilePath);

        // Fill the report with data from Hibernate session
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null);

        // Set response headers for HTML content
        response.setContentType("text/html;charset=UTF-8");

        // Export to HTML and write to response output stream
        JasperExportManager.exportReportToHtmlFile(jrxmlFilePath);

        // Flush the response stream to ensure the HTML content is properly sent
        response.getOutputStream().flush();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error generating report: " + e.getMessage());
    } finally {
        try {
            response.getOutputStream().close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
%>
