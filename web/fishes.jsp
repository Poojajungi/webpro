
<%@page import="model.crud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    crud cr = new crud();
//    int i = cr.TotalstocksMethod();
//    out.print(i + " Row Inserted.");
    cr.ExportMinus("Two", 1);
%>