
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="model.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%! crud c = new crud(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <th colspan="2">Student Form</th>
                </tr>
                <tr>
                    <td>Enter RollNo.</td>
                    <td>
                        <input type="number" name="rno" value="<%= request.getParameter("id")%>" readonly/>
                    </td>
                </tr>
                <tr>
                    <td>Enter Name</td>
                    <td>
                        <input type="text" name="nmm" value="<%= request.getParameter("nm")%>"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Update" name="upd"/></td>
                </tr>
            </table>
            <br><br>
           </form>
    </body>
</html>
<%
    if (request.getParameter("upd") != null) {

        int rno = Integer.parseInt(request.getParameter("rno"));
        String nm = request.getParameter("nmm");

            if (c.UpdateData(rno, nm)>0) {
                    response.sendRedirect("first.jsp");
                }
            else{
                out.print("Try Again.");
            }
    }
%>
<%@include file="select.jsp" %>
