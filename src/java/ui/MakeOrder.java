package ui;

import java.io.IOException;
import domain.Cart;
import domain.Shop;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import org.apache.log4j.Logger;

@WebServlet( name="MakeOrder", urlPatterns = {"/make_order"})
public class MakeOrder extends LangParseServlet {
    final static Logger logger = Logger.getLogger("newLogger");
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");        
        String userName = request.getUserPrincipal().getName();
        boolean delivery = Boolean.parseBoolean(request.getParameter("delivery"));
        String address = request.getParameter("address");
        Cart cart = (Cart)request.getSession().getAttribute("cart");
        logger.info("making order for user " + userName + "address " + address +"cart " + cart);
        
        Shop.makeOrder(userName, cart, delivery, address);
        request.getSession().setAttribute("cart", null);
       

    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    

   
    
}
