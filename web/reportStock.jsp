
<%@page import="java.util.List"%>
<%@page import="org.hibernate.*"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="java.util.Date"%>
<%@page import="model.*" %>
<%! int n = 0;%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>StockReport</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gybbyQm0hZ2eQlDg1RbWrlrwAjKppkrgreKRp1IF3eZ7ErgaGx" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-IePrCxj3ITo/OqxwBbHXmfceQ4Zh0fwSV4S8HTuKDbWQ/pb9DeZ3R4XYgyyI8A8E" crossorigin="anonymous"></script>

    </head>
    <body>
        <div>
            <%@include file="homeNav.jsp" %>
        </div>

        <div id="container" class="container border border-dark shadow mt-3 mb-3" style="width: 60%;">
            <div style="background-color: rgb(213,140,177);" class="row text-white">
                <div class="row" >
                    <div class="col-12 mt-4">
                        <h1 class="fw-bold text-center">Stock Report</h1>
                    </div>
                </div>
                <div class="row ">
                    <div class="col-md-12 col-lg-12 col-sm-12 text-end">
                        <h5 class="fw-semibold">
                            <jsp:useBean id="now" class="java.util.Date" />
                            <fmt:formatDate value="${now}" pattern="MMMM" />
                            <% Date cur = new Date();%>
                            <%= cur.getDate()%>, <%= cur.getYear() + 1900%>
                        </h5>
                    </div>
                </div>
            </div>

            <div class="row text-center mt-2">
                <table class="table table-sm table-borderless table-responsive">
                    <tr class="fs-5">
                        <th style="color:rgb(209,140,177);">FishNames</th>
                        <th style="color:rgb(209,140,177);">TotalQuantity</th>
                        <th style="color:rgb(209,140,177);">TotalAmount</th>
                    </tr>
                    <%
                        try {
                            Configuration conn = new Configuration().configure().addAnnotatedClass(TotalStock.class);
                            SessionFactory sf = conn.buildSessionFactory();
                            Session sess = sf.openSession();
                            sess.beginTransaction();
                            Query q1 = sess.createQuery("from TotalStock");
                            List<TotalStock> l1 = q1.list();
                            for (TotalStock t : l1) {
                                n++;
                    %>
                    <tr class="fw-semibold">
                        <td><%= t.getStock_name()%></td>
                        <td><%= t.getStock_qty()%></td>
                        <td><%= t.getStock_totamt()%></td>
                    </tr>

                    <%
                        }
                        q1 = sess.createQuery("select sum(stock_qty),sum(stock_totamt) from TotalStock");
                        List<Object[]> l2 = q1.list();
                        for (Object[] row : l2) {
                    %>
                    <tr>
                        <td align="center"><hr style="border:1px solid black;width:60%;"/></td>
                        <td align="center"><hr style="border:1px solid black;width:50%;"/></td>
                        <td align="center"><hr style="border:1px solid black;width:50%;"/></td>
                    </tr>
                    <tr class="fw-bold fs-5">
                        <td style="color:rgb(209,140,177);">Total Items: <%= n%></td>
                        <td style="color:rgb(209,140,177);" class="text-center"><%= row[0]%></td>
                        <td style="color:rgb(209,140,177);" class="text-center"><%= row[1]%></td>
                    </tr>
                    <%
                            }
                            sess.getTransaction().commit();
                            sess.close();
                            sf.close();
                        } catch (Exception e) {
                            out.print(e);
                        }
                    %>
                </table>
            </div>
        </div>
        <div class="mt-2 mb-1 text-center">
            <button id="downloadBtn" class="btn btn-light btn-outline-dark m-3 fw-semibold shadow">
                Download &nbsp;<img src="CSS/Images/downl.png" height="20px"/>
            </button>
        </div>
       


        <script>
            document.getElementById('downloadBtn').addEventListener('click', function () {
            const { jsPDF } = window.jspdf;
            // Select the container div
            const element = document.getElementById('container');
            // Use html2canvas to render the div as a canvas
            html2canvas(element, { scale: 2 }).then((canvas) => {
            const imgData = canvas.toDataURL('image/png'); // Convert canvas to image
            const pdf = new jsPDF('p', 'mm', 'a4'); // Create a new PDF

            // Calculate PDF dimensions
            const pdfWidth = pdf.internal.pageSize.getWidth();
            const pdfHeight = (canvas.height * pdfWidth) / canvas.width;
            // Add the image to the PDF
            pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
            // Save the PDF
            pdf.save('StockReport.pdf');
            });
            });
        </script>
        <%@include file="homeTemp.jsp" %>
    </body>
</html>
