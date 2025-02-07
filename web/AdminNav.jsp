
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
            
      // Wait for the Google Translate widget to initialize
    function onGoogleTranslateReady() {
        const interval = setInterval(() => {
            const langCombo = document.querySelector(".goog-te-combo"); // The Google Translate language dropdown
            if (langCombo) {
                clearInterval(interval); // Stop checking once the dropdown is found

                // Add event listener to save the selected language
                langCombo.addEventListener("change", function () {
                    const selectedLanguage = langCombo.value; // Get the selected language
                    localStorage.setItem("selectedLanguage", selectedLanguage); // Save it to localStorage
                    console.log("Language saved:", selectedLanguage);
                });

                // Apply saved language if it exists
                const savedLanguage = localStorage.getItem("selectedLanguage");
                if (savedLanguage) {
                    langCombo.value = savedLanguage; // Set the dropdown value
                    langCombo.dispatchEvent(new Event("change")); // Trigger the change event
                    console.log("Language reapplied:", savedLanguage);
                }
            }
        }, 100); // Check every 100ms
    }

    // Load Google Translate widget and set up language persistence
    window.addEventListener("load", function () {
        loadGoogleTranslate();
        onGoogleTranslateReady();
    });

            
    </script>

    </head>
    <body>
        <div class="mainImg vh-100">
            <nav class="navbar navbar-expand-lg bg-transparent fs-5">
                <div class="container-fluid">
                    <a class="navbar-brand fw-semibold" href="AdminNav.jsp">Fish Transportation</a>
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
                                    <li><a class="dropdown-item" href="view registration.jsp">View User</a></li>
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
                            <a href="Loginform.jsp" class="text-white text-decoration-none px-3 shadow py-1 fw-semibold rounded-4" style="background-color: #f94ca4;font-size:medium; ">LogOut</a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
     
        <div class="container">
            <div class="text-center justify-content-center">
                <h5 class="text-uppercase mt-3 fw-bold fs-xxl" style="font-family: serif;">A Wave of Relief: Stress-Free Fish Transport</h5>
                <hr>
                <p style="font-family: serif;">
                    Fish can be transported in a variety of containers, including plastic bags, styrofoam boxes, wooden buckets, and metal cans. Some containers, like wood or styrofoam, provide good insulation from heat. 
                    Containers made of metal or plastic may need to be wrapped in wet towels or packed with ice to keep the temperature down. 
                </p>

                <div class="mycontainer">
                    <div style="--r:-15;" class="glass">
                        <img src="CSS/Images/f4.jpg" width="100%" height="200px" class="myimg"/>
                        <path
                            d="M165.9 397.4c0 2-2.3 3.6-5.2 3.6-3.3.3-5.6-1.3-5.6-3.6 0-2 2.3-3.6 5.2-3.6 3-.3 5.6 1.3 5.6 3.6zm-31.1-4.5c-.7 2 1.3 4.3 4.3 4.9 2.6 1 5.6 0 6.2-2s-1.3-4.3-4.3-5.2c-2.6-.7-5.5.3-6.2 2.3zm44.2-1.7c-2.9.7-4.9 2.6-4.6 4.9.3 2 2.9 3.3 5.9 2.6 2.9-.7 4.9-2.6 4.6-4.6-.3-1.9-3-3.2-5.9-2.9zM244.8 8C106.1 8 0 113.3 0 252c0 110.9 69.8 205.8 169.5 239.2 12.8 2.3 17.3-5.6 17.3-12.1 0-6.2-.3-40.4-.3-61.4 0 0-70 15-84.7-29.8 0 0-11.4-29.1-27.8-36.6 0 0-22.9-15.7 1.6-15.4 0 0 24.9 2 38.6 25.8 21.9 38.6 58.6 27.5 72.9 20.9 2.3-16 8.8-27.1 16-33.7-55.9-6.2-112.3-14.3-112.3-110.5 0-27.5 7.6-41.3 23.6-58.9-2.6-6.5-11.1-33.3 2.6-67.9 20.9-6.5 69 27 69 27 20-5.6 41.5-8.5 62.8-8.5s42.8 2.9 62.8 8.5c0 0 48.1-33.6 69-27 13.7 34.7 5.2 61.4 2.6 67.9 16 17.7 25.8 31.5 25.8 58.9 0 96.5-58.9 104.2-114.8 110.5 9.2 7.9 17 22.9 17 46.4 0 33.7-.3 75.4-.3 83.6 0 6.5 4.6 14.4 17.3 12.1C428.2 457.8 496 362.9 496 252 496 113.3 383.5 8 244.8 8zM97.2 352.9c-1.3 1-1 3.3.7 5.2 1.6 1.6 3.9 2.3 5.2 1 1.3-1 1-3.3-.7-5.2-1.6-1.6-3.9-2.3-5.2-1zm-10.8-8.1c-.7 1.3.3 2.9 2.3 3.9 1.6 1 3.6.7 4.3-.7.7-1.3-.3-2.9-2.3-3.9-2-.6-3.6-.3-4.3.7zm32.4 35.6c-1.6 1.3-1 4.3 1.3 6.2 2.3 2.3 5.2 2.6 6.5 1 1.3-1.3.7-4.3-1.3-6.2-2.2-2.3-5.2-2.6-6.5-1zm-11.4-14.7c-1.6 1-1.6 3.6 0 5.9 1.6 2.3 4.3 3.3 5.6 2.3 1.6-1.3 1.6-3.9 0-6.2-1.4-2.3-4-3.3-5.6-2z"
                            ></path>
                        </svg>
                    </div>
                    <div style="--r:5;" class="glass">
                        <img src="CSS/Images/f3.jpg" width="100%" height="200px" class="myimg"/>
                        <path
                            d="M392.8 1.2c-17-4.9-34.7 5-39.6 22l-128 448c-4.9 17 5 34.7 22 39.6s34.7-5 39.6-22l128-448c4.9-17-5-34.7-22-39.6zm80.6 120.1c-12.5 12.5-12.5 32.8 0 45.3L562.7 256l-89.4 89.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l112-112c12.5-12.5 12.5-32.8 0-45.3l-112-112c-12.5-12.5-32.8-12.5-45.3 0zm-306.7 0c-12.5-12.5-32.8-12.5-45.3 0l-112 112c-12.5 12.5-12.5 32.8 0 45.3l112 112c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L77.3 256l89.4-89.4c12.5-12.5 12.5-32.8 0-45.3z"
                            ></path>
                        </svg>
                    </div>
                    <div  style="--r:25;" class="glass">
                        <img src="CSS/Images/f5.png" width="100%" height="200px" class="myimg"/>
                        <path
                            d="M64 64C28.7 64 0 92.7 0 128V384c0 35.3 28.7 64 64 64H512c35.3 0 64-28.7 64-64V128c0-35.3-28.7-64-64-64H64zm64 320H64V320c35.3 0 64 28.7 64 64zM64 192V128h64c0 35.3-28.7 64-64 64zM448 384c0-35.3 28.7-64 64-64v64H448zm64-192c-35.3 0-64-28.7-64-64h64v64zM288 160a96 96 0 1 1 0 192 96 96 0 1 1 0-192z"
                            ></path>
                        </svg>
                    </div>
                </div>

                <p class="mb-5 mt-3" style="font-family: serif;">
                    There are two basic transport systems for live fish - the closed system and the open system. The closed system is a sealed container in which all the requirements for survival are self-contained. The simplest of these is a sealed plastic bag partly filled with water and oxygen. The open system consists of water-filled containers in which the requirements for survival are supplied continuously from outside sources. The simplest of these is a small tank with an aerator stone.

                    These systems will be reviewed with respect to the problems of fish preparation for transport, types of vehicles and equipments, problems of water quality and its changes during transport, and chemical aids used during fish transport.

                    There is ample literature on fish transport and associated problems; however, the literary sources overlap and give partly differing interpretations of the recommended ways of transport. These are the reasons why this survey aims at comprising mainly those published results which have been fully verified in practice and which are, therefore, reliably instructive.

                    The basic factors and principles associated with any live fish transport systems, or influencing them, are evaluated before the actual ways of fish transport are commented on.
                </p>
            </div>
        </div>
    <%--<%@include file="homeFooter.jsp" %>--%>
    <footer class="bg-transparent overflow-hidden mt-2">
            <div class=" bg-white  text-md-left">
                <div class="row">

                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1722.624330653458!2d69.59603465243441!3d21.642154734431763!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3956343635a3afa7%3A0x1e555cc04c4b6067!2sRaandal%20Mataji%20Nu%20Mandir%20Kharva%20Vad!5e0!3m2!1sen!2sin!4v1734491993965!5m2!1sen!2sin" 
                            width="600" height="450" style="border:0;" allowfullscreen="" 
                            loading="lazy" referrerpolicy="no-referrer-when-downgrade">
                    </iframe>
                </div>

                <div class=" container  justify-content-around border shadow mt-2 mx-auto row text-md-left">
                    <div class="col-md-3   mx-auto mt-3 d-flex gap-2">
                        <div>
                            <p>
                                <i class="fas fa-location mr-3 text-primary" style="font-size: 23px;"></i>
                            </p>
                        </div>
                        <div>
                            <h5 class="text-uppercase mb-2 font-weight-bold text-primary">Porbandar</h5>
                            <p>Fish Market , Kharvavad <br> Porbandar-360575</p>
                        </div>
                    </div>

                    <div class="col-md-3  mx-auto mt-3 d-flex gap-2">
                        <div>
                            <p>
                                <i class="fas fa-envelope mr-3 text-primary" style="font-size: 23px;"></i>
                            </p>
                        </div>
                        <div>
                            <h5 class="text-uppercase mb-2 font-weight-bold text-primary">Email</h5>
                            <p>FishTransportation@gmail.com</p>
                        </div>
                    </div>

                    <div class="col-md-3  mx-auto mt-3 d-flex gap-2">
                        <div>
                            <p>
                                <i class="fas fa-phone mr-3 text-primary" style="font-size: 23px;"></i>
                            </p>
                        </div>
                        <div>
                            <h5 class="text-uppercase text-primary mb-2 font-weight-bold">Call</h5>
                            <p>+91 1234567891</p>
                        </div>
                    </div>
                </div>
                <div class="bg-secondary pb-2">
                    <hr class="">

                    <div class=" container mx-auto my-2 row bg-white align-items-center ">
                        <p class=" fw-bold fs-5 text-center" style="color: grey;">Important Links</p>
                        <div class="fs-5 text-primary">
                            <marquee>
                                <a href="#" style=" text-decoration:none;margin-right: 30px;">User</a>
                                <a href="regi.jsp" style=" text-decoration:none;margin-right: 30px;">New User Registration</a>
                            </marquee>

                        </div>
                    </div>
                </div>
                <div class="row bg-dark ">
                    <p class="text-white text-center mt-1 mb-1" style="font-size: 15px;">Developed by <font class="text-warning">PMD</font></p>
                </div>
        </footer>
    </body>
</html>

<%--<%@include file="homeFooter.jsp" %>--%>
