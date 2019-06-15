package Controller.Filter;

import Model.Main.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(filterName = "CheckLoginFilter", urlPatterns = "/*")
public class CheckLoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        String path = ((HttpServletRequest) req).getRequestURI();
        if (path.startsWith("/login") || path.startsWith("/assets") || path.startsWith("/views")) {
        } else {
            User user = (User) ((HttpServletRequest) req).getSession().getAttribute("user");
            if (user == null){
                req.getRequestDispatcher("/login").forward(req, resp);

            }
                //((HttpServletResponse) resp).sendRedirect("/login");

        }

        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}