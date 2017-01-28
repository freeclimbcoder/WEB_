package dao;

import domain.Comment;
import domain.Order;
import java.util.ArrayList;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class DaoHibernate {

    private DaoHibernate() {
    }
    final static Logger logger = Logger.getLogger("newLogger");

    public static void saveOrder(Order order) {
        //save this order there

        Session session = null;
        Transaction transaction = null;

        try {
            logger.info("openning session");
            session = HibernateUtil.getSessionFactory().openSession();
            logger.info("beginning transaction");
            session.beginTransaction();
            logger.info("saving order");
            session.save(order);
            session.getTransaction().commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            logger.error("error ", e);

            throw e;
        } finally {
            logger.info("closing session");
            session.close();
        }
    }

    public static ArrayList<Order> getOrderListByUser(String userName) {

        Session session = null;
        Transaction transaction = null;
        ArrayList<Order> orders = null;
        logger.info("gerring order list for user =" +userName);
        try {
            logger.debug("openning session");
            session = HibernateUtil.getSessionFactory().openSession();
            logger.debug("beginning transaction");
            session.beginTransaction();

            orders = (ArrayList<Order>) session.createCriteria(Order.class)
                    .add(Restrictions.eq("userName", userName))
                    .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
                    .list();
            session.getTransaction().commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            logger.error("Error while getting order list by user ", e);
            throw e;
        } finally {
            session.close();
        }
        return orders;
    }

    public static void saveComment(Comment comment) {
        Session session = null;
        Transaction transaction = null;
        logger.info("saving comment" + comment);
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.save(comment);
            session.getTransaction().commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
          logger.error("error ", e);
            throw e;
        } finally {
            session.close();
        }
    }

    public static ArrayList<Comment> getComments() {

        Session session = null;
        Transaction transaction = null;
        ArrayList<Comment> comments = null;
        logger.info("getting comments");
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();

            comments = (ArrayList<Comment>) session.createCriteria(Comment.class)
                    .list();
            session.getTransaction().commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            logger.error("error " + e);
            throw e;
        } finally {
            session.close();
        }
        return comments;
    }
}
