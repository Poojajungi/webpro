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

    static int idd = 0;

    public int ImportAdd(String nm, String date,List fishName, List qty, List amt, List tamt) {
        Configuration config = new Configuration().configure().addAnnotatedClass(ImportStock.class).addAnnotatedClass(FishImport.class);
        SessionFactory sf = config.buildSessionFactory();
        Session session = sf.openSession();
            session.beginTransaction();
//        try {
//
//            ImportStock ims = new ImportStock();
//            ims.setIm_name(nm);
//            ims.setIm_date(date);
//            System.out.println(nm);
//            FishImport f = new FishImport();



//            for (int i = 0; i < fishName.size(); i++) {
//                    f.setFish_name(fishName.get(i).toString());
//                    System.out.println(f.getFish_name());
//                    f.setFish_qty(Float.parseFloat(qty.get(i).toString()));
//                    f.setFish_amt(Float.parseFloat(amt.get(i).toString()));
//                    f.setFish_totamt(Float.parseFloat(tamt.get(i).toString()));
//            ims.getFishimport().add(f);
//            f.setImportstock(ims);
//            session.save(ims);
//            session.save(f);
//            session.getTransaction().commit();
//            
//            session.beginTransaction();
//            }


//        ims.getFishimport().add(f);
//            session.save(ims);
//            ImportFishAdd(fishName, qty, amt, tamt);
//            session.getTransaction().commit();
//            session.close();
//            sf.close();
            return 1;
//        } catch (Exception e) {
//            System.out.println(e);
//            session.getTransaction().rollback();
//            return 0;
//        }
    }

    public List ids() {
            return null;
    }

    
    public int ImportFishAdd(List fishName, List qty, List amt, List tamt ) {
        Configuration config = new Configuration().configure().addAnnotatedClass(ImportStock.class).addAnnotatedClass(FishImport.class);
        SessionFactory sf = config.buildSessionFactory();
        Session session = sf.openSession();
        try {
            session.beginTransaction();

            ImportStock ims = new ImportStock();
            
            FishImport f = new FishImport();
            for (int i = 0; i < fishName.size(); i++) {
                    f.setFish_name(fishName.get(i).toString());
                    System.out.println(f.getFish_name());
                    f.setFish_qty(Float.parseFloat(qty.get(i).toString()));
                    f.setFish_amt(Float.parseFloat(amt.get(i).toString()));
                    f.setFish_totamt(Float.parseFloat(tamt.get(i).toString()));
//            ims.getFishimport().add(f);
            f.setImportstock(ims);
//            session.save(ims);
            session.save(f);
            session.getTransaction().commit();
            session.beginTransaction();
            session.clear();
            }

            session.close();
            sf.close();
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

}
