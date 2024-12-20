<%-- 
    Document   : temp
    Created on : 12 Dec, 2024, 5:00:52 PM
    Author     : poojajungi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                position: relative;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                background: #252839;
            }
            h1{
                position: absolute;
                font-size:3vw;
                color:#252839;
                text-shadow:0 0 0.3vw #383d52;
                text-transform: uppercase;
                user-select:none;
            }

            h1 ::before{
                content:attr(title);
                position: absolute;
                top:0;
                left:0;
                width: 0;
                height: 100%;
                color:#01fe87;
                text-shadow:0 0 0.3vw #383d52;
                border-right: 2px solid #01fe87;
                overflow: hidden;
                animation: animate 6s linear infinite;
            }
            @keyframes animate{
                0%,10%,100%
                {
                    width:0;
                }
                70%,90%
                {
                    width:100%;
                }
            }
        </style>
    </head>
    <body>
        <h1 title="Loading...">Loading...</h1>
    </body>
</html>
