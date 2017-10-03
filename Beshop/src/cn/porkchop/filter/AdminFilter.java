package cn.porkchop.filter;

import javax.servlet.*;
import java.io.IOException;

public class AdminFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
/*        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        User user = (User)request.getSession().getAttribute("user");
        if(user!=null&&"admin".equals(user.getUsername())){
            chain.doFilter(req, resp);
            return;
        }
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write("没有权限!");*/


        chain.doFilter(req, resp);

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
