package domain;

import javax.validation.constraints.NotNull;
import dao.Dao;
import dao.DaoHibernate;
import java.util.ArrayList;
import org.apache.log4j.Logger;

public class Shop {

    final static Logger logger = Logger.getLogger("newLogger");

    public static Goods getGoodsById(int id, String lang) {
        logger.info("getting goods by id = " + id + "and lang = "+lang );
        return Dao.getGoodsById(id, lang);
    }

    public static ArrayList<Goods> getGoodsFromCategories(String lang, String... categories) {
        ArrayList<Goods> fullList = new ArrayList<Goods>();
        for (int i = 0; i < categories.length; i++) {
            fullList.addAll(Dao.getGoodsByCategory(categories[i], lang));
        }

        return fullList;
    }

    public static ArrayList<Goods> getAllGoodsList(String lang) {
        logger.info("detting all goods with lang = " +lang  );

        return Dao.getGoodsList(lang);
    }

    public static void makeOrder(@NotNull String name, @NotNull Cart cart,
            boolean delivery, @NotNull String address) {
        logger.info("saving order for user " + name +" cart:"+ cart +"delivery " +delivery  );
        DaoHibernate.saveOrder(new Order(cart, name, delivery, address));

    }

    public static java.util.ArrayList<Order> getUserOrdersList(@NotNull String userName) {
        
        logger.info("getting order list for user  " + userName);
        return DaoHibernate.getOrderListByUser(userName);

    }

    public static ArrayList<Comment> getComments() {
        logger.info("getting comments list");
        return DaoHibernate.getComments();
    }

    public static void saveComment(Comment comment) {
       logger.info("saving comment"+ comment);
        DaoHibernate.saveComment(comment);
    }

}
