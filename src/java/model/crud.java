package model;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class crud {

    public int ImportAdd(String nm, String date, String fishName, float qty, float amt, float tamt) {
        Configuration config = new Configuration().configure().addAnnotatedClass(ImportStock.class);
        SessionFactory sf = config.buildSessionFactory();
        Session session = sf.openSession();
        try {
            session.beginTransaction();
            ImportStock ims = new ImportStock();
            ims.setIm_name(nm);
            ims.setIm_date(date);
            ims.setIm_fishname(fishName);
            ims.setIm_qty(qty);
            ims.setIm_amt(amt);
            ims.setIm_totamt(tamt);
            session.getTransaction().commit();
            session.save(ims);
            session.close();
            return 1;
        } catch (Exception e) {
            System.out.println(e);
            session.getTransaction().rollback();
            return 0;
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
            session.getTransaction().commit();
            session.save(exp);
            session.close();
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
            session.getTransaction().commit();
            session.save(expAgency);
            session.close();
            return 1;
        } catch (Exception e) {
            System.out.println("error");
            System.out.println(e);
            session.getTransaction().rollback();
            return 0;
        }
    }

}
