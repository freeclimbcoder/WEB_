package dao;

import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class HibernateUtil {
    private static final SessionFactory sessionFactory;
    final static Logger logger = Logger.getLogger("newLogger");

    static{
        try{
            
            sessionFactory = new Configuration()
                    .configure()
                    .buildSessionFactory();
        }catch(Throwable ex){
            logger.error("Error while creaying SessionFactory", ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
    public static SessionFactory getSessionFactory(){
        return sessionFactory;
    }
}
