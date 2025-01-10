
<%@page import="model.crud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    crud cr = new crud();
    cr.TotalStockUpdate("Giant", 1, 1);
%>