
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="model.*"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="model.crud"%>
<%!  String message = null;
    String alertType = "info";
    float p;%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="CSS/stock.css"/>
        <title>Export Stock To Company</title>
        <script>
            function calculateTotal(){
            const a = parseFloat(document.getElementById("num1").value);
            const b = parseFloat(document.getElementById("num2").value);
            document.getElementById("total").value = a * b;
            }

        </script>
    </head>
    <body class="backdesign vh-200 ">
         <%
            if (session.getAttribute("logname")==null) {
                    response.sendRedirect("Loginform.jsp");
                }
        %>
        <div>
            <%@include file="homeLog.jsp" %>
        </div>
        <div class="container border border-light shadow pb-4" style="width: 70%;border-radius: 15px;margin-top: 150px;margin-bottom: 190px;">
            <form method="post">
                <h2 class="text-center mt-3">Export Stock To Company</h2>
                <div class="row mt-4 mb-3">
                    <div class="col-md-6 col-lg-6 col-sm-12">
                        <select class="form-control" name="Exportcompany">
                            <option value="" disabled selected>--Select Company Name--</option>
                            <%
                                Configuration con = new Configuration().configure().addAnnotatedClass(FishImport.class).addAnnotatedClass(companyData.class).addAnnotatedClass(ImportStock.class);
                                SessionFactory sf = con.buildSessionFactory();
                                Session sess = sf.openSession();
                                sess.beginTransaction();
                                int ses = Integer.parseInt(session.getAttribute("logname").toString());
                                Query q1 = sess.createQuery("select distinct cname from companyData where Userid="+ses);
                                List<String> l11 = q1.list();
                                for (String f : l11) {
                            %>
                            <option value=<%=f%>><%= f%></option>
                            <%
                                }
                                sess.getTransaction().commit();
                                sess.close();
                            %>
                        </select>
                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-12">
                        <input type="date" name="ExportDate"  class="form-control"/>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6 col-lg-6 col-sm-12">
                        <select class="form-control" name="Exportfish" id="dropdown">
                            <option value="" disabled selected>--Select Fish Type--</option>
                            <%
                                 con = new Configuration().configure().addAnnotatedClass(FishImport.class);
