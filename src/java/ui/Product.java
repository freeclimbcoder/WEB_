package ui;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Product extends LangParseServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        parseLang(request, response);
        
        Integer id = null;
        try{
             id = Integer.parseInt(request.getParameter("id"));
             request.setAttribute("id", id);
             request.getRequestDispatcher("/product.jsp").forward(request, response);
             
        }catch(Exception e){
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
        
        
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    

}
