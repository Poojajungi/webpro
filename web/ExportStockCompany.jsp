
<%@page import="model.crud"%>
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
                document.getElementById("total").value = a*b;
            }
        </script>
    </head>
    <body class="backdesign vh-100 overflow-hidden">
        <div class="container border border-light shadow pb-4 " style="width: 70%;border-radius: 15px;margin-top: 150px;">
            <form>
                <h2 class="text-center mt-3">Export Stock To Company</h2>
                <div class="row mt-4 mb-3">
                    <div class="col-md-6 col-lg-6 col-sm-12">
                        <select class="form-control" name="Exportcompany">
                            <option value="one" >--Select Company Name--</option>
                            <option value="one">One</option>
                            <option value="one">Two</option>
                            <option value="one">Three</option>
                        </select>
                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-12">
                        <input type="date" name="ExportDate"  class="form-control"/>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6 col-lg-6 col-sm-12">
                        <select class="form-control" name="Exportfish">
                            <option value="one">--Select Fish Type--</option>
                            <option value="one">One</option>
                            <option value="one">Two</option>
                            <option value="one">Three</option>
                        </select>
                    </div>

                    <div class="col-md-6 col-lg-6 col-sm-12 formmain">
                        <input type="number" name="ExportQty" placeholder=" "  id="num1" class="form-control textbox" oninput="calculateTotal()"/>
                        <label  class="form-labeline">Enter Quantity(KG)</label>
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
                        <input type="submit" name="ExportBtn" value="Export" class="btn btn-primary"/>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>

<%
    if (request.getParameter("ExportBtn")!=null) {
            String com = request.getParameter("Exportcompany");
            String fis = request.getParameter("Exportfish");
            String dat = request.getParameter("ExportDate");
            float qty = Float.parseFloat(request.getParameter("ExportQty"));
            float am = Float.parseFloat(request.getParameter("ExportAmt"));
            float tam = Float.parseFloat(request.getParameter("ExportTamt"));
            
            crud cr = new crud();
            if (cr.ExportCompanyAdd(com, dat, fis, qty, am, tam)>0) {
                    out.print("<script>alert('Export Successfully Done.')</script>");
                }
            else{
                out.print("Try Again");
            }
        }
%>