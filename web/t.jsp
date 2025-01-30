<%@page import="org.hibernate.*"%>
<%@page import="model.*"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Translation Page</title>
    </head>
    <body>
       <%
           crud cr = new crud();
           cr.TotalstocksMethod();
       %>
    </body>
</html>
