
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/home.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="http://translate.google.com/translate_a/element.js?cb=loadGoogleTranslate"></script>
        <style>
    /* Ensure the nested dropdowns align correctly */
    .dropdown-menu .dropdown-menu {
      /* margin-left: 100%; */
      top: 0;
      left: 100%;
      margin-top: -5px;
    }

    /* Hide submenu by default */
    .submenu .dropdown-menu {
      display: none;
    }

    /* Optional: Add transition for smooth effect */
    .submenu .dropdown-menu {
      transition: opacity 0.2s;
    }
  </style>
        <script>

            function loadGoogleTranslate()

            {

            new google.translate.TranslateElement("myid")

            }
        </script>

        <title>Home Page</title>
    </head>
    <body class="vh-100">
                <!--<div id="myid">Choose Language</div>-->
        <div class="mainImg">
        <nav class="navbar navbar-expand-lg bg-transparent fs-5">
    <div class="container-fluid">
        <a class="navbar-brand fw-semibold" href="#">Fish Transportation</a>
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
                        <li><a class="dropdown-item" href="#">Import Stock</a></li>
                        <!-- Submenu opens on hover with JavaScript -->
                        <li class="nav-item ms-2 dropend submenu" id="submenu"> 
                            <a class="nav-link dropdown-toggle" href="#" role="button" aria-expanded="false">
                                Export Stock 
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Export to Company</a></li>
                                <li><a class="dropdown-item" href="#">Export to Agency/Person</a></li>
                            </ul>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Monthly Stock Report</a></li>
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
                        <li><div id="myid"></div></li>
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

  <script>
    // JavaScript to show and hide the submenu on hover
    const submenu = document.getElementById('submenu');
    const submenuDropdown = submenu.querySelector('.dropdown-menu');
    
    // Show submenu on mouse enter
    submenu.addEventListener('mouseenter', () => {
      submenuDropdown.style.display = 'block';
    });
    
    // Hide submenu on mouse leave
    submenu.addEventListener('mouseleave', () => {
      submenuDropdown.style.display = 'none';
    });
  </script>


            <div class="vh-100">
                <section class=" d-flex flex-column align-items-center">
                    <h1 class="textdesign slide-up" data-text="Fish Transportation...">Fish Transportation...</h1>
                </section>
            </div>
    </div>

        <div class="container">
            <div class="text-center justify-content-center">
                <h5 class="text-uppercase mt-3 fw-bold fs-xxl" style="font-family: serif;">A Wave of Relief: Stress-Free Fish Transport</h5>
                <hr>
                <p style="font-family: serif;">
                    Fish can be transported in a variety of containers, including plastic bags, styrofoam boxes, wooden buckets, and metal cans. Some containers, like wood or styrofoam, provide good insulation from heat. 
                    Containers made of metal or plastic may need to be wrapped in wet towels or packed with ice to keep the temperature down. 
                </p>
                <img src="CSS/Images/f3.jpg" class="shadow" style="border-radius: 5px;"></img>
                <p class="mb-5 mt-3" style="font-family: serif;">
                    There are two basic transport systems for live fish - the closed system and the open system. The closed system is a sealed container in which all the requirements for survival are self-contained. The simplest of these is a sealed plastic bag partly filled with water and oxygen. The open system consists of water-filled containers in which the requirements for survival are supplied continuously from outside sources. The simplest of these is a small tank with an aerator stone.

                    These systems will be reviewed with respect to the problems of fish preparation for transport, types of vehicles and equipments, problems of water quality and its changes during transport, and chemical aids used during fish transport.

                    There is ample literature on fish transport and associated problems; however, the literary sources overlap and give partly differing interpretations of the recommended ways of transport. These are the reasons why this survey aims at comprising mainly those published results which have been fully verified in practice and which are, therefore, reliably instructive.

                    The basic factors and principles associated with any live fish transport systems, or influencing them, are evaluated before the actual ways of fish transport are commented on.
                </p>
            </div>
        </div>

        <!--footer-->
        <footer class="bg-white pt-1 overflow-hidden">
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

                    <div class=" container mx-auto row bg-white align-items-center ">
                        <p class=" fw-bold fs-5 text-center" style="color: grey;">Important Links</p>
                        <div class="fs-5 text-primary">
                            <marquee>
                                <a href="#" style=" text-decoration:none;margin-right: 30px;">Boat/Owner</a>
                                <a href="#" style=" text-decoration:none;margin-right: 30px;">Withdrawal Management</a>
                                <a href="#" style=" text-decoration:none;margin-right: 30px;">Stock Management</a>
                                <a href="#" style=" text-decoration:none;margin-right: 30px;">Company Management</a>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" />