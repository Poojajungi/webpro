
<%@page import="model.crud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    crud cr = new crud();
//    int i = cr.TotalstocksMethod();
//    out.print(i + " Row Inserted.");

        out.print(cr.TotalStockUpdate("Four", 1, 1));
%>