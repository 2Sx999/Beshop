package cn.porkchop.servlet;

import cn.porkchop.domain.*;
import cn.porkchop.exception.NoSuchProductException;
import cn.porkchop.service.CategoryService;
import cn.porkchop.service.OrderService;
import cn.porkchop.service.ProductService;
import cn.porkchop.service.impl.CategoryServiceImpl;
import cn.porkchop.service.impl.OrderServiceImpl;
import cn.porkchop.service.impl.ProductServiceImpl;
import cn.porkchop.util.UUIDUtils;
import com.google.gson.Gson;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

public class AdminServlet extends BaseServlet {
    private CategoryService categoryService = new CategoryServiceImpl();
    private ProductService productService = new ProductServiceImpl();
    private OrderService orderService=new OrderServiceImpl();

    /**
     * 用json传过去所有的类别
     * @author porkchop
     * @date 2017/10/2 21:39
     */
    public String findAllCategories(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String string = categoryService.findAllCategories();
        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write(string);
        return null;
    }

    /**
     * 根据id修改
     * @author porkchop
     * @date 2017/10/2 21:39
     */
    public String editCategoryById(HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, IllegalAccessException {
        Category category = new Category();
        BeanUtils.populate(category, request.getParameterMap());
        categoryService.updateCategoryById(category);
        return "redirect:/admin/category/list";
    }

    /**
     * 跳转到修改页面, 并且把cid传过去
     *
     * @author porkchop
     * @date 2017/10/2 21:39
     */
    public String goCategoryEditPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setAttribute("cid", request.getParameter("cid"));
        return "forward:/admin/category/edit";
    }

    /**
     * 根据id删除
     *
     * @author porkchop
     * @date 2017/10/2 21:38
     */
    public String delCategoryById(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String cid = request.getParameter("cid");
        categoryService.delCategoryById(cid);
        return "forward:/admin/category/list";
    }

    /**
     * 添加类别
     *
     * @author porkchop
     * @date 2017/10/2 23:22
     */
    public String addCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String cname = request.getParameter("cname");
        Category category = new Category();
        category.setCid(UUIDUtils.getUUID());
        category.setCname(cname);
        categoryService.addCategory(category);
        return "forward:/admin/category/list";
    }

    /**
     * 分页获得
     *
     * @author porkchop
     * @date 2017/10/3 11:37
     */
    public String getProductsByPagination(HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, IllegalAccessException {
        String currentPage = request.getParameter("currentPage");
        PageBean<Product> pageBean = new PageBean<>();
        pageBean.setCurrentPage(currentPage == null ? 1 : Integer.valueOf(currentPage));
        productService.findProductsByPagination(pageBean);
        request.setAttribute("pageBean", pageBean);
        return "forward:/admin/product/list";
    }

    /**
     * 分页获得
     *
     * @author porkchop
     * @date 2017/10/3 11:37
     */
    public String goProductEditPage(HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, IllegalAccessException, NoSuchProductException {
        Product product = productService.findProductById(request.getParameter("pid"));
        request.setAttribute("product", product);
        return "forward:/admin/product/edit";
    }

    /**
     * 根据id删除商品
     *
     * @date 2017/10/3 18:35
     * @author porkchop
     */
    public String delProductById(HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, IllegalAccessException, NoSuchProductException {
        productService.delProductById(request.getParameter("pid"));
        response.sendRedirect(request.getContextPath() + "/admin.php?method=getProductsByPagination");
        return null;
    }
    /**
     * 分页查询订单
     * @date 2017/10/3 19:17
     * @author porkchop
     */
    public String getOrdersByPagination(HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, IllegalAccessException, NoSuchProductException {
        String currentPage = request.getParameter("currentPage");
        PageBean<Order> pageBean = new PageBean<>();
        pageBean.setCurrentPage(currentPage == null ? 1 : Integer.valueOf(currentPage));
        orderService.findOrderByPagination(pageBean);
        request.setAttribute("pageBean", pageBean);
        return "forward:/admin/order/list";
    }
    /**
     * ajax访问,根据id获取商品
     * @date 2017/10/3 19:18
     * @author porkchop
     */
    public String findOrderItemByOid(HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, IllegalAccessException, NoSuchProductException {
        List<OrderItem> list = orderService.findOrderItemsByOid(request.getParameter("oid"));
        Gson gson = new Gson();
        String json = gson.toJson(list);
        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write(json);
        return null;
    }
}
