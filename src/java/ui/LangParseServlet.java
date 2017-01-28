package ui;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LangParseServlet extends HttpServlet {

    protected void parseLang(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String lang = request.getParameter("lang");
        Cookie[] cookies = request.getCookies();
        if (lang == null) {
            if (cookies == null) {
                setLang(request, response, "ru");
                return;
            }
            int i = 0;
            for (i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("lang")) {
                    request.setAttribute("lang", cookies[i].getValue());
                    break;
                }
            }
            if (i == cookies.length) {
                setLang(request, response, "ru");
                
            }
        } else {
            setLang(request, response, lang);
            
        }
        
        request.getSession().setAttribute("active_page" , request.getRequestURI());

    }
    
    
    private void setLang(HttpServletRequest request, HttpServletResponse response, String lang){
        request.setAttribute("lang", lang);
        Cookie cookie = new Cookie("lang", lang);
        cookie.setMaxAge(Integer.parseInt(getServletContext().getInitParameter("lang_cookie_lifetime")));
        response.addCookie(cookie);
    }

}
