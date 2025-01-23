
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="model.*"%>
<%! int p = 0;%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ViewImport</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="CSS/stock.css"/>
        <script type="text/javascript">
            function mytable() {
                var tb = document.getElementById("tbls");
                tb.style.display = "none";
                var t = document.getElementById("tbl2");
                t.style.display = "t";
            }

            
        </script>

    </head>
    <body class="backdesign  vh-100">
        <div>
            <%@include file="homeNav.jsp" %>
        </div>
        <div class="container-fluid " >
            <form>
                <h2 class="text-center mt-3 ">View Import Stock</h2>
                <div class="d-flex align-items-center gap-2">
                    <div class="fw-bold text-white">Click Here To Import Stock</div>
                    <div>
                        <button type="button" class="btn btn-light fw-bold btn-sm btn-outline-primary" onclick="window.location.href = 'ImportStockform.jsp'">
                            <i class="fas fa-square-plus " ></i>
                            Import Stock
                        </button>
                    </div>
                </div>

                <div style="overflow-y: auto;max-height: 400px;" class="mt-3">
                    <table class="table table-bordered  mt-3 table-sm table-striped border-dark table-hover" id="tbls" >
                        <tr class="text-center">
                            <th>Sr.no</th>
                            <th>Fish Name</th>
                            <th>Quantity</th>
                            <th>Amount</th>
                            <th>Total Amount</th>
                            <th class="col-2">Boat/Owner</th>
                            <th>Date</th>
                        </tr>
                        <%
                            Configuration configs = new Configuration().configure().addAnnotatedClass(ImportStock.class).addAnnotatedClass(FishImport.class);
                            SessionFactory sf = configs.buildSessionFactory();
                            Session sess = sf.openSession();
                            sess.beginTransaction();
                            Query q1 = sess.createQuery("from FishImport f,ImportStock i where i.Im_ID = f.Im_Id ");
                            List<Object[]> l = q1.list();
                            
                            for (Object[] row : l) {
                                FishImport f = (FishImport) row[0];
                                ImportStock i = (ImportStock) row[1];
                        %>
                        <tr class="text-center">
                            <td><%= (++p) %></td> 
                            <td><%= f.getFish_name()%></td>
                            <td><%= f.getFish_qty()%></td>
                            <td><%= f.getFish_amt()%></td>
                            <td><%= f.getFish_totamt()%></td>
                            <td><%= i.getIm_name()%></td>
                            <td><%= i.getIm_date()%></td>
                        </tr>
                        <%
                            }

                            q1 = sess.createQuery("select sum(fish_qty),sum(fish_amt),sum(fish_totamt) from FishImport");
                            List<Object[]> l2 = q1.list();
                            for (Object[] row : l2) {
                        %>
                        <tr class="fw-bold">
                            <td colspan="2" align="right" class="text-primary">Total</td>
                            <td class="text-center"><%= row[0]%></td>
                            <td class="text-center"><%= row[1]%></td>
                            <td class="text-center"><%= row[2]%></td>
                            <td colspan="2"></td>
                        </tr>
                        <%
                            }
                            sess.getTransaction().commit();
                            sess.close();
                            sf.close();
                        %>

                    </table>
                </div>
            </form> 
        </div>
                        <%@include file="homeFooter.jsp" %>
    </body>
</html>