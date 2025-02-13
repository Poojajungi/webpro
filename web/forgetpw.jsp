
<%@page import="org.hibernate.Transaction"%>
<%@page import="model.mvcfile"%>
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
        <title>JSP Page</title>
    </head>
    <body>
        <div class="card bg-transparent border-light"
             style=" background: linear-gradient(160deg,#89D8E3,#CD899E,#F9D3C0,#CFE0F8,#CD899E,#9B70A0,#101E42); height: auto; width: 390px; margin: 60px auto;">
            <div class="card-header h3  text-center  ">
                Fish Transportation
            </div>
            <div class="text-center h4 text-white">FORGET PASSWORD</div>

            <div class="card-body">
                <form class="row g-3 " method="post">

                    <div  class=" formmain" >
                        <input type="number" id="mno" placeholder=""name="mno"   class="form-control textbox" required>
                        <label  class="form-labeline">Enter MobileNo</label>
                    </div>

                    <div class="  formmain">
                        <input type="text" class="form-control textbox"  name="pw"  id="pw" placeholder="" required>
                        <label  class="form-labeline">New Password</label></div>
                    <div class=" formmain">
                        <input type="text" class="form-control textbox"  name="cpw" id="cpw" placeholder="" required>
                        <label  class="form-labeline">Confirm Password</label></div>
                    <div class="d-flex">
                        <div class="col-md-3 col-lg-3 col-sm-4 fs-4 fw-bold" id="numcaptchvalue">
                            ssss
                        </div>
                        <div class=" formmain col-lg-9">
                            <input type="text" class="form-control textbox"  name="numcapt" id="numcaptch" placeholder="" required>
                            <label  class="form-labeline">Enter Captcha</label></div></div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-info text-center text-white " name="btn"  data-bs-toggle="modal" 
                                data-bs-target="#staticBackdrop">Save</button>
                    </div>
                    <div class="mb-1">
                        <a href="Loginform.jsp" class="text-decoration-none  mx-1 text-white"><i class='bx bxs-chevrons-right' ></i>Login Form</a>
                    </div>
            </div>
        </form>
        <div class="card-footer text-center  text-white">
            @2025,Porbandar Gujarat 360575</br>Develop by:PMD
        </div> 
    </div>


    <%
        if (request.getParameter("btn") != null) {
            try {
                String num = request.getParameter("mno");
                String pw = request.getParameter("pw");
                String cpw = request.getParameter("cpw");
                registration r = new registration();
                Configuration con = new Configuration().configure().addAnnotatedClass(registration.class);
                SessionFactory sf = con.buildSessionFactory();
                Session s = sf.openSession();
                Query o = s.createQuery("from registration where  mobileno like'%" + num + "%' ");
                List<registration> l = o.list();
                for (registration elem : l) {
                    String number = elem.getMobileno();
                    
                    System.out.print("done "+number);
                    if (num.equals(number)) {
                        if (pw.equals(cpw)) {
                            mvcfile m = new mvcfile();
                            m.update(pw, num);
//                         t.commit();
                            message = "Update Successfully";
                            alertType = "success";
                            response.sendRedirect("Loginform.jsp");
                        }
                    } else {
                        message = "Try Again";
                        alertType = "danger";
                    }
                }

            } catch (Exception e) {
                System.out.print(e);
                 message = "Enter Valid Number";
                 alertType = "danger";
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
        var num = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

        var a = num[Math.floor(Math.random() * num.length)];
        var b = num[Math.floor(Math.random() * num.length)];
        var c = num[Math.floor(Math.random() * num.length)];
        var d = num[Math.floor(Math.random() * num.length)];
        var s = a + b + c + d;
        numcaptchvalue.innerHTML = s;

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