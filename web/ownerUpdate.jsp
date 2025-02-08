<%-- 
    Document   : ownerUpdate
    Created on : Jan 6, 2025, 9:10:53 AM
    Author     : dkvag
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.service.ServiceRegistryBuilder"%>
<%@page import="org.hibernate.service.ServiceRegistry"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="model.ownerData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Owner</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eHz" crossorigin="anonymous"></script>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                /*background-color: #f8f9fa;*/
                background:linear-gradient(160deg,#89D8E3,#CD899E,#F9D3C0,#CFE0F8,#CD899E,#9B70A0,#101E42);
                background-repeat: no-repeat;
            }
            .formmain{
                position: relative;
            }

            .form-control:focus {
                box-shadow: none; 
                outline: none;
            }

            .form-labeline{
                position: absolute;
                top: 0.6rem;
                left: 1.4rem;
                cursor: text;
                color:grey;
                transition: top 200ms ease-in,left 200ms ease-in,font-size 200ms ease-in;
            }
            .textbox:focus{
                background: white;
            }
            .textbox:focus ~.form-labeline,
            .textbox:not(:placeholder-shown).textbox:not(:focus)~.form-labeline{
                top: -0.5rem;
                left:1.3rem;
                font-size: 12px;
                background:linear-gradient(to top,white,#CFE0F8);
                font-family: sans-serif;
            }

        </style>
    </head>
    <body>
            <%
            if (session.getAttribute("logname")==null) {
                    response.sendRedirect("Loginform.jsp");
                }
        %>
         <div>
            <%@include file="homeLog.jsp" %>
        </div>
        <div class="vh-200 overflow-hidden" style="margin-bottom: 150px;">
            <div class="container border border-light bg-transparent p-4"  style="width:50%;border-radius: 15px;margin-top: 150px">
                <h3 class="text-center mb-4">Boat/Owner Management Update</h3>
                <form method="post">
                    <div class="form-group formmain">
                        <input type="number" class="form-control textbox" id="id1" readonly name="oid" placeholder="" value="<%= request.getParameter("id")%>">
                        <label class="form-labeline">Enter Id</label>
                    </div>
                    <div class="form-group formmain">
                        <input type="text" class="form-control textbox" id="name1"name="onm" placeholder=""  value="<%= request.getParameter("name")%>" required>
                        <label class="form-labeline" >Enter Name</label>
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control text-secondary" id="date1"name="dt" required value="<%= request.getParameter("date")%>">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block" name="upd">Edit</button>
                </form>
            </div>
        </div>
    </body>
</html>
<%
    try {
        if (request.getParameter("upd") != null) {
            int id = Integer.parseInt(request.getParameter("oid"));
            String oName = request.getParameter("onm");
            String date = request.getParameter("dt");

            ownerData od = new ownerData();

            od.setId(id);
            od.setoName(oName);
            od.setDate(date);
            od.setUserId(Integer.parseInt(session.getAttribute("logname").toString()));

            Configuration con = new Configuration().configure().addAnnotatedClass(ownerData.class);
            ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).build();
            SessionFactory sf = con.buildSessionFactory(reg);
            Session s = sf.openSession();
            s.beginTransaction();
            s.update(od);
            s.getTransaction().commit();
            response.sendRedirect("selectdata.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<%@include file="homeTemp.jsp" %>