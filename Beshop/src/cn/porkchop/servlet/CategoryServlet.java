package cn.porkchop.servlet;

import cn.porkchop.service.CategoryService;
import cn.porkchop.service.impl.CategoryServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CategoryServlet extends BaseServlet {
    private CategoryService categoryService = new CategoryServiceImpl();
    /**
     * @description  获取head.jsp中商品类别信息
     * @author porkchop
     * @date 2017/10/1 21:09
     */
    public String showHeaderCategories(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("utf-8");
        String string = categoryService.findAllCategories();
        response.getWriter().write(string);
        return null;
    }
}
