package ui;

import domain.Comment;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import domain.Order;
import domain.Shop;
import java.util.ArrayList;

public class ProfileServlet extends LangParseServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        parseLang(request, response);
        
        String userName = request.getUserPrincipal().getName();
        ArrayList<Order> orders = Shop.getUserOrdersList(userName);
        String lang = (String)request.getAttribute("lang");        
        
        for(Order order: orders){
            order.getCart().setLang(lang);
        }
        
        request.setAttribute("orders", orders);
        
         ArrayList<Comment> comments = Shop.getComments();
         request.setAttribute("comments", comments);
   

        request.getRequestDispatcher("/profile.jsp").forward(request, response);

    }
        
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
   