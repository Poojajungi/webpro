<%-- 
    Document   : error
    Created on : 8 Feb, 2025, 12:00:54 AM
    Author     : poojajungi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <title>Oops</title>
    </head>
    <body style="background: linear-gradient(150deg,#89D8E3,white,white,whitesmoke,#89D8E3);background-repeat: no-repeat;" class="vh-100 overflow-hidden"> 
        <form action="Loginform.jsp">
        <div class="container border-light shadow border p-4" style="width: 40%;border-radius: 5px;margin-top: 150px;margin-bottom: 190px;">
            <div class="d-flex flex-column justify-content-center">
                <img  src="CSS/Images/nt.png" height="100px" width="100px" class="mx-auto mt-3 "/>
                <h3 class="mt-4 text-center">Oops! Something went wrong!</h3>
                <h5 class="text-center">Please Try Again !</h5>
                <div class="form-group text-center mt-4 mb-4">
                    <button type="submit" class="btn btn-warning fw-bold  btn-outline-secondary" >
                    Login Again
                </button>
                </div>
            </div>
        </div>
        </form>
    </body>
</html>
