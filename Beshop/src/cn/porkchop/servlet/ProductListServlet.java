package cn.porkchop.servlet;

import cn.porkchop.domain.Category;
import cn.porkchop.domain.PageBean;
import cn.porkchop.domain.Product;
import cn.porkchop.service.ProductService;
import cn.porkchop.service.impl.ProductServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class ProductListServlet extends BaseServlet {
    ProductService productService = new ProductServiceImpl();

    /**
     * @description 商品分页通过类别
     * @author porkchop
     * @date 2017/9/24 15:10
     */
    public String showProductsByCategory(HttpServletRequest request, HttpServletResponse response) {
        String currentPage = request.getParameter("currentPage");

        String cid = request.getParameter("cid");

        PageBean<Product> pageBean = new PageBean<>();
        pageBean.setCurrentPage(currentPage == null ? 1 : Integer.valueOf(currentPage));
        Category category = productService.findProductByCategory(pageBean, cid);
        List<Integer> list = getPaginationList(pageBean);
        request.setAttribute("paginationList", list);
        request.setAttribute("pageBean", pageBean);
        request.setAttribute("category", category);
        return "forward:/product_list";
    }

    /**
     * @description 一次显示5条的页数, 小于1大于总页数, 则删除
     * @author porkchop
     * @date 2017/9/24 17:01
     */
    private List<Integer> getPaginationList(PageBean<Product> pageBean) {
        List<Integer> list = new ArrayList<Integer>();
        for (int i = pageBean.getCurrentPage() - 2; i <= pageBean.getCurrentPage() + 2; i++) {
            if (i < 1 || i > pageBean.getTotalPage()) {
                continue;
            }
            list.add(i);
        }
        return list;
    }
}
