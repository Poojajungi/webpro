
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="model.fishnames"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="model.crud"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! int i = 0;
    List<String> fish = new ArrayList<String>();
    List<Float> qty = new ArrayList<Float>();
    List<Float> amt = new ArrayList<Float>();
    List<Float> tamt = new ArrayList<Float>();
    crud cr = new crud();
    String message = null;
    String alertType = "info";
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="CSS/stock.css"/>
        <title>JSP Page</title>
<script type="text/javascript" >

    
window.addEventListener("load", function () {
    // Select the anchor tag you want to monitor
    const anchorTag = document.querySelector("a#myAnchor"); // Replace #myAnchor with your anchor's selector

    if (anchorTag) {
        // Create a MutationObserver to monitor changes in the text content of the anchor tag
        const observer = new MutationObserver(function (mutationsList) {
            for (const mutation of mutationsList) {
                if (mutation.type === "characterData" || mutation.type === "childList") {
                    console.log("Anchor text changed to:", anchorTag.textContent);
                   if (anchorTag.textContent.trim() === "Fish Transportation") {
                    document.getElementById("fishTypeDropdown").style.display = "block";
                    document.getElementById("fishTypeDropdown2").style.display = "none";
                } else {
                    console.log("English");
                    document.getElementById("fishTypeDropdown").style.display = "none";
                    document.getElementById("fishTypeDropdown2").style.display = "block";
                }
                }
            }
        });

        // Configure the observer to watch for text content changes
        observer.observe(anchorTag, { childList: true, characterData: true, subtree: true });

        console.log("Monitoring text changes on:", anchorTag);
    } else {
        console.log("Anchor tag not found. Make sure the selector is correct.");
    }
});



            function calculateTotal(){
            const a = document.getElementById("num1").value;
            const b = document.getElementById("num2").value;
            document.getElementById("total").value = a * b;
            }

            function enableImportButton() {
            document.getElementById("btn2").disabled = false; // Enable the 'Import' button
            }

            function ShowBtn() {
            document.getElementById("btn2").disabled = false;
            }

            // Function to prevent form reload and only update the "Add" action
            function handleAddButton(event) {
            event.preventDefault(); // Prevent form submission
            enableImportButton(); // Enable the 'Import' button
            // Optionally, handle form data here before submitting or adding
            }

            function getQueryParam(param) {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(param);
            }

            // Automatically select the dropdown value based on the URL
            document.addEventListener("DOMContentLoaded", function () {
            const selectedValue = getQueryParam("boat/owner"); // Get 'boat/owner' from URL
            if (selectedValue) {
            const dropdown = document.getElementById("dropdown");
            dropdown.value = selectedValue; // Set the value in the dropdown
            }
            });
            document.addEventListener("DOMContentLoaded", function () {
            // Check if the "Add" button was clicked before the page reload
            if (sessionStorage.getItem("addClicked") === "true") {
            document.getElementById("btn2").disabled = false; // Enable 'Import' button
            }

            // Attach event listener to the "Add" button
            document.getElementById("addBtn").addEventListener("click", function () {
            sessionStorage.setItem("addClicked", "true"); // Mark 'Add' as clicked
            });
            // Optional: Clear sessionStorage after form is reset
            document.getElementById("formId").addEventListener("reset", function () {
            sessionStorage.removeItem("addClicked");
            });
            });
        </script>
    </head>
    <%
        String selectedValue = request.getParameter("boat/owner");
        String userInput = request.getParameter("boat/owner");
        String d = request.getParameter("ImportDate");
        int ids = cr.getIds() + 1;
    %>
    <body class="backdesign vh-200 ">
        <div>
            <%@include file="homeLog.jsp" %>
        </div>
        <div class="container border border-light shadow pb-4 " style="width: 70%;border-radius: 15px;margin-top: 150px;margin-bottom: 190px;">
            <form method="post" id="formId">
                <h2 class="text-center mt-3">Import Stock</h2>
                <div class="row mt-4 mb-3">
                    <div class="col-md-6 col-lg-6 col-sm-12">

                        <select class="form-control" name="boat/owner" id="dropdown" required>
                            <option value="" disabled <%= selectedValue == null ? "selected" : ""%>>--Select Boat/Owner--</option>
                            <option value="one" <%= "one".equals(selectedValue) ? "selected" : ""%>>One</option>
                            <option value="two" <%= "two".equals(selectedValue) ? "selected" : ""%>>Two</option>
                            <option value="three" <%= "three".equals(selectedValue) ? "selected" : ""%>>Three</option>
                        </select>

                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-12">
                        <input type="date" name="ImportDate"  class="form-control" value="<%= d != null ? d : ""%>" required/>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6 col-lg-6 col-sm-12">
                        <select class="form-control" name="fish" id="fishTypeDropdown" >
                            <option value="" disabled selected>--Select Fish Type--</option>
                            <%
                                Configuration con = new Configuration().configure().addAnnotatedClass(fishnames.class);
                                SessionFactory sf = con.buildSessionFactory();
                                Session sess = sf.openSession();
                                sess.beginTransaction();
                                Query q1 = sess.createQuery("from fishnames");
                                List<fishnames> l1 = q1.list();
                                for (fishnames obj : l1) {
                            %>
                            <option value="<%= obj.getEng_name()%>" ><%= obj.getEng_name()%></option>
                            <%
                                }
                            %>
                        </select>

                        <!--<select class="form-control" name="fish" id="fishTypeDropdown2"  style="display: block;">--> 
                                                    <select class="form-control" name="fish" id="fishTypeDropdown2"  style="display: none;"> 

                            <option value="" disabled selected>--Select Fish Type--</option>
                            <%
                                q1 = sess.createQuery("from fishnames");
                                List<fishnames> l2 = q1.list();
                                for (fishnames obj : l1) {
                            %>
                            <option value="<%= obj.getGuj_name()%>" ><%= obj.getGuj_name()%></option>
                            <%
                                }
                                sess.getTransaction().commit();
                                sess.close();
                                sf.close();
                            %>
                        </select>
                    </div>

                    <div class="col-md-6 col-lg-6 col-sm-12 formmain">
                        <input type="number" name="ImportQty" placeholder=" " id="num1"  class="form-control textbox" oninput="calculateTotal()" />
                        <label  class="form-labeline">Enter Quantity(KG)</label>
                        <input type="hidden" name="sessHidden" value="<%= session.getAttribute("logname") %>"/>
                    </div>

                </div>

                <div class="row mb-3">
                    <div class="col-md-6 col-lg-6 col-sm-12 formmain">
                        <input type="number" name="ImportAmt" placeholder=" " id="num2"  class="form-control textbox" oninput="calculateTotal()" />
                        <label  class="form-labeline">Enter Amount</label>
                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-12 formmain">
                        <input type="number" name="ImportTAmt" placeholder=" " id="total" class="form-control textbox" readonly/>
                        <label  class="form-labeline">Total Amount</label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 col-lg-6 col-sm-12 formmain">
                        <input type="number" name="idd" placeholder=" " id="total" class="form-control textbox" value="<%= ids != 0 ? ids : ""%>"  readonly/>
                        <label  class="form-labeline">Reference Id</label>
                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-6 text-center">
                        <button type="submit" class="btn btn-light fw-bold"  name="Addbtn" id="addBtn">Add</button>
                        <input type="submit" name="ImportBtn" value="Import" id="btn2" class="btn btn-primary fw-bold"  disabled />
                    </div>
                </div>
            </form>
        </div>

        <%
            try{
            if (request.getParameter("ImportBtn") != null) {
                int id = Integer.parseInt(request.getParameter("idd"));
                String boat = request.getParameter("boat/owner");
                String dat = request.getParameter("ImportDate");
                int uid = Integer.parseInt(request.getParameter("sessHidden"));
                
                if (cr.ImportAdd(id, boat, dat, fish, qty, amt, tamt,uid) > 0) {
                    message = "Fish Imported Successfully.";
                    alertType = "success";
                } else {
                    message = "Try Again";
                    alertType = "danger";
                }
                fish.clear();
                amt.clear();
                tamt.clear();
                request.setAttribute("ImportDate", null);
            } else if (request.getParameter("Addbtn") != null) {
                if (request.getParameter("fish")==null || request.getParameter("ImportQty")==null || request.getParameter("ImportAmt")==null || request.getParameter("ImportTAmt")==null) {
                        message = "Please Fill Out the Empty Field.";
                        alertType = "danger";
                    }
                else{
                fish.add(request.getParameter("fish"));
                qty.add(Float.parseFloat(request.getParameter("ImportQty")));
                amt.add(Float.parseFloat(request.getParameter("ImportAmt")));
                tamt.add(Float.parseFloat(request.getParameter("ImportTAmt")));
                }
            }
            }catch(Exception e){
                response.sendRedirect("error.jsp");
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

        <% if (message != null) { %>
    <script>
        
        document.addEventListener("DOMContentLoaded", function () 
        {
                const alertModalElement = document.getElementById("alertModal");
//                if (alertModalElement) {
                    const alertModal = new bootstrap.Modal(alertModalElement);
                    alertModal.show();
//                    sessionStorage.setItem("modalShown", "true");
//                }
//            }

            // Attach click event only if the button is present
            const okButton = document.getElementById("okButton");
            if (okButton) {
                okButton.addEventListener("click", function () {
                    const baseUrl = window.location.origin + window.location.pathname;
                    window.location.replace(baseUrl); // Replaces current URL and refreshes
                    const btn2 = document.getElementById("btn2");
                    if (btn2) {
                        btn2.disabled = true;
                    }
                    <% message=null; %>
                            
                });
            }
        });
    </script>
<% } %>
    </body>
</html>
<%@include file="homeTemp.jsp" %>