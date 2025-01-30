
<%@page import="org.hibernate.*"%>
<%@page import="model.*"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loginpage</title>
    </head>
    <body>
        <form>
            <input type="text" name="txt" placeholder="Enter Name"/><br/><br/>
            <input type="password" name="psw" placeholder="Enter Password"/><br><br/>
            <input type="submit" name="btnLogin" value="Login"/>
            
        </form>
    </body>
</html>
<%
    if (request.getParameter("btnLogin")!=null) {

              
                session.setAttribute("logname", 101);
//                if (session.getAttribute("logname")!=null) {
//                        out.print("Set Successfully.")

//                        Configuration conn = new Configuration().configure().addAnnotatedClass(ExportAgency.class);
//                SessionFactory sf = conn.buildSessionFactory();
//                Session sess = sf.openSession();
//                sess.beginTransaction();
//                ExportAgency e = new ExportAgency();
//                e.setUserID(101);
//                sess.save(e);
//                sess.getTransaction().commit();
//                sess.close();
                        response.sendRedirect("ImportStockform.jsp");
//                }
        }
    
%>
