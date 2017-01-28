package ui;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoodsList extends LangParseServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        parseLang(request, response);

        String category = request.getParameter("type");
        Cookie[] cookies = request.getCookies();
        if (category == null) {
            if (cookies == null) {
                setCategory(request, response, "all");
            } else {
                int i = 0;
                for (i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals("category")) {
                        request.setAttribute("category",cookies[i].getValue());
                        break;
                    }
                }
                if (i == cookies.length) {
                    setCategory(request, response, "all");
                }
            }
        } else {
            setCategory(request, response, category);
        }

        request.getRequestDispatcher("/goods_list.jsp").forward(request, response);
    }

    private void setCategory(HttpServletRequest request, HttpServletResponse response, String category) {
        request.setAttribute("category", category);
        Cookie cookie = new Cookie("category", category);
        cookie.setMaxAge(Integer.parseInt(getServletContext()
                .getInitParameter("category_cookie_lifetime")));
        response.addCookie(cookie);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
