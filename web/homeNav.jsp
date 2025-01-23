
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/home.css"/>
<!--        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
-->        <script src="http://translate.google.com/translate_a/element.js?cb=loadGoogleTranslate"></script>
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
        <script>

         function loadGoogleTranslate()
            {
            new google.translate.TranslateElement(
                {
                    pageLanguage: 'en',   // Gujarati as the source language
                    includedLanguages: 'en,gu,hi', // Target languages (English and Gujarati)
                    layout: google.translate.TranslateElement.InlineLayout.SIMPLE
                },"myid");
            }
    </script>

    </head>
    <body>
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
                                Boat/Owner
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Register</a></li>
                                <li><a class="dropdown-item" href="#">View</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Withdrawal Management
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Add Withdrawal</a></li>
                                <li><a class="dropdown-item" href="#">View Withdrawal</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Stock Management
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="ViewImport.jsp">Import Stock</a></li>
                                <!--                                     Submenu opens on hover with JavaScript 
                                                                                            <li class="nav-item ms-2 dropend submenu" id="submenu"> 
                                                                                                <a class="nav-link dropdown-toggle" href="#" role="button" aria-expanded="false">
                                                                                                    Export Stock 
                                                                                                </a>
                                                                                                <ul class="dropdown-menu">
                                                                                                    <li><a class="dropdown-item" href="#">Export to Company</a></li>
                                                                                                    <li><a class="dropdown-item" href="#">Export to Agency/Person</a></li>
                                                                                                </ul>
                                                                                            </li>-->
                                <li><a class="dropdown-item" href="ViewExport.jsp">Export Stock</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Stock Report</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Company
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Add New Company</a></li>
                                <li><a class="dropdown-item" href="#">View Company</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Language
                            </a>
                            <ul class="dropdown-menu">
                                <li><div id="myid" ></div>
                                </li>
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
    </body>
</html>


