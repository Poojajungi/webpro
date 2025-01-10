
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="model.*"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%!  String message = null;
    String alertType = "info";%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="CSS/stock.css"/>
        <title>Export Stock To Agency/Person</title>
           <script>
            function calculateTotal(){
                const a = parseFloat(document.getElementById("num1").value);
                const b = parseFloat(document.getElementById("num2").value);
                document.getElementById("total").value = a*b;
            }
        </script>
    </head>
    <body class="backdesign vh-100 overflow-hidden">
        <div class="container border border-light shadow pb-4 " style="width: 70%;border-radius: 15px;margin-top: 150px;">
            <form method="post">
                <h2 class="text-center mt-3">Export Stock To Agency/Person</h2>
                <div class="row mt-4 mb-3">
                    <div class="col-md-6 col-lg-6 col-sm-12 formmain">
                        <input type="text" name="ExportpName" placeholder=" "  class="form-control textbox"/>
                        <label  class="form-labeline">Enter Agency/Person Name</label>
                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-12">
                        <input type="date" name="ExportpDate"  class="form-control"/>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6 col-lg-6 col-sm-12">
                        <select class="form-control" name="ExportpFish">
                            <option value="one">--Select Fish Type--</option>
                             <%
                                Configuration con = new Configuration().configure().addAnnotatedClass(FishImport.class);
                                SessionFactory sf = con.buildSessionFactory();
                                Session sess = sf.openSession();
                                sess.beginTransaction();
                                Query q1 = sess.createQuery("select distinct fish_name from FishImport");
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
                        <input type="number" name="ExportpQty" placeholder=" " id="num1" class="form-control textbox" oninput="calculateTotal()"/>
                        <label  class="form-labeline">Enter Quantity(KG)</label>
                    </div>

                </div>

                <div class="row mb-3">
                    <div class="col-md-6 col-lg-6 col-sm-12 formmain">
                        <input type="number" name="ExportpAmt" placeholder=" " id="num2"  class="form-control textbox" oninput="calculateTotal()"/>
                        <label  class="form-labeline">Enter Amount</label>
                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-12 formmain">
                        <input type="number" name="ExportptAmt" placeholder=" " id="total" class="form-control textbox" readonly/>
                        <label  class="form-labeline">Total Amount</label>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-md-12 col-lg-12 col-sm-12 text-center">
                        <input type="submit" name="ExportABtn" value="Export" class="btn btn-primary"/>
                    </div>
                </div>
            </form>
        </div>
         <%
            if (request.getParameter("ExportABtn") != null) {
                String com = request.getParameter("ExportpName");
                String fis = request.getParameter("ExportpFish");
                String dat = request.getParameter("ExportpDate");
                float qty = Float.parseFloat(request.getParameter("ExportpQty"));
                float am = Float.parseFloat(request.getParameter("ExportpAmt"));
                float tam = Float.parseFloat(request.getParameter("ExportptAmt"));

                crud cr = new crud();
                if (!cr.TotalQuantity(fis, qty).equals(0.0)) {
                    if (cr.ExportAgencyAdd(com, dat, fis, qty, am, tam) > 0) {
                        if (cr.ExportMinus(fis, qty) > 0) {
                            message = "Export Successfully done.";
                            alertType = "success";
                        }
                    } else {
                        message = "Try Again";
                        alertType = "danger";
                    }
                } else {
                    message = "OUT OF STOCK \n Total Stock is : " + cr.TotalQuantity(fis, qty);
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

        <script>
            <% if (message != null) { %>
            document.addEventListener("DOMContentLoaded", function () {
            const alertModal = new bootstrap.Modal(document.getElementById("alertModal"));
            alertModal.show();
            });
            document.getElementById("okButton").addEventListener("click", function () {
            // Remove query parameters from the URL
            const baseUrl = window.location.origin + window.location.pathname;
            history.replaceState(null, "", baseUrl);
            });
            <% }%>
        </script>
    </body>
</html>
