package model;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
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

    public int ImportAdd(int id, String nm, String date, List fishName, List qty, List amt, List tamt) {
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

            session.save(ims);
            int d = ims.getIm_ID();
            FishImport f = new FishImport();
            for (int i = 0; i < fishName.size(); i++) {
//                String names = fishName.get(i).toString();
//                float a = Float.parseFloat(qty.get(i).toString());
//                float b = Float.parseFloat(tamt.get(i).toString());
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

    public int ExportCompanyAdd(String nm, String date, String fishName, float qty, float amt, float tamt) {
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

    public int ExportAgencyAdd(String nm, String date, String fishName, float qty, float amt, float tamt) {
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
        Configuration config = new Configuration().configure().addAnnotatedClass(TotalStock.class).addAnnotatedClass(FishImport.class);
        SessionFactory sf = config.buildSessionFactory();
        Session session = sf.openSession();
        try {
            session.beginTransaction();
            int r = session.createQuery("insert into TotalStock(stock_name,stock_qty,stock_totamt)"
                    + "SELECT DISTINCT fish_name,sum(fish_qty),SUM(fish_totamt) FROM FishImport GROUP by fish_name").executeUpdate();
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

    public int ExportMinus(String nm, float qty) {
        Configuration config = new Configuration().configure().addAnnotatedClass(FishImport.class).addAnnotatedClass(TotalStock.class);
        SessionFactory sf = config.buildSessionFactory();
        Session session = sf.openSession();
        TotalStock totstock = new TotalStock();
//        System.out.println(qty);
        try {
            session.beginTransaction();
            Query q1 = session.createQuery("from FishImport where fish_name like '%" + nm + "%'");
            Query q2 = session.createQuery("from TotalStock where stock_name like '%" + nm + "%'");
            List<FishImport> ft = q1.list();
            List<TotalStock> t = q2.list();
            for (int i = 0; i < ft.size(); i++) {
                FishImport fish = (FishImport) session.get(FishImport.class, ft.get(i).getFish_Id());
                if (ft.get(i).getFish_qty() != 0) {
                    if (qty > ft.get(i).getFish_qty()) {
                        float n = qty - ft.get(i).getFish_qty();
                        fish.setFish_qty(0);
                        qty = n;
                    }
                    fish.setFish_qty(ft.get(i).getFish_qty() - qty);
                    session.update(fish);
                    fish.setFish_totamt(ft.get(i).getFish_qty() * ft.get(i).getFish_amt());
                    System.out.println("done");
                    String hql = "UPDATE TotalStock  SET stock_qty = "
                            + "(SELECT SUM(fish_qty) FROM FishImport  WHERE fish_name like '%" + nm + "%'),"
                            + "stock_totamt = (SELECT SUM(fish_totamt) FROM FishImport  WHERE fish_name like '%" + nm + "%')"
                            + "WHERE stock_name = :fishName";

//                    System.out.println(hql);
//                    System.out.println(qty + nm);
                    Query query = session.createQuery(hql);
                    query.setParameter("fishName", nm);
//                    System.out.println(hql);
                    int updatedRows = query.executeUpdate();
//                    System.out.println(updatedRows);
                    break;
                } else {
                    session.delete(fish);
                    continue;
                }
            }
            session.getTransaction().commit();
            return 1;
        } catch (Exception e) {
            System.out.println(e);
            session.getTransaction().rollback();
            return 0;
        } finally {
            session.close();
            sf.close();
        }
    }

    public Object TotalQuantity(String nm, float qty) {
        Configuration config = new Configuration().configure().addAnnotatedClass(FishImport.class);
        SessionFactory sf = config.buildSessionFactory();
        Session session = sf.openSession();
        try {
            session.beginTransaction();
            Query q3 = session.createQuery("SELECT SUM(fish_qty) FROM FishImport  WHERE fish_name like '%" + nm + "%'");
            Object p = q3.uniqueResult();
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
