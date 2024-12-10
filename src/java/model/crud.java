package model;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class crud {

    Configuration config = new Configuration().configure().addAnnotatedClass(bean.class);
    SessionFactory sf = config.buildSessionFactory();
    Session session = sf.openSession();
    bean b = new bean();

    public int insertData(int rno, String nm) {
        try {
            session.beginTransaction();
            b.setRno(rno);
            b.setName(nm);
            session.save(b);
            session.getTransaction().commit();
            session.close();
            System.out.println("done");
            return 1;
        } catch (Exception e) {
            System.out.println(e);
            session.getTransaction().rollback();
            return 0;
        }
    }
    
    public int UpdateData(int rno, String nm) {
        try {
            session.beginTransaction();
            b.setRno(rno);
            b.setName(nm);
            session.update(b);
            session.getTransaction().commit();
            session.close();
            return 1;
        } catch (Exception e) {
            System.out.println(e);
            session.getTransaction().rollback();
            return 0;
        }
    }

        

}
