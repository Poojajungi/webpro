<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="model.ownerData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

        <title>View Owner Data</title>
        <style>
            .maindes {
                background:linear-gradient(160deg,#89D8E3,#CD899E,#F9D3C0,#CFE0F8,#CD899E,#9B70A0,#101E42);
                background-size: cover;
                background-repeat: no-repeat;
            }
        </style>
    </head>
    <body class="maindes">
         <div >
            <%@include file="homeLog.jsp" %>
        </div>
        <div class=" overflow-hidden vh-200" style="margin-bottom: 150px;">
            <div class="container"  style="margin-top: 150px">
                <!--<div class="d-flex align-items-center gap-2"  style="margin-top: 150px">-->

                <!--<table border="1" align="center" class="table w-50 mt-4 text-center">-->
                <!--            <tr>
                                <th colspan="7">Owner Details</th>
                            </tr>-->
                <div class="container-fluid">
                    <form>
                        <h3 class="text-center mt-3 ">View Owner Details</h3>
                        <table class="table table-bordered  mt-3 table-sm table-striped border-dark table-hover">
                            <tr class="text-center table-dark text-white">
                                <th>ID</th>
                                <th>Name</th>
                                <th>Date</th>
                                <th>Update</th>
                                <th>Delete</th>
                            </tr>
                            <%
                                try {
                                    ownerData md = new ownerData();
                                    Configuration con = new Configuration().configure().addAnnotatedClass(ownerData.class);
                                    SessionFactory sf = con.buildSessionFactory();
                                    Session s = sf.openSession();
                                    Transaction t = s.beginTransaction();
                                    int id = Integer.parseInt(session.getAttribute("logname").toString());
                                    Query qry = s.createQuery("from ownerData where UserId=" + id);
                                    List<ownerData> l = qry.list();
                                    for (ownerData object : l) {
                            %>
                            <tr class="text-center">
                                <td><%=object.getId()%> </td>
                                <td><%=object.getoName()%></td>
                                <td> <%=object.getDate()%></td>
                                <td>
                                    <a href="ownerUpdate.jsp?id=<%=object.getId()%>&name=<%=object.getoName()%>&date=<%=object.getDate()%>" style="text-decoration: none;">
                                        <i class="fas fa-pencil-alt text-primary"></i>
                                    </a>
                                </td>
                                <td>
                                    <a href="ownerDelete.jsp?id=<%=object.getId()%>" style="text-decoration: none;">
                                        <i class="fas fa-trash text-danger"></i> 
                                    </a> 
                                </td>
                            </tr>
                            <% }
                                    t.commit();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                        </table>
                </div>
                </form>
            </div>
        </div>
    </body>
</html>
<%@include file="homeTemp.jsp" %>