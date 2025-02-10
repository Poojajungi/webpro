<%-- 
    Document   : editCompany
    Created on : Jan 17, 2025, 7:25:55 PM
    Author     : dkvag
--%>

<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <title>Edit Company</title>
        <style>
            body {
                /*background-color: #f8f9fa;*/
                background: linear-gradient(160deg,#89D8E3,#CD899E,#F9D3C0,#CFE0F8,#CD899E,#9B70A0,#101E42);
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
        <div class="vh-100 overflow-hidden">
            <div class="container border border-light bg-transparent p-4"style="width:50%;border-radius: 15px;margin-top: 150px">
                <h2 class="text-center mb-4">Company Management</h2>
                <form method="post">
                    <div class="form-group formmain">
                        <input type="number" class="form-control textbox" id="id" name="id" placeholder="" required readonly value="<%= request.getParameter("cid")%>">
                        <label class="form-labeline">Enter Id</label>
                    </div>
                    <div class="form-group formmain">
                        <input type="text" class="form-control textbox" id="name"name="nm" placeholder="" required value="<%= request.getParameter("Cname")%>">
                        <label class="form-labeline" >Enter Name</label>
                    </div>
                    <div class="form-group formmain">
                        <input type="text" class="form-control textbox" id="name"name="ad" placeholder="" required value="<%= request.getParameter("Add")%>">
                        <label class="form-labeline" >Enter  Address</label>
                    </div>
                    <!--<button type="submit" class="btn btn-primary btn-block" name="ins">Submit</button>-->
                    <div class="mybtn">
                        <button type="submit" class="btn btn-primary" name="upd">Edit</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
<%
    try {
        if (request.getParameter("upd") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            String cname = request.getParameter("nm");
            String cadd = request.getParameter("ad");

            companyData cd = new companyData();

            cd.setId(id);
            cd.setCname(cname);
            cd.setAdd(cadd);
            cd.setUserid(Integer.parseInt(session.getAttribute("logname").toString()));

            CompanyDAO dao = new CompanyDAO();
            dao.update(cd);
            response.sendRedirect("viewCompanies.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<%@include file="homeTemp.jsp" %>