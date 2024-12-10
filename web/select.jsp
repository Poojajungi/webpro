
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="model.bean"%>
<%@page import="org.hibernate.Query"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <table border="2" align="center" width="30%">
                <tr>
                    <th>RollNo</th>
                    <th>Name</th>
                    <th colspan="2">Action</th>
                </tr>
            <%
                Configuration confi = new Configuration().configure().addAnnotatedClass(bean.class);
                SessionFactory sf = confi.buildSessionFactory();
                Session sess = sf.openSession();
                Query q1 = sess.createQuery("from bean");
                List<bean> l1 = q1.list();
                for(bean b : l1){
                     int a = b.getRno();
                     String nm = b.getName();
            %>
                <tr>
                    <td><%=a%>
                    </td>
                   
                    <td><%=nm%></td>
                    <td><a href="delete.jsp?id=<%=a%>">Delete</a></td>
                    <td><a href="update.jsp?id=<%=a%>&nm=<%=nm%>">Update</a></td>
                </tr>
                <% } %>
            </table>
    </body>
</html>
