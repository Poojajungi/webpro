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
                f.setFish_name(fishName.get(i).toString());
                System.out.println(f.getFish_name());
                f.setFish_qty(Float.parseFloat(qty.get(i).toString()));
                f.setFish_amt(Float.parseFloat(amt.get(i).toString()));
                f.setFish_totamt(Float.parseFloat(tamt.get(i).toString()));
                f.setIm_Id(d);
                session.save(f);
                session.clear();
            }
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

    public double TotalStockUpdate(String nm, float qty, float amt) {
        Configuration config = new Configuration().configure().addAnnotatedClass(TotalStock.class);
        SessionFactory sf = config.buildSessionFactory();
        Session session = sf.openSession();
        try {
            session.beginTransaction();
            Query q1 = session.createQuery("from TotalStock where stock_name like '%" + nm + "%'");
            List<TotalStock> l = q1.list();

            TotalStock t = l.get(0);
            t.setStock_name(nm);
            t.setStock_qty(t.getStock_qty() + qty);
            t.setStock_totamt(t.getStock_totamt() + amt);
            session.update(t);
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
}
