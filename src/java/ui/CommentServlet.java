package ui;

import domain.Comment;
import domain.Shop;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

@WebServlet(name = "CommentServlet", urlPatterns = {"/CommentServlet"})
public class CommentServlet extends LangParseServlet {

    final static Logger logger = Logger.getLogger("newLogger");
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        parseLang(request, response);
        String userName = request.getUserPrincipal().getName();
        String commentMsg = request.getParameter("comment");
        logger.info("user " + userName + "adds comment: "+ commentMsg);
        Comment comment = new Comment(userName, commentMsg);
        
        logger.info("saving comment" + comment);
        Shop.saveComment(comment);
        
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        
        String commentObject = "{\"name\" : \"" + userName + "\",\"comment\": \"" + commentMsg + "\", \"date\":\"" + comment.getFormatedDate((String)request.getAttribute("lang")) + "\" }";
       
        logger.info("sending response to user" + commentObject);
        out.print(commentObject);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
