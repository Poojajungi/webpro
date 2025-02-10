<%-- 
    Document   : editDrawing
    Created on : Jan 17, 2025, 6:07:48 PM
    Author     : dkvag
--%>

<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Drawing</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

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
            .mybtn{
                display: flex;
                justify-content: center; 
                text-align: center;
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
        <div class="vh-200 overflow-hidden" style="margin-bottom: 160px;">
            <div class="container border border-light bg-transparent p-4" style="width:50%;border-radius: 15px;margin-top: 150px">
                <h3 class="text-center mb-4">Owner's Drawings Managements</h3>
                <form  method="post">
                    <div class="form-group formmain">
                        <input type="number" class="form-control textbox" id="id" name="did" placeholder="" required readonly value="<%= request.getParameter("id")%>">
                        <label class="form-labeline">Enter Id</label>
                    </div>
                    <div class="form-group formmain">
                        <input type="text" class="form-control textbox" id="name"name="dnm" placeholder="" required value="<%= request.getParameter("name")%>">
                        <label class="form-labeline" >Enter Name</label>
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control" name="ddt" id="date" required value="<%= request.getParameter("date")%>">
                    </div>
                    <div class="form-group formmain">
                        <input type="number" class="form-control textbox" id="id" name="damt" placeholder="" required value="<%= request.getParameter("amount")%>">
                        <label class="form-labeline">Enter Amount</label>
                    </div>
                    <div class="mybtn">
                        <button type="submit" class="btn btn-primary" name="upd">Edit</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

<%
    try {
        if (request.getParameter("upd") != null) {
            int id = Integer.parseInt(request.getParameter("did"));
            String oname = request.getParameter("dnm");
            String date = request.getParameter("ddt");
            float amt = Float.parseFloat(request.getParameter("damt"));

            drowingData dd = new drowingData();

            dd.setId(id);
            dd.setOname(oname);
            dd.setDate(date);
            dd.setAmt(amt);
            dd.setUserid(Integer.parseInt(session.getAttribute("logname").toString()));

            DrawingDAO dao = new DrawingDAO();
            dao.update(dd);
            response.sendRedirect("viewDrawings.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<%@include file="homeTemp.jsp" %>