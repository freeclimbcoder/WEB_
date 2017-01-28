package ui;

import java.io.IOException;
import domain.Cart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

@WebServlet(name = "AddItemToCart", urlPatterns = {"/addItem"})
public class AddItemToCart extends HttpServlet {

    final static Logger logger = Logger.getLogger("newLogger");

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("add") != null) {
            logger.info("start parsing 'add' parameter");
            int id = 0;
            try {
                id = Integer.parseInt(request.getParameter("add"));
                Cart cart = (Cart) request.getSession().getAttribute("cart");
                if (cart == null) {
                    logger.info("creating new cart");
                    cart = new Cart();
                    request.getSession().setAttribute("cart", cart);
                }
                logger.info("adding item " + id + " to cart " + cart);
                cart.addItem(id);
                response.setStatus(response.SC_OK);
            } catch (NumberFormatException e) {
                logger.error("error while parse 'add' parameter", e);
                response.sendError(422);
            }

        } else if (request.getParameter("remove") != null) {

            try {
                int id = Integer.parseInt(request.getParameter("remove"));
                Cart cart = (Cart) request.getSession().getAttribute("cart");
                if (cart != null) {
                    logger.info("removing item " + id + " from cart " + cart);

                    cart.remoreItem(id);
                    response.setStatus(response.SC_OK);
                }

            } catch (NumberFormatException e) {
                logger.error("error while parse 'remove' parameter", e);
                response.sendError(422);
            }
        } else {
            logger.error("bad request");
            response.sendError(400);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
