package cn.porkchop.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class EncodeFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        // 解决post方式
        // req.setCharacterEncoding("UTF-8");
        req = new UTF8Request(req);
        chain.doFilter(req, response);
    }

    public void destroy() {
    }

}
