<%-- 
    Document   : t
    Created on : 30 Dec, 2024, 2:00:23 PM
    Author     : poojajungi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
    String userInput = request.getParameter("userInput"); 
out.print(userInput + ' ' + i);

    
%>

<form method="post">
    <input type="text" name="userInput" value="<%= userInput != null ? userInput : "" %>">
    <button type="submit">Submit</button>
    <%! int i =0;%>
    <% out.print(i);
        i++; %>
</form>
    </body>
</html>
