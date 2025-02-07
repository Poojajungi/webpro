<%-- 
    Document   : Loginform
    Created on : 19 Dec, 2024, 10:19:01 PM
    Author     : mahek
--%>

<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="model.registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!String alertType = "info";
    String message = null;%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="CSS/design.css" rel="stylesheet"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    </head>

    <title>JSP Page</title>
    <body style="background: linear-gradient(160deg,#89D8E3,white,white,whitesmoke,white,#101E42);background-repeat: no-repeat;" class="vh-100 overflow-hidden"> 
        <div class="card  border-light"
             style="background: linear-gradient(160deg,#89D8E3,#CD899E,#F9D3C0,#CFE0F8,#CD899E,#9B70A0,#101E42); 
             height: auto; width: 390px; margin: 60px auto;">
            <div class="card-header h3  text-center  ">
                Fish Transportation

            </div>
            <div class="text-center h4 text-white">LOGIN </div>
            <form class="px-3 py-1" method="post">

                <div class="card-body">

                    <div class="formmain mb-3">
                        <input type="text" name="unm" placeholder=" " class="form-control textbox" required value="<%= request.getParameter("users") != null ? request.getParameter("users") : ""%>" />
                        <label  class="form-labeline">Enter Username</label>
                    </div>
                    <!--<input type="hidden" name="cap1"  id="captchavalue" value=""/>-->
                    <div class="formmain mb-3"  style="padding: 0px !important;" >
                        <input type="password" name="pw" placeholder=" " class="form-control textbox" required value="<%= request.getParameter("passw") != null ? request.getParameter("passw") : ""%>"/>
                        <label  class="form-labeline">Enter Password</label>
                    </div>

                    <div class="d-flex row justify-content-around">
                        <div class="col-md-3 col-lg-3 col-sm-4 fs-4 fw-bold" id="captchavalue" >
                            ssss
                        </div><div class="col-md-7 col-lg-7 col-sm-8 p-0 formmain">
                            <input type="text" class="form-control textbox" placeholder="" name="cap2" required>
                            <label  class="form-labeline" >Enter Captcha</label></div>
                    </div>
                </div>
                <div class="my-2 text-center">
                    <button type="submit" class="btn btn-info text-center text-white "  name="btn"  data-bs-toggle="modal" 
                            data-bs-target="#staticBackdrop"><i class='bx bxs-lock mx-1' ></i>LOGIN</button>
                </div>
                <div class="d-flex justify-content-between mb-3">
                    <a href="regi.jsp" class="text-decoration-none  mx-1  text-white">  <i class='bx bxs-user mx-1'></i>User Registration</a>
                    <a href="forgetpw.jsp" class="text-decoration-none  mx-1  text-white">Forget your Password</a>
                </div>
                <div class="card-footer text-center  text-white">
                    @2025,Porbandar Gujarat 360575</br>Develop by:PMD
                </div>
        </div>
    </form>

    <script type="text/javascript" src="generate.js" ></script>
</div>

<%
    if (request.getParameter("btn") != null) {
        try {
            String unm = request.getParameter("unm");
            String pw1 = request.getParameter("pw");
            String cap1 = request.getParameter("cap1");
//            String cap2 = request.getParameter("cap2");
//            out.println(cap1 + cap2);
             if(unm.equals("pdm") && pw1.equals("pdm")){
                     response.sendRedirect("AdminNav.jsp");
                }
            registration r = new registration();
            Configuration con = new Configuration().configure().addAnnotatedClass(registration.class);
            SessionFactory sf = con.buildSessionFactory();
            Session s = sf.openSession();
            Query o = s.createQuery("from registration where  username like'%" + unm + "%' ");
            List<registration> l = o.list();
            for (registration elem : l) {
                String usernm = elem.getUsername();
                String pw = elem.getPassword();
                if (unm.equals(usernm) && pw1.equals(pw)) {
                    session.setAttribute("logname", elem.getRefid());
                    message = "Successfully Login";
                    alertType = "success";
                    response.sendRedirect("home.jsp");
//                    out.print(usernm + pw);
                }
                else {
                    message = "Try Again";
                    alertType = "danger";
                }

            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }
%>

<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body d-flex flex-column justify-content-center align-items-center">

                <%
                    if (alertType == "danger") {
                %>
                <img  src="CSS/Images/tryag.png" height="70px" width="70px"/>

                <%
                } else {
                %>
                <img  src="CSS/Images/succes.png" height="70px" width="70px"/>
                <%
                    }
                %>
                <p class="mt-2 mb-0 fw-bold fs-5"><%= message != null ? message : "No message available."%></p>
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <%
                    if (alertType == "danger") {
                %>
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal" id="okButton" >Okay</button>

                <%
                } else {
                %>
                <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="okButton" >Okay</button>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    <% if (message != null) { %>
    document.addEventListener("DOMContentLoaded", function () {
        const alertModal = new bootstrap.Modal(document.getElementById("alertModal"));
        alertModal.show();
        const okButton = document.getElementById("okButton");
        if (okButton) {
            okButton.addEventListener("click", function () {
                // Remove query parameters from the URL
                const baseUrl = window.location.origin + window.location.pathname;
                window.location.replace(baseUrl); // Replaces current URL and refreshes
//                    window.location.replace(" ",baseUrl);
//                request.setAttribute("message", null);
    <%message = null;%>
            });
        }
    });
    <% }%>
</script>
</body>
</html>