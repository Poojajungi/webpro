
package model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

//@WebServlet("/getTotalQuantity")
public class TotalQuantityServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fishName = request.getParameter("fishName"); // Get the selected fish name from the request
        HttpSession session = request.getSession();
        int uid = Integer.parseInt(session.getAttribute("logname").toString());
        if (fishName != null && !fishName.isEmpty()) {
            crud cr = new crud();
            float totalQuantity = cr.TotalQuantity(fishName,uid); // Call the TotalQuantity method to get the value
            response.setContentType("text/plain"); // Set the response type to plain text
            response.getWriter().write(String.valueOf(totalQuantity)); // Send the total quantity as the response
        } else {
            response.getWriter().write("0"); // If no valid fish name, return 0
        }
    }
}