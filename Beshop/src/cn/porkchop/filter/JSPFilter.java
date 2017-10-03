package cn.porkchop.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
/**
 * @description  jsp过滤器,只允许list中的jsp可以直接访问,访问其他jsp会重定向到首页
 * @author porkchop
 * @date 2017/9/29 22:44
 */
public class JSPFilter implements Filter {

    private List<String> list = new ArrayList<>();
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        String uri = request.getRequestURI();
        for(String jspName:list){
            if(uri.endsWith(jspName+".jsp")){
                chain.doFilter(req, resp);
                return ;
            }
        }
        response.sendRedirect(request.getContextPath()+"/index.php");
    }

    public void init(FilterConfig config) throws ServletException {
        list.add("cart");
        list.add("error");
        list.add("footer");
        list.add("header");
        list.add("login");
        list.add("paymentSuccess");
        list.add("register");
        list.add("admin/registerFail");
        list.add("admin/category/add");
        list.add("admin/category/edit");
        list.add("admin/category/list");
        list.add("admin/product/add");
        list.add("admin/product/edit");
        list.add("admin/product/list");
        list.add("admin/order/list");
        list.add("admin/bottom");
        list.add("admin/home");
        list.add("admin/index");
        list.add("admin/left");
        list.add("admin/top");
        list.add("admin/welcome");
    }

}