//                                SessionFactory sf = con.buildSessionFactory();
                                 sess = sf.openSession();
                                sess.beginTransaction();
                                 int sehs = Integer.parseInt(session.getAttribute("logname").toString());
                                 q1 = sess.createQuery("select distinct f.fish_name from FishImport f,ImportStock i where f.Im_Id=i.Im_ID and  i.UserID="+sehs);
                                List<String> l1 = q1.list();
                                for (String f : l1) {
                            %>
                            <option value=<%=f%>><%= f%></option>
                            <%
                                }
                                sess.getTransaction().commit();
                                sess.close();
                            %>
                        </select>
                    </div>

                    <div class="col-md-6 col-lg-6 col-sm-12 formmain">
                        <input type="number" name="ExportQty" placeholder=" "  id="num1" class="form-control textbox" oninput="calculateTotal()"/>
                        <label  class="form-labeline">Enter Quantity(KG)</label>
                        <input type="hidden" name="sessHidden" value="<%= session.getAttribute("logname") %>"/>
                    </div>

                </div>

                <div class="row mb-3">
                    <div class="col-md-6 col-lg-6 col-sm-12 formmain">
                        <input type="number" name="ExportAmt" placeholder=" " id="num2" class="form-control textbox" oninput="calculateTotal()"/>
                        <label  class="form-labeline">Enter Amount</label>
                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-12 formmain">
                        <input type="number" name="ExportTamt" placeholder=" " id="total" class="form-control textbox" readonly/>
                        <label  class="form-labeline">Total Amount</label>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-md-12 col-lg-12 col-sm-12 text-center">
                        <input type="submit" name="ExportBtn" value="Export" id="Exp1" class="btn btn-primary" />
                    </div>
                </div>
            </form>
        </div>


        <%
            crud cr = new crud();

            if (request.getParameter("ExportBtn") != null) {
                String com = request.getParameter("Exportcompany");
                String fis = request.getParameter("Exportfish");
                String dat = request.getParameter("ExportDate");
                float qty = Float.parseFloat(request.getParameter("ExportQty"));
                float am = Float.parseFloat(request.getParameter("ExportAmt"));
                float tam = Float.parseFloat(request.getParameter("ExportTamt"));
                int uid = Integer.parseInt(request.getParameter("sessHidden"));

//                int f = cr.TotalQuantity(fis, qty);
                if (cr.TotalQuantity(fis,uid) > 0.0) {
                    if (cr.ExportCompanyAdd(com, dat, fis, qty, am, tam,uid) > 0) {
                        if (cr.ExportMinus(fis, qty,uid) > 0) {
                            message = "Export Successfully done.";
                            alertType = "success";
                        }
                    } else {
                        message = "Try Again";
                        alertType = "danger";
                    }
                } else {
                    message = "OUT OF STOCK \n Total Stock is : " + cr.TotalQuantity(fis,uid);
                    alertType = "danger";
                }

            } else {
//                message = "Try Again";
//                alertType = "danger";
            }
        %>

        <!-- Bootstrap Modal -->
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

        <div class="modal fade" id="totalQuantityModal" tabindex="-1" aria-labelledby="totalQuantityModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <img  src="CSS/Images/st1.png" height="70px" width="70px"/>
                        <h1 id="modalQuantityContent" class="fw-semibold fs-5  text-center mt-2 mb-0">Fetching data...</h1>
                        <h1 id="modalQuantityContent1" class="fw-semibold fs-5  text-center mt-1"></h1>
                        <div class=" d-flex justify-content-center">
                            <button type="button" class="btn btn-success mt-3" data-bs-dismiss="modal">Okay</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>



            let totalQuantity = 0; // Store the total quantity globally

            document.getElementById("dropdown").addEventListener("change", function() {
            console.log("dropdown changed.");
            const selectedFish = this.value; // Get the selected fish type
            if (selectedFish) {
            // Get the total stock quantity for the selected fish
            const xhr = new XMLHttpRequest();
            xhr.open("GET", "/finaljsp/getTotalQuantity?fishName=" + encodeURIComponent(selectedFish), true);
            xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
            if (xhr.status == 200) {
            totalQuantity = parseFloat(xhr.responseText); // Parse the returned total stock quantity
            if (!isNaN(totalQuantity)) {
//            alert("Total Quantity of Stock is: " + totalQuantity);
            document.getElementById("modalQuantityContent").textContent =
                    "Total Quantity of Stock is: " + totalQuantity;
            document.getElementById("modalQuantityContent").style.color = "green";
            // Show the modal
            const quantityModal = new bootstrap.Modal(document.getElementById("totalQuantityModal"));
            quantityModal.show();
            } else {
            alert("Error retrieving total quantity.");
            }
            } else {
            alert("Failed to retrieve data. Status: " + xhr.status);
            }
            }
            };
            xhr.send();
            } else {
            alert("Please select a valid fish type.");
            }
            });
            document.getElementById("num1").addEventListener("focusout", function() {
            console.log("quantity input changed.");
            const enteredQuantity = parseFloat(this.value); // Get the entered quantity

            if (!isNaN(enteredQuantity) && enteredQuantity > 0) {
            // Check if the entered quantity exceeds available stock
            if (enteredQuantity > totalQuantity) {
//            alert("Entered quantity exceeds available stock. Available stock: " + totalQuantity);
            document.getElementById("modalQuantityContent").innerHTML =
                    "Entered quantity exceeds available stock.";
            document.getElementById("modalQuantityContent").style.color = "red";
            document.getElementById("modalQuantityContent1").innerHTML = "Available stock: " + totalQuantity;
            document.getElementById("modalQuantityContent1").style.color = "green";
            // Show the modal
            const quantityModal = new bootstrap.Modal(document.getElementById("totalQuantityModal"));
            quantityModal.show();
            document.getElementById("num2").disabled = true;
            document.getElementById("Exp1").disabled = true;
            document.getElementById("Exp1").style.cursor = "not-allowed";
            setTimeout(function() {
            const inputField = document.getElementById("num1");
            inputField.focus(); // Focus the input field
            }, 5000);
//                        document.getElementById("total").style.disabled = true;
            } else {
            console.log("Entered quantity is valid.");
            document.getElementById("num2").disabled = false;
            document.getElementById("Exp1").disabled = false;
            document.getElementById("Exp1").style.cursor = "pointer";
            }
            } else {
            document.getElementById("modalQuantityContent").innerHTML = "Please Enter the Valid Quantity !";
            document.getElementById("modalQuantityContent").style.color = "red";
            const quantityModal = new bootstrap.Modal(document.getElementById("totalQuantityModal"));
            quantityModal.show();
            }
            });
            <% if (message != null) { %>
            document.addEventListener("DOMContentLoaded", function () {
            const alertModal = new bootstrap.Modal(document.getElementById("alertModal"));
            alertModal.show();
            const okButton = document.getElementById("okButton");
            if (okButton) {
            okButton.addEventListener("click", function () {
            // Remove query parameters from the URL
            const baseUrl = window.location.origin + window.location.pathname;
//                window.location.replace(baseUrl); // Replaces current URL and refreshes
//                    window.location.replace(" ",baseUrl);
//            request.setAttribute("message", null);
                <% message=null; %>
            });
            }
            });
            <% }%>
        </script>
        <%@include file="homeTemp.jsp" %>
    </body>
</html>