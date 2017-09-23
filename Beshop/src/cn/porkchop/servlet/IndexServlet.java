package cn.porkchop.servlet;

import cn.porkchop.domain.Product;
import cn.porkchop.service.ProductService;
import cn.porkchop.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class IndexServlet extends HttpServlet {
    ProductService productService = new ProductServiceImpl();
    /**
     * @description  跳转到主页面,把热门商品和最新商品显示
     * @author porkchop
     * @date 2017/9/23 18:31
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> newList = productService.findNewProductsForIndex();
        List<Product> hotList = productService.findHotProductsForIndex();
        request.setAttribute("newList",newList);
        request.setAttribute("hotList",hotList);

        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
