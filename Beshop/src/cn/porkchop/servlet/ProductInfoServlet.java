package cn.porkchop.servlet;

import cn.porkchop.domain.Product;
import cn.porkchop.service.ProductService;
import cn.porkchop.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProductInfoServlet extends BaseServlet {
    ProductService productService = new ProductServiceImpl();
    /**
     * @description  显示产品信息,通过id
     * @author porkchop
     * @date 2017/9/23 20:35
     */
    public String showProductInfo(HttpServletRequest request, HttpServletResponse response) {
        String pid = request.getParameter("pid");
        Product product = productService.findProductById(pid);
        request.setAttribute("product",product);
        return "forward:/product_info";
    }
}
