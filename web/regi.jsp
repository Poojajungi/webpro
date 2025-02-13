
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
<%! mvcfile crud = new mvcfile();
%>
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
    <%int id = crud.getid() + 1;%>
    <body style="background: linear-gradient(160deg,#89D8E3,white,white,whitesmoke,white,#101E42);background-repeat: no-repeat;" class="vh-100 overflow-hidden"> 

        <div class="card bg-transparent border-light"
             style=" background: linear-gradient(160deg,#89D8E3,#CD899E,#F9D3C0,#CFE0F8,#CD899E,#9B70A0,#101E42); height: auto; width: 390px; margin: 60px auto;">
            <div class="card-header h3  text-center  ">
                Fish Transportation
            </div>
            <div class="text-center h4 text-white">REGISTRATION </div>
            <div class="card-body">
                <form class="row g-3 " method="post">
                    <div  class=" formmain col-6" >
                        <input type="text" class="form-control textbox" id="rid"  name="rid" value="<%=id != 0 ? id : ""%>" oninput="saveValue()" placeholder="" readonly required>
                        <label  class="form-labeline">Reference id*</label>
                    </div>

                    <div  class=" formmain col-6" >
                        <input type="text" class="form-control textbox" id="fullnm"  name="fullnm" oninput="saveValue()" placeholder="" required>
                        <label  class="form-labeline">Enter Fullname*</label>
                    </div>
                    <div  class=" formmain col-6">
                        <input type="text" class="form-control textbox" id="unm" name="unm" oninput="saveValue()" placeholder="" required>
                        <label  class="form-labeline">Enter Username*</label>
                    </div>
                    <div class="col-6">
                        <select id="dropdown1" class="form-select"  name="op" onchange="saveValue()" required>
                            <option selected disabled>---Choose City---</option>
                            <option value="Ahmedabad">Ahmedabad</option>
                            <option value="Amreli">Amreli</option>
                            <option value="Ankleshwar">Ankleshwar</option>
                            <option value="Bharuch">Bharuch</option>
                            <option value="Bhavnagar">Bhavnagar</option>
                            <option value="Botad">Botad</option>
                            <option value="Dahod">Dahod</option>
                            <option value="Dholka">Dholka</option>
                            <option value="Dwarka">Dwarka</option>
                            <option value="Gandhinagar">Gandhinagar</option>
                            <option value="Godhra">Godhra</option>
                            <option value="Himmatnagar">Himmatnagar</option>
                            <option value="Jamnagar">Jamnagar</option>
                            <option value="Junagadh">Junagadh</option>
                            <option value="Khambhat">Khambhat</option>
                            <option value="Mahuva">Mahuva</option>
                            <option value="Mehsana">Mehsana</option>
                            <option value="Modasa">Modasa</option>
                            <option value="Morbi">Morbi</option>
                            <option value="Nadiad">Nadiad</option>
                            <option value="Navsari">Navsari</option>
                            <option value="Palanpur">Palanpur</option>
                            <option value="Patan">Patan</option>
                            <option value="Porbandar">Porbandar</option>
                            <option value="Rajkot">Rajkot</option>
                            <option value="Surendranagar">Surendranagar</option>
                            <option value="Surat">Surat</option>
                            <option value="Vadodara">Vadodara</option>
                            <option value="Vapi">Vapi</option>
                            <option value="Veraval">Veraval</option>
                        </select>
                    </div>
                    <div  class=" formmain col-6" >
                        <input type="number" id="mno" placeholder=""  name="mnum" oninput="saveValue()" min="0" max="1234567891"  class="form-control textbox" required>
                        <label  class="form-labeline">Enter MobileNo*</label>
                    </div>
                    <div  class=" formmain col-6">
                        <input type="email"  placeholder="" name="em"  id="em" oninput="saveValue()" class="form-control textbox"  required>
                        <label  class="form-labeline" >Enter Email*</label>
                    </div>
                    <input type="hidden" id="otp" name="o" oninput="saveValue()"  value="<%= request.getParameter("otp")%>"/>
                    <input type="hidden" id="captch" name="capt" value="<%= request.getParameter("captch")%>"/>
                    <div class="d-flex">
                        <div class="col-md-3 col-lg-3 col-sm-4 fs-4 fw-bold" id="captchavalue">
                            ssss

                        </div>
                        <div class=" formmain col-lg-9">
                            <input type="text" class="form-control textbox"  name="c" id="icaptch" oninput="saveValue()" placeholder="" required>
                            <label  class="form-labeline">Enter Captcha</label></div>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-info text-center text-white " name="btn">Generate OTP</button>
                    </div>
                    <div class="mb-3">
                        <a href="Loginform.jsp" class="text-decoration-none  mx-1 text-white fw-bold"><i class='bx bxs-chevrons-right fw-bold' ></i>Login </a>
                    </div>

                </form>
                <div class="card-footer text-center  text-white">
                    @2025,Porbandar Gujarat 360575</br>Develop by:PMD
                </div> 
            </div>
        </div>

        <%
            if (request.getParameter("btn") != null) {

                final String otp = request.getParameter("o");
                final String subject = "OTP";
                final String to = request.getParameter("em");
                String cotp = request.getParameter("capt");
                String cap = request.getParameter("c");

                out.println(cotp);
                out.println(cap);

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

                    if (cotp.equals(cap)) {
                        response.sendRedirect("registration.jsp");
                        Transport.send(sendmessage);
                    } else {
                        out.println("Please enter valid otp");
                        response.sendRedirect("regi.jsp");
                    }
                } catch (Exception e) {
                    out.println(e);

                }

            }


        %>
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

            captchavalue.innerHTML = sum;
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
            // Function to save the value of textbox to sessionStorage
            function saveValue() {
                var refid = document.getElementById("rid").value;
                sessionStorage.setItem("refid", refid);
                var fnm = document.getElementById("fullnm").value;
                sessionStorage.setItem("fullnm", fnm);
                var unm = document.getElementById("unm").value;
                sessionStorage.setItem("unmv", unm);
                var mno = document.getElementById("mno").value;
                sessionStorage.setItem("mno", mno);
                var em = document.getElementById("em").value;
                sessionStorage.setItem("em", em);
                var cap = document.getElementById("icaptch").value;
                sessionStorage.setItem("cap", cap);
                var otp = document.getElementById("otp").value;
                sessionStorage.setItem("otp", otp);

                var dropdownValue = document.getElementById("dropdown1").value;
                sessionStorage.setItem("selectedValue", dropdownValue)
            }
        </script>
    </body>
</html>