

<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="model.registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="CSS/design.css" rel="stylesheet"/>
        <link href="CSS/stock.css" rel="stylesheet"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <script src="http://translate.google.com/translate_a/element.js?cb=loadGoogleTranslate"></script>
        <title>JSP Page</title>
        <script type="text/javascript">

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
    <body class="backdesign">
        <div>
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
        <h2 class="text-center " style="margin-top: 110px;">View User</h2>
        <div class="container-fluid " >
            <form method="post">
            <table class="table table-bordered  mt-3 table-sm table-striped border-dark table-hover"  align="center" style="margin-bottom: 150px;">
                <tr  class="text-center table-dark text-white">
                    <th>RefId</th>
                    <th>FullName</th>
                    <th>UserName</th>
                    <th>City</th>
                    <th>MobileNo</th>
                    <th>Email</th>
                    <th>PassWord</th>   
                    <th></th>   

                </tr>
                <%
                    registration r = new registration();
                    Configuration con = new Configuration().configure().addAnnotatedClass(registration.class);
                    SessionFactory sf = con.buildSessionFactory();
                    Session s = sf.openSession();
    //                    Transaction t=s.beginTransaction();

                    Query o = s.createQuery("from registration");
                    List<registration> l = o.list();
                    for (registration elem : l) {
                        int id = elem.getRefid();
                        String fnm = elem.getFullnm();
                        String unm = elem.getUsername();
                        String city = elem.getCity();
                        String mno = elem.getMobileno();
                        String em = elem.getEmail();
                        String pw = elem.getPassword();
                %>
                <tr class="text-center">
                    <td><%=id%></td>
                    <td><%=fnm%></td>
                    <td><%=unm%></td>
                    <td><%=city%></td>
                    <td><%=mno%></td>
                    <td class="notranslate"><%=em%></td>
                    <td class="notranslate"><%=pw%></td>
                    <td><a href="Loginform.jsp?users=<%= unm %>&passw=<%= pw %>">View as User</a></td>
                </tr>
                <%}%>
            </table>
        </form>
        </div>
            <footer class="bg-transparent overflow-hidden mt-2">
            <div class=" bg-white  text-md-left">

                <div class="container-fluid justify-content-around border shadow mt-2 mx-auto row text-md-left">
                    <div class="col-md-3   mx-auto mt-3 d-flex gap-2">
                        <div>
                            <p>
                                <i class="fas fa-location mr-3 text-primary" style="font-size: 23px;"></i>
                            </p>
                        </div>
                        <div>
                            <h5 class="text-uppercase mb-2 font-weight-bold text-primary">Porbandar</h5>
                            <hr class="mt-0" style="border:1px solid blue;opacity: 0.5;" />
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
                            <hr class="mt-0" style="border:1px solid blue;opacity: 0.5;" />
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
                            <hr class="mt-0" style="border:1px solid blue;opacity: 0.5;" />
                            <p>+91 1234567891</p>
                        </div>
                    </div>
                </div>
                <div class="bg-secondary pb-2 pt-2">
                    <!--<hr class="mt-0 mb-0">-->

                    <div class=" container mx-auto my-2 row bg-white align-items-center ">
                        <p class=" fw-bold text-center" style="color: grey;font-size: 25px;">Important Links</p>
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
