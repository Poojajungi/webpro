
import model.bean;
import java.util.Scanner;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class mainController {
            public static void main(String[] args) {
                 try {
                        bean b = new bean();
                        Scanner sc = new Scanner(System.in);
                        System.out.println("Enter RollNo : ");
                        int rn = sc.nextInt();
                        System.out.println("Enter Name : ");
                        String nm = sc.next();
                        
                        b.setRno(rn);
                        b.setName(nm);
                        
                        Configuration config = new Configuration().configure().addAnnotatedClass(bean.class);
                        SessionFactory sf = config.buildSessionFactory();
                        Session session = sf.openSession();
                        session.beginTransaction();
                        session.save(b);
                        session.getTransaction().commit();
                       
                    } catch (Exception e) {
                        System.out.println(e);
                    }
    }
}
