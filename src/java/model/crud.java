package model;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class crud {

    public int getIds() {
        Configuration config = new Configuration().configure().addAnnotatedClass(ImportStock.class);
        SessionFactory sf = config.buildSessionFactory();
        Session session = sf.openSession();
        Query q1 = session.createQuery("SELECT e.Im_ID FROM ImportStock e ORDER BY e.Im_ID DESC");
        q1.setMaxResults(1);
        return (Integer) q1.uniqueResult();
    }

    public int getIdsOwn() {
        Configuration config = new Configuration().configure().addAnnotatedClass(ownerData.class);
        SessionFactory sf = config.buildSessionFactory();
        Session session = sf.openSession();
        Query q1 = session.createQuery("SELECT e.id FROM ownerData e ORDER BY e.id DESC");
        q1.setMaxResults(1);
        return (Integer) q1.uniqueResult();
    }

    public int getIdsdraw() {
        Configuration config = new Configuration().configure().addAnnotatedClass(drowingData.class);
        SessionFactory sf = config.buildSessionFactory();
        Session session = sf.openSession();
        Query q1 = session.createQuery("SELECT e.id FROM drowingData e ORDER BY e.id DESC");
        q1.setMaxResults(1);
        return (Integer) q1.uniqueResult();
    }

    public int getIdsComp() {
        Configuration config = new Configuration().configure().addAnnotatedClass(companyData.class);
        SessionFactory sf = config.buildSessionFactory();
        Session session = sf.openSession();
        Query q1 = session.createQuery("SELECT e.id FROM companyData e ORDER BY e.id DESC");
        q1.setMaxResults(1);
        return (Integer) q1.uniqueResult();
    }

    public int ImportAdd(int id, String nm, String date, List fishName, List qty, List amt, List tamt, int Userid) {
        Configuration config = new Configuration().configure().addAnnotatedClass(ImportStock.class).addAnnotatedClass(FishImport.class);
        SessionFactory sf = config.buildSessionFactory();
        Session session = sf.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();

            ImportStock ims = new ImportStock();
            ims.setIm_ID(id);
            ims.setIm_name(nm);
            ims.setIm_date(date);
            ims.setUserID(Userid);
            session.save(ims);
            int d = ims.getIm_ID();
            FishImport f = new FishImport();
            for (int i = 0; i < fishName.size(); i++) {
                f.setFish_name(fishName.get(i).toString());
                System.out.println(f.getFish_name());
                f.setFish_qty(Float.parseFloat(qty.get(i).toString()));
                f.setFish_amt(Float.parseFloat(amt.get(i).toString()));
                f.setFish_totamt(Float.parseFloat(tamt.get(i).toString()));
//                TotalStockUpdate(names, a, b);
                f.setIm_Id(d);
                session.save(f);
                session.clear();
            }
            TotalStockUpdate();
            tx.commit();
            return 1;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            System.out.println(e);
            return 0;
        } finally {
            session.close();
        }
    }

    public int ExportCompanyAdd(String nm, String date, String fishName, float qty, float amt, float tamt, int userID) {
        Configuration config = new Configuration().configure().addAnnotatedClass(ExportCompany.class);
        SessionFactory sf = config.buildSessionFactory();
        Session session = sf.openSession();
        try {
            session.beginTransaction();
            ExportCompany exp = new ExportCompany();
            exp.setExp_name(nm);
            exp.setExp_date(date);
            exp.setExp_fishtype(fishName);
            exp.setExp_qty(qty);
            exp.setExp_amt(amt);
            exp.setExp_totamt(tamt);
            exp.setUserID(userID);
            session.save(exp);
            session.getTransaction().commit();
            session.close();
            sf.close();
            return 1;
        } catch (Exception e) {
            System.out.println("error");
            System.out.println(e);
            session.getTransaction().rollback();
            return 0;
        }
    }

    public int ExportAgencyAdd(String nm, String date, String fishName, float qty, float amt, float tamt, int userID) {
        Configuration config = new Configuration().configure().addAnnotatedClass(ExportAgency.class);
        SessionFactory sf = config.buildSessionFactory();
        Session session = sf.openSession();
        try {
            session.beginTransaction();
            ExportAgency expAgency = new ExportAgency();
            expAgency.setExpA_name(nm);
            expAgency.setExpA_date(date);
            expAgency.setExpA_fishtype(fishName);
            expAgency.setExpA_qty(qty);
            expAgency.setExpA_amt(amt);
            expAgency.setExpA_totamt(tamt);
            expAgency.setUserID(userID);
            session.save(expAgency);
            session.getTransaction().commit();
            session.close();
            sf.close();
            return 1;
        } catch (Exception e) {
            System.out.println("error");
            System.out.println(e);
            session.getTransaction().rollback();
            return 0;
        }
    }

    public int TotalstocksMethod() {
        Configuration config = new Configuration().configure().addAnnotatedClass(TotalStock.class).addAnnotatedClass(FishImport.class).addAnnotatedClass(ImportStock.class);
        SessionFactory sf = config.buildSessionFactory();
        Session session = sf.openSession();
        try {
            //SELECT f.fish_name, COALESCE(SUM(f.fish_qty), 0), COALESCE(SUM(f.fish_totamt), 0),i.UserID FROM FishImport f,importstock i WHERE i.Im_ID=f.Im_ID GROUP by f.fish_name,i.UserID;
            //SELECT DISTINCT f.fish_name,sum(f.fish_qty),SUM(f.fish_totamt),i.UserID FROM FishImport f,ImportStock i where f.Im_Id = i.Im_ID GROUP by fish_name
            session.beginTransaction();
            int r = session.createQuery("insert into TotalStock(stock_name,stock_qty,stock_totamt,UserID)"
                    + "SELECT f.fish_name, COALESCE(SUM(f.fish_qty), 0), COALESCE(SUM(f.fish_totamt), 0),i.UserID FROM FishImport f,ImportStock i WHERE i.Im_ID=f.Im_Id GROUP by f.fish_name,i.UserID").executeUpdate();
            session.getTransaction().commit();
            session.close();
            sf.close();
            return 1;
        } catch (Exception e) {
            System.out.println(e);
            session.getTransaction().rollback();
            return 0;
        }
    }

    public int TotalStockUpdate() {
        Configuration config = new Configuration().configure().addAnnotatedClass(TotalStock.class);
        SessionFactory sf = config.buildSessionFactory();
        Session session = sf.openSession();
        try {
            session.beginTransaction();
//            Query q2 = session.createQuery("select stock_name from TotalStock where stock_name like '%" + nm + "%'");
//            if (q2.uniqueResult() == null) {
//                TotalStock t = new TotalStock();
//                t.setStock_name(nm);
//                t.setStock_qty(qty);
//                t.setStock_totamt(amt);
//                session.save(t);
//            } else {

//                Query q1 = session.createQuery("from TotalStock where stock_name like '%" + nm + "%'");
//                List<TotalStock> l = q1.list();
//                TotalStock t = l.get(0);
//                t.setStock_name(nm);
//                t.setStock_qty(t.getStock_qty() + qty);
//                t.setStock_totamt(t.getStock_totamt() + amt);
            int r = session.createQuery("delete from TotalStock").executeUpdate();
            TotalstocksMethod();
//                session.update(t);
//            }
            session.getTransaction().commit();
            session.close();
            sf.close();
            return 1;
        } catch (Exception e) {
            System.out.println(e);
            session.getTransaction().rollback();
            return 0;
        }
    }

