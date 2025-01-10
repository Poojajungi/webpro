
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Export</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="CSS/stock.css"/>

    </head>
    <body class="backdesign overflow-hidden vh-100">
        <div class="container-fluid " >
            <form>
                <h2 class="text-center mt-3 ">View Export Stock</h2>
                <ul class="nav nav-tabs  justify-content-center mt-4 " id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active fw-semibold" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true" >Company Export</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link fw-semibold" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Agency Export</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                        <div class="d-flex align-items-center gap-2 mt-4">

                            <div class="fw-bold text-white">Click Here To Export Stock To Company</div>
                            <div>
                                <button type="button" class="btn btn-light fw-bold btn-sm btn-outline-primary" onclick="window.location.href = 'ExportStockCompany.jsp'">
                                    <i class="fas fa-square-plus " ></i>
                                    ExportCompany Stock
                                </button>
                            </div>
                        </div>
                        <div style="overflow-y: auto;max-height: 450px;" class="mt-3">
                            <table class="table table-bordered table-striped table-hover mt-3 table-sm border-dark" id="tbls">
                                <tr class="text-center">
                                    <th>Sr.no</th>
                                    <th>Fish Name</th>
                                    <th>Quantity</th>
                                    <th>Amount</th>
                                    <th>Total Amount</th>
                                    <th class="col-2">Company Name</th>
                                    <th>Date</th>
                                </tr>
                                <%
                                    Configuration configs = new Configuration().configure().addAnnotatedClass(ExportCompany.class).addAnnotatedClass(ExportAgency.class);
                                    SessionFactory sf = configs.buildSessionFactory();
                                    Session sess = sf.openSession();
                                    sess.beginTransaction();
                                    Query q1 = sess.createQuery("from ExportCompany ");
                                    List<ExportCompany> l = q1.list();
                                    for (ExportCompany row : l) {
                                %>
                                <tr class="text-center">
                                    <td><%= row.getExp_Id()%></td> 
                                    <td><%= row.getExp_fishtype()%></td>
                                    <td><%= row.getExp_qty()%></td>
                                    <td><%= row.getExp_amt()%></td>
                                    <td><%= row.getExp_totamt()%></td>
                                    <td><%= row.getExp_name()%></td>
                                    <td><%= row.getExp_date()%></td>
                                </tr>
                                <%
                                    }

                                    q1 = sess.createQuery("select sum(Exp_qty),sum(Exp_amt),sum(Exp_totamt) from ExportCompany");
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
                    </div>

                    <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">

                        <div class="d-flex align-items-center gap-2 mt-4">
                            <div class="fw-bold text-white">Click Here To Export Stock To Agency</div>
                            <div>
                                <button type="button" class="btn btn-light fw-bold btn-sm btn-outline-primary" onclick="window.location.href = 'ExportStockAgency.jsp'">
                                    <i class="fas fa-square-plus " ></i>
                                    ExportAgency Stock
                                </button>
                            </div>
                        </div>
                        <div style="overflow-y: auto;max-height: 450px;" class="mt-3">
                            <table class="table table-bordered mt-3 table-sm border-dark table-striped table-hover" id="tbl2" >
                                <tr class="text-center">
                                    <th>Sr.no</th>
                                    <th>Fish Name</th>
                                    <th>Quantity</th>
                                    <th>Amount</th>
                                    <th>Total Amount</th>
                                    <th class="col-2">Agency Name</th>
                                    <th>Date</th>
                                </tr>
                                <%
                                    sf = configs.buildSessionFactory();
                                    sess = sf.openSession();
                                    sess.beginTransaction();
                                    q1 = sess.createQuery("from ExportAgency ");
                                    List<ExportAgency> l4 = q1.list();
                                    for (ExportAgency row : l4) {
                                %>
                                <tr class="text-center">
                                    <td><%= row.getExpA_Id()%></td> 
                                    <td><%= row.getExpA_fishtype()%></td>
                                    <td><%= row.getExpA_qty()%></td>
                                    <td><%= row.getExpA_amt()%></td>
                                    <td><%= row.getExpA_totamt()%></td>
                                    <td><%= row.getExpA_name()%></td>
                                    <td><%= row.getExpA_date()%></td>
                                </tr>
                                <%
                                    }

                                    q1 = sess.createQuery("select sum(ExpA_qty),sum(ExpA_amt),sum(ExpA_totamt) from ExportAgency");
                                    List<Object[]> l3 = q1.list();
                                    for (Object[] row : l3) {
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
                    </div>
            </form> 
        </div>
    </body>
</html>