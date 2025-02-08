<%-- 
    Document   : registration
    Created on : 6 Jan, 2025, 10:00:27 AM
    Author     : mahek
--%>

<%@page import="model.mvcfile"%>
<%@page import="com.sun.mail.smtp.SMTPMessage"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
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
        <script type="text/javascript">
            function loadValue() {
                var refid = sessionStorage.getItem("refid");
                document.getElementById("refid").value = refid;
                var fnms = sessionStorage.getItem("fullnm"); // Retrieve the value
                document.getElementById("fullnm").value = fnms;
                var unms = sessionStorage.getItem("unmv");
                document.getElementById("refeid").value = unms;
                var mnos = sessionStorage.getItem("mno");
                var ems = sessionStorage.getItem("em");
                var caps = sessionStorage.getItem("cap");
                document.getElementById("mno").value = mnos;
                document.getElementById("emv").value = ems;
                document.getElementById("captch").value = caps;
                var selectedValue = sessionStorage.getItem("selectedValue"); // Retrieve the value from sessionStorage
                if (selectedValue) {
                    var dropdown = document.getElementById("dropdown2");
                    for (var i = 0; i < dropdown.options.length; i++) {
                        if (dropdown.options[i].value == selectedValue) {
                            dropdown.selectedIndex = i; // Set the dropdown option to the selected value
                            break;
                        }
                    }
                }
            }

            function checko()
            {
                var checkpw = document.getElementById("checkpw");
                var cotp = document.getElementById("otpc").value;
                var divDemo = document.getElementById("regi");
                var otp = sessionStorage.getItem("otp");
                if (otp === cotp)
                {
                    checkpw.style.display = "flex";
                    divDemo.style.display = "block";
                }
            }
        </script>
    </head>
    <!--<body   onload="loadValue()">-->
        <body onload="loadValue()" style="background: linear-gradient(160deg,#89D8E3,white,white,whitesmoke,white,#101E42);background-repeat: no-repeat;" class="vh-100 overflow-hidden"> 

        <div class="card bg-transparent border-light"
             style=" background: linear-gradient(160deg,#89D8E3,#CD899E,#F9D3C0,#CFE0F8,#CD899E,#9B70A0,#101E42); height: auto; width: 390px; margin: 60px auto;">
            <div class="card-header h3  text-center  ">
                Fish Transportation
            </div>
            <div class="text-center h4 text-white">REGISTRATION FORM</div>


            <div class="card-body">
                <form class="row g-3 " method="post">

                    <div  class=" formmain col-6" >
                        <input type="text" class="form-control textbox" id="refid"  name="refid" placeholder="" >
                        <label  class="form-labeline">Reference id*</label>
                    </div>
                    <div  class=" formmain col-6" >
                        <input type="text" class="form-control textbox" id="fullnm"  name="fnm" placeholder="">
                        <label  class="form-labeline">Enter Fullname*</label>
                    </div>
                    <div  class=" formmain col-6">
                        <input type="text" class="form-control textbox" id="refeid" name="unm"  placeholder="">
                        <label  class="form-labeline">Enter Username*</label>
                    </div>
                    <div class="col-6">
                        <select id="dropdown2" class="form-select" name="dropdown2" >
                            <option selected>---Choose City---</option>
                            <option value="Porbandar">Porbandar</option>
                            <option value="Surat">Surat</option>
                            <option value="Navsari">Navsari</option>
                        </select>
                    </div>
                    <div  class=" formmain col-6" >
                        <input type="number" id="mno" placeholder="" name="mno" class="form-control textbox">
                        <label  class="form-labeline">Enter MobileNo*</label>
                    </div>
                    <div  class=" formmain col-6">
                        <input type="email"  placeholder="" name="em"  id="emv" class="form-control textbox" >
                        <label  class="form-labeline" >Enter Email*</label>
                    </div>
                    <input type="hidden" id="otp" name="o" value="<%= request.getParameter("otp")%>"/>
                    <div class="d-flex">
                        <div class="col-md-3 col-lg-3 col-sm-4 fs-4 fw-bold" id="captchvalue"   >
                            ssss
                        </div>
                        <div class=" formmain col-lg-9">
                            <input type="text" class="form-control textbox"  name="capt" id="captch" placeholder="">
                            <label  class="form-labeline">Enter Captcha</label></div>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-info text-center text-white " name="btn" disabled="true" >Generate OTP</button>
                    </div>
                    <div class=" formmain">
                        <input type="text" class="form-control textbox"  id="otpc" name="otp"  placeholder="">
                        <label  class="form-labeline">Verify OTP</label>
                    </div>

                    <div class="text-center">
                        <button type="Button" class="btn btn-info text-center text-white " name="btn" onclick="checko()">Check OTP</button>
                    </div>
                    <div   style="display: none;justify-content: space-between;gap:6px" id="checkpw" >
                        <div class="  formmain col-6">
                            <input type="password" class="form-control textbox"  name="pw"  id="pw" placeholder="" required>
                            <label  class="form-labeline">Password*</label></div>
                        <div class=" formmain col-6">
                            <input type="password" class="form-control textbox"  name="cpw" id="cpw" placeholder="" required>
                            <label  class="form-labeline">Confirm Password*</label></div>

                    </div>
                    <div class="text-center" id="regi" style="display:none">
                        <button type="submit" class="btn btn-info text-center text-white " name="regibtn"  data-bs-toggle="modal" 
                                data-bs-target="#staticBackdrop">Registration</button>
                    </div>
                    <div class="mb-1">
                        <a href="Loginform.jsp" class="text-decoration-none  mx-1 text-white fw-bold"><i class='bx bxs-chevrons-right fw-bold' ></i>Login </a>
                    </div>
            </div>
        </form>
        <div class="card-footer text-center  text-white">
            @2025,Porbandar Gujarat 360575</br>Develop by:PMD
        </div> 
    </div>

    <%
        if (request.getParameter("btn") != null) {
            final String otp = request.getParameter("o");
            final String subject = "OTP";
            final String to = request.getParameter("em");

            Properties pro = new Properties();
            pro.put("mail.smtp.host", "smtp.gmail.com");
            pro.put("mail.smtp.port", "587");
            pro.put("mail.smtp.auth", "true");
            pro.put("mail.smtp.starttls.enable", "true");

            Session se = Session.getDefaultInstance(pro, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {

                    return new PasswordAuthentication("maheksindhav3@gmail.com", "khuc vcbc mmqd jgkr");
                }

            });

            try {
                //COMPOSITE MAIL
                SMTPMessage sendmessage = new SMTPMessage(se);

                sendmessage.setFrom(new InternetAddress("maheksindhav3@gmail.com"));
                sendmessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
                sendmessage.setSubject(subject);
                sendmessage.setText(otp);

                Transport.send(sendmessage);

            } catch (Exception e) {
                out.println(e);

            }
        } else if (request.getParameter("regibtn") != null) {
            if (request.getParameter("pw").equals(request.getParameter("cpw"))) {
                int refid = Integer.parseInt(request.getParameter("refid"));
                String fnm = request.getParameter("fnm");
                String unm = request.getParameter("unm");
                String city = request.getParameter("dropdown2");
                String mobileno = request.getParameter("mno");
                String email = request.getParameter("em");
                String pw = request.getParameter("pw");
                mvcfile m = new mvcfile();
                m.insertdata(refid, fnm, unm, city, mobileno, email, pw);
                message = "Registration Successfully";
                alertType = "success";
                response.sendRedirect("Loginform.jsp");
            } else {

                message = "Try Again";
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
        var alpha = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
            'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
            'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
            'u', 'v', 'w', 'x', 'y', 'z'];

        var a = alpha[Math.floor(Math.random() * alpha.length)];
        var b = alpha[Math.floor(Math.random() * alpha.length)];
        var c = alpha[Math.floor(Math.random() * alpha.length)];
        var d = alpha[Math.floor(Math.random() * alpha.length)];

        var sum = a + b + c + d;

        captchvalue.innerHTML = sum;
        document.getElementById("captch").value = sum;

        var num = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

        var a = num[Math.floor(Math.random() * num.length)];
        var b = num[Math.floor(Math.random() * num.length)];
        var c = num[Math.floor(Math.random() * num.length)];
        var d = num[Math.floor(Math.random() * num.length)];
        var e = num[Math.floor(Math.random() * num.length)];
        var f = num[Math.floor(Math.random() * num.length)];

        var s = a + b + c + d + e + f;

        document.getElementById("otp").value = s;
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