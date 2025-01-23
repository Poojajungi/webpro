
package model;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

public class JasperReportServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, JRException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
//               // Path to the JRXML file
            String jrxmlFilePath = getServletContext().getRealPath("/Reports/StockReport.jrxml");

            if (jrxmlFilePath == null) {

                throw new FileNotFoundException("Report file not found at: /Reports/StockReport.jrxml");
            }

            // Compile JRXML to JasperReport
            JasperReport jasperReport = JasperCompileManager.compileReport(jrxmlFilePath);

            // Fill report with no parameters (empty map)
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, new HashMap());

            // Set response headers to display PDF inline
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "inline; filename=StockReport.pdf");

            // Export to PDF and stream to the browser
            JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

            // Flush the output stream to ensure content is properly sent to the browser
            response.getOutputStream().flush();
         } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error generating report: " + e.getMessage());
        } finally {
            try {
                response.getOutputStream().close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (JRException ex) {
            Logger.getLogger(JasperReportServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (JRException ex) {
            Logger.getLogger(JasperReportServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
