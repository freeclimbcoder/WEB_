package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;

public class LogFilter implements Filter {

    private FilterConfig filterConfig = null;
    final static Logger logger = Logger.getLogger("newLogger");

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String queryString = httpRequest.getQueryString();
        String uri = httpRequest.getRequestURI();
        String ip = httpRequest.getRemoteAddr();
        String activePage = (String)httpRequest.getSession().getAttribute("active_page");
        
        logger.info("User ip= " + ip + " asked for resource " + uri +'?'+ queryString + " from page " +activePage );
        chain.doFilter(request, response);

    }

    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;

    }

}
