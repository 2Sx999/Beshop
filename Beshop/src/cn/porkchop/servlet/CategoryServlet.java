package cn.porkchop.servlet;

import cn.porkchop.service.CategoryService;
import cn.porkchop.service.impl.CategoryServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CategoryServlet extends BaseServlet {
    CategoryService categoryService = new CategoryServiceImpl();

    public String showHeaderCategories(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("utf-8");
        String string = categoryService.findAllCategories();
        response.getWriter().write(string);
        return null;
    }
}
