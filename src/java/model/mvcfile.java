
package model;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class mvcfile {

    public int getid() {
        Configuration config = new Configuration().configure().addAnnotatedClass(registration.class);
        SessionFactory sf = config.buildSessionFactory();
        Session session = sf.openSession();
        Query q1 = session.createQuery("SELECT e.refid FROM registration e ORDER BY e.refid DESC");
        q1.setMaxResults(1);
        return (Integer) q1.uniqueResult();
    }

    public int insertdata(int refid, String fnm, String unm, String city, String mobileno, String email, String pw) {
        try {
            registration obj = new registration();
            obj.setRefid(refid);
            obj.setFullnm(fnm);
            obj.setUsername(unm);
            obj.setCity(city);
            obj.setMobileno(mobileno);
            obj.setEmail(email);
            obj.setPassword(pw);

            Configuration con = new Configuration().configure().addAnnotatedClass(registration.class);
            SessionFactory sf = con.buildSessionFactory();
            Session s = sf.openSession();
            Transaction tx = s.beginTransaction();
            s.save(obj);
            tx.commit();
            System.out.println("successfully");
//            System.out.println(refid + fnm + unm + city + mobileno + email + pw);
        } catch (Exception e) {
            System.out.println("not registration" + e);
//            System.out.println(refid + fnm + unm + city + mobileno + email + pw);

        }
        return 0;
    }

    public int update(String passwd, String mobilenumber) {
        try {
            Configuration con = new Configuration().configure().addAnnotatedClass(registration.class);
            SessionFactory sf = con.buildSessionFactory();
            Session s = sf.openSession();
            Transaction tx = s.beginTransaction();
            String uquery = "UPDATE registration e SET e.password=:newValue WHERE e.mobileno=:number";
            s.createQuery(uquery)
                    .setParameter("newValue", passwd)
                    .setParameter("number", mobilenumber)
                    .executeUpdate();
            tx.commit();
            tx.rollback();
            s.close();
            System.out.println("successfully update");

        } catch (Exception e) {
            System.out.println("not registration" + e);
        }
        return 0;
    }

}
