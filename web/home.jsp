
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/home.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Home Page</title>
    </head>
    <body class="vh-100">
        <div class="mainImg">

            <!--NavBar-->
            <nav class="navbar  navbar-expand-lg bg-transparent fs-5 ">
                <div class="container-fluid">
                    <!--Logo-->
                    <a class="navbar-brand fw-semibold" href="#">Fish Transportation</a>
                    <!--Toggle Button-->
                    <button class="navbar-toggler shadow-none boder-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!--SideBar-->
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
                                    Drawings Management
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Add Drawings</a></li>
                                    <li><a class="dropdown-item" href="#">View Drawings</a></li>
                                </ul>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Stock Management
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Import Stock</a></li>
                                    <li><a class="dropdown-item" href="#">Export Stock</a></li>
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
                        </ul>

                        <!--Login / Register-->
                        <div class="d-flex  align-items-center gap-3">
                            <a href="#login" class="text-black">Login</a>
                            <a href="#signUp" class="text-white text-decoration-none px-3 py-1 rounded-4" style="background-color: #f94ca4">Register</a>
                        </div>
                    </div>
                </div>
            </nav>

            <div class="vh-100">

                <section class=" d-flex flex-column align-items-center">
                    <h1>Fish Transportation</h1>
                </section>
            </div>

        </div>


        <footer class="bg-white pt-1 overflow-hidden">
            <div class=" bg-white  text-md-left">
                <div class="row">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3777452.5461484166!2d68.68616997764056!3d22.394429584322157!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3959051f5f0ef795%3A0x861bd887ed54522e!2sGujarat!5e0!3m2!1sen!2sin!4v1733812745252!5m2!1sen!2sin" 
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
                                <a href="#" style=" text-decoration:none;margin-right: 30px;">Drawings Management</a>
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
