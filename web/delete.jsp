
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="model.bean"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{
        int rn = Integer.parseInt(request.getParameter("id"));
        Configuration cfg = new Configuration().configure().addAnnotatedClass(bean.class);
        SessionFactory sf = cfg.buildSessionFactory();
        Session sess = sf.openSession();
        sess.beginTransaction();
         Object obj = sess.get(bean.class, rn);
        if (!obj.equals(null)) {
            sess.delete(obj);
            sess.getTransaction().commit();
            response.sendRedirect("first.jsp");
        }
    }catch(Exception e){
        out.print(e);
    }
    
%>
