
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AdminPage</title>
        <link rel="stylesheet" href="CSS/home.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="http://translate.google.com/translate_a/element.js?cb=loadGoogleTranslate"></script>
        <style>
            /* Ensure the nested dropdowns align correctly */
            /*            .dropdown-menu .dropdown-menu {
                             margin-left: 100%; 
                            top: 0;
                            left: 100%;
                            margin-top: -5px;
                        }
            
                         Hide submenu by default 
                        .submenu .dropdown-menu {
                            display: none;
                        }
            
                         Optional: Add transition for smooth effect 
                        .submenu .dropdown-menu {
                            transition: opacity 0.2s;
                        }*/
        </style>
        <script type="text/javascript">
            function loadGoogleTranslate()
            {
                new google.translate.TranslateElement(
                {
                pageLanguage: 'en', // Gujarati as the source language
                        includedLanguages: 'en,gu,hi', // Target languages (English and Gujarati)
                        layout: google.translate.TranslateElement.InlineLayout.SIMPLE
                }, "myid");
            }

//   // Listen for language change and reset dropdown when English is selected
//            function onLanguageChanged(event) {
//            const selectedLanguage = event.data.language;
//            // If English is selected, reset the dropdown on the other page
//            if (selectedLanguage === 'en') {
//            // Send a message or trigger an action to reset the dropdown on another page
//            localStorage.setItem('selectedLanguage', 'en'); // Store 'en' in localStorage
//            resetDropdown(); // Reset the dropdown immediately
//            }
//            }
//
//            // Initialize Google Translate API
//            document.addEventListener("DOMContentLoaded", function () {
//            google.translate.TranslateElement.prototype.onLanguageChanged = onLanguageChanged;
//            });
           

        </script>

    </head>
    <body>
        <div class="mainImg vh-100">
            <nav class="navbar navbar-expand-lg bg-transparent fs-5">
                <div class="container-fluid">
                    <a class="navbar-brand fw-semibold" href="home.jsp">Fish Transportation</a>
                    <button class="navbar-toggler shadow-none border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                           
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    User
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">View User</a></li>
                                </ul>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Language
                                </a>
                                <ul class="dropdown-menu">
                                    <li><div id="myid" ></div></li>
                                </ul>
                            </li>
                        </ul>

                        <div class="d-flex align-items-center gap-3">
                            <a href="#login" class="text-black">Login</a>
                            <a href="#signUp" class="text-white text-decoration-none px-3 py-1 rounded-4" style="background-color: #f94ca4">Register</a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
     
    <%--<%@include file="homeFooter.jsp" %>--%>
    </body>
</html>

<%@include file="homeFooter.jsp" %>