//    public int ExportMinus(String nm, float qty, int us) {
//        Configuration config = new Configuration().configure().addAnnotatedClass(FishImport.class).addAnnotatedClass(ImportStock.class).addAnnotatedClass(TotalStock.class);
//        SessionFactory sf = config.buildSessionFactory();
//        Session session = sf.openSession();
//        TotalStock totstock = new TotalStock();
////        System.out.println(qty);
//        try {
//            session.beginTransaction();
////            Query q1 = session.createQuery("from FishImport f,ImportStock i where fish_name like '%" + nm + "% and f.Im_Id=i.Im_ID' and UserID="+us);
//            Query q1 = session.createQuery("from FishImport f,ImportStock i where f.fish_name like '%" + nm + "%' and f.Im_Id=i.Im_ID and i.UserID="+us);
//            Query q2 = session.createQuery("from TotalStock where stock_name like '%" + nm + "%'");
//            List<FishImport> ft = q1.list();
//            List<TotalStock> t = q2.list();
//            for (int i = 0; i < ft.size(); i++) {
//                FishImport fish = (FishImport) session.get(FishImport.class, ft.get(i).getFish_Id());
//                if (ft.get(i).getFish_qty() != 0) {
//                    if (qty > ft.get(i).getFish_qty()) {
//                        float n = qty - ft.get(i).getFish_qty();
//                        System.out.println(n);
//                        fish.setFish_qty(0);
//                        qty = n;
//                    }
//                    fish.setFish_qty(ft.get(i).getFish_qty() - qty);
//                    session.update(fish);
//                    fish.setFish_totamt(ft.get(i).getFish_qty() * ft.get(i).getFish_amt());
//                    System.out.println("done");
//
////                    String hql = "UPDATE TotalStock "
////                            + "SET stock_qty = (SELECT SUM(fish_qty) FROM FishImport  WHERE fish_name LIKE :fishName), "
////                            + "stock_totamt = (SELECT SUM(fish_totamt) FROM FishImport  WHERE fish_name LIKE :fishName) "
////                            + "UserID = :usidd "
////                            + "WHERE stock_name = :fishName";
////
////                    Query query = session.createQuery(hql);
////                    query.setParameter("fishName", "%" + nm + "%");
////                    query.setParameter("usidd", us);
//////                    System.out.println(hql);
////                    int updatedRows = query.executeUpdate();
//////                    System.out.println(updatedRows);
//// Step 1: Select aggregate values from FishImport
//                    String selectHql = "SELECT COALESCE(SUM(f.fish_qty), 0), COALESCE(SUM(f.fish_totamt), 0) "
//                            + "FROM FishImport f WHERE f.fish_name LIKE :fishName";
//
//                    Query selectQuery = session.createQuery(selectHql);
//                    selectQuery.setParameter("fishName", "%" + nm + "%");
//                    Object[] result = (Object[]) selectQuery.uniqueResult();
//
//                    Double stockQty = (Double) result[0];
//                    Double stockTotAmt = (Double) result[1];
//
//// Step 2: Perform the update without subqueries
//                    String updateHql = "UPDATE TotalStock "
//                            + "SET stock_qty = :stockQty, "
//                            + "stock_totamt = :stockTotAmt, "
//                            + "UserID = :usidd "
//                            + "WHERE stock_name LIKE :fishName";
//
//                    Query updateQuery = session.createQuery(updateHql);
//                    updateQuery.setParameter("stockQty", stockQty);
//                    updateQuery.setParameter("stockTotAmt", stockTotAmt);
//                    updateQuery.setParameter("usidd", us);
//                    updateQuery.setParameter("fishName", "%" + nm + "%");
//
//                    int updatedRows = updateQuery.executeUpdate();
//                    System.out.println("Updated Rows: " + updatedRows);
//
//                    break;
//                } else {
//                    session.delete(fish);
//                    continue;
//                }
//            }
//            session.getTransaction().commit();
//            return 1;
//        } catch (Exception e) {
//            System.out.println(e);
//            session.getTransaction().rollback();
//            return 0;
//        } finally {
//            session.close();
//            sf.close();
//        }
//    }
    
  public int ExportMinus(String nm, float qty, int us) {
    Configuration config = new Configuration()
            .configure()
            .addAnnotatedClass(FishImport.class)
            .addAnnotatedClass(ImportStock.class)
            .addAnnotatedClass(TotalStock.class);

    SessionFactory sf = config.buildSessionFactory();
    Session session = sf.openSession();

    try {
        session.beginTransaction();

        // HQL without entity relationships (manual joins)
        String hqlFishImport = "from FishImport f, ImportStock i " +
                                "where f.Im_Id = i.Im_ID " +
                                "and f.fish_name like :fishName " +
                                "and i.UserID = :userId";

        Query q1 = session.createQuery(hqlFishImport);
        q1.setString("fishName", "%" + nm + "%");
        q1.setInteger("userId", us);

        String hqlTotalStock = "from TotalStock where stock_name like :fishName";
        Query q2 = session.createQuery(hqlTotalStock);
        q2.setString("fishName", "%" + nm + "%");

        List<Object[]> results = q1.list();

        for (Object[] row : results) {
            FishImport fish = (FishImport) row[0]; // Extract FishImport
            if (fish.getFish_qty() != 0) {
                if (qty > fish.getFish_qty()) {
                    qty -= fish.getFish_qty();
                    fish.setFish_qty(0);
                } else {
                    fish.setFish_qty(fish.getFish_qty() - qty);
                    qty = 0;
                }
                fish.setFish_totamt(fish.getFish_qty() * fish.getFish_amt());
                session.update(fish);

                String selectHql = "SELECT COALESCE(SUM(f.fish_qty), 0), COALESCE(SUM(f.fish_totamt), 0) " +
                                   "FROM FishImport f,ImportStock i WHERE f.fish_name LIKE :fishName and f.Im_Id=i.Im_ID and i.UserID="+us;
                Query selectQuery = session.createQuery(selectHql);
                selectQuery.setString("fishName", "%" + nm + "%");
                Object[] result = (Object[]) selectQuery.uniqueResult();

                if (result != null) {
                    Float stockQty = ((Double) result[0]).floatValue();
                    Float stockTotAmt = ((Double) result[1]).floatValue();

                    String updateHql = "UPDATE TotalStock " +
                                       "SET stock_qty = :stockQty, " +
                                       "stock_totamt = :stockTotAmt, " +
                                       "UserID = :usidd " +
                                       "WHERE stock_name LIKE :fishName";

                    Query updateQuery = session.createQuery(updateHql);
                    updateQuery.setFloat("stockQty", stockQty);
                    updateQuery.setFloat("stockTotAmt", stockTotAmt);
                    updateQuery.setInteger("usidd", us);
                    updateQuery.setString("fishName", "%" + nm + "%");

                    int updatedRows = updateQuery.executeUpdate();
                    System.out.println("Updated Rows: " + updatedRows);
                }
                break;
            } else {
                session.delete(fish);
            }
        }
        session.getTransaction().commit();
        return 1;

    } catch (Exception e) {
        e.printStackTrace();
        session.getTransaction().rollback();
        return 0;
    } finally {
        session.close();
        sf.close();
    }
}




    public float TotalQuantity(String nm,int uid) {
        Configuration config = new Configuration().configure().addAnnotatedClass(FishImport.class).addAnnotatedClass(ImportStock.class);
        SessionFactory sf = config.buildSessionFactory();
        Session session = sf.openSession();
        float p = 0;
        try {
            session.beginTransaction();
            Query q3 = session.createQuery("SELECT SUM(f.fish_qty) FROM FishImport f,ImportStock i WHERE f.fish_name like '%" + nm + "%' and i.Im_ID=f.Im_Id and i.UserID="+uid);
////            Object p = q3.uniqueResult();
//            List<FishImport> l1 = q3.list();
//            float p = (float) session.get(FishImport.class,l1.get(0).getFish_qty());
            Object result = q3.uniqueResult();

            if (result != null) {
                p = ((Number) result).floatValue(); // Convert result to float
            }
            session.getTransaction().commit();
            return p;
        } catch (Exception e) {
            System.out.println(e);
            session.getTransaction().rollback();
            return 0;
        } finally {
            session.close();
            sf.close();
        }
    }
}
