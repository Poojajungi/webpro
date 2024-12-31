
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
        <script type="text/javascript">

            const urlParams = new URLSearchParams(window.location.search);
            const selectedOption = urlParams.get('mySelect');
            // Select the option in the dropdown
            const selectElement = document.getElementById('mySelect');
            for (let i = 0; i < selectElement.options.length; i++) {
            if (selectElement.options[i].value === selectedOption) {
            selectElement.options[i].selected = true;
            break;
            }
            }

            function calculateTotal(){
            const a = parseFloat(document.getElementById("num1").value);
            const b = parseFloat(document.getElementById("num2").value);
            document.getElementById("total").value = a * b;
            }
            function newtables() {
            var table = document.getElementById("myTable").getElementsByTagName('tbody')[0];
            var row = table.insertRow();
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            cell1.innerHTML = document.getElementsByName('fish')[0].value;
            cell2.innerHTML = document.getElementsByName('ImportQty')[0].value;
            cell3.innerHTML = document.getElementsByName('ImportAmt')[0].value;
            cell4.innerHTML = document.getElementsByName('ImportTAmt')[0].value;
            // Clear input fields
            document.getElementByName("fish").value = null;
            document.getElementByName("ImportQty").value = null;
            document.getElementByName("ImportAmt").value = null;
            document.getElementByName("ImportTAmt").value = null;
            }
            function tablehides(){
            var table = document.getElementById("myTable");
            if (table.style.display === "none") {
            table.style.display = "table";
            } else {
            table.style.display = "none";
            }
            }

            function myclear(){
            // Remove the current URL parameters
            window.history.pushState({}, document.title, window.location.pathname);
            window.location.reload();
            }

        </script>
    </head>
    <% 
        String userInput = request.getParameter("boat/owner");
        String d = request.getParameter("ImportDate");
//        l.add(request.getParameter("boat/owner"));
%>
    <body class="backdesign vh-100 overflow-hidden">
        <div class="container border border-light shadow pb-4 " style="width: 70%;border-radius: 15px;margin-top: 150px;">
            <form>
                <h2 class="text-center mt-3">Import Stock</h2>
                <div class="row mt-4 mb-3">
                    <div class="col-md-6 col-lg-6 col-sm-12">
                        <select class="form-control" name="boat/owner"  required>
                            <option >--Select Boat/Owner--</option>
                            <option value="one">One</option>
                            <option value="two">Two</option>
                            <option value="three">Three</option>
                        </select>
                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-12">
                        <input type="date" name="ImportDate"  class="form-control" value="<%= d != null ? d : ""%>" />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6 col-lg-6 col-sm-12">
                        <select class="form-control" name="fish" id="fishname" >
                            <option>--Select Fish Type--</option>
                            <option value="One">One</option>
                            <option value="Two">Two</option>
                            <option value="Three">Three</option>
                        </select>
                    </div>

                    <div class="col-md-6 col-lg-6 col-sm-12 formmain">
                        <input type="number" name="ImportQty" placeholder=" " id="num1"  class="form-control textbox" oninput="calculateTotal()" />
                        <label  class="form-labeline">Enter Quantity(KG)</label>
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
                        <input type="number" name="idd" placeholder=" " id="total" class="form-control textbox" value=""  />
                        <label  class="form-labeline">Reference Id</label>

                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-6 text-center">
                        <button type="submit" class="btn btn-light fw-bold" onclick="newtables()" name="Addbtn">Add</button>
                        <input type="submit" name="ImportBtn" value="Import" class="btn btn-primary fw-bold" />
                        <input type="button" value="Refresh" onclick="myclear()"/>
                        <!--<input type="button" name="btns" value="Click" onclick="tablehides()"/>-->
                    </div>
                </div>

                <!--                <div>
                                    <table class="table table-bordered mt-2 table-sm"   id="myTable">
                                        <thead>
                                            <tr>
                                                <th>Fish Name</th>
                                                <th>Quantity</th>
                                                <th>Amount</th>
                                                <th>Total Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>-->
            </form>
        </div>
    </body>
</html>
<%
    if (request.getParameter("ImportBtn") != null) {
        String boat = request.getParameter("boat/owner");
        String dat = request.getParameter("ImportDate");
//   out.print(boat);
        crud cr = new crud();
        if (cr.ImportAdd(boat, dat, fish, qty, amt, tamt) > 0) {
            out.print("<script>alert(' Done.')</script>");
        } else {
            out.print("<script>alert('Try Again')</script>");
        }
        fish.clear();
        amt.clear();
        tamt.clear();
    } 
   else if (request.getParameter("Addbtn") != null) {
        fish.add(request.getParameter("fish"));
        qty.add(Float.parseFloat(request.getParameter("ImportQty")));
        amt.add(Float.parseFloat(request.getParameter("ImportAmt")));
        tamt.add(Float.parseFloat(request.getParameter("ImportTAmt")));
    }

%>


