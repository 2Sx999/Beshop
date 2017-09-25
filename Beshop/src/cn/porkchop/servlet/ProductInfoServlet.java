package cn.porkchop.servlet;

import cn.porkchop.domain.Product;
import cn.porkchop.service.ProductService;
import cn.porkchop.service.impl.ProductServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.LinkedList;
import java.util.List;

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
        addThisToHistoryList(request,product);
        request.setAttribute("product",product);
        return "forward:/product_info";
    }
    /**
     * @description  把历史记录的list存放在session中,并且当作队列来操作
     * @author porkchop
     * @date 2017/9/24 21:45
     */
    private void addThisToHistoryList(HttpServletRequest request,Product product){
        HttpSession session = request.getSession();

        Object historyList = session.getAttribute("historyList");
        if(historyList==null){
            //没有历史浏览记录
            List<Product> list = new LinkedList<>();
            list.add(product);
            session.setAttribute("historyList",list);
            return;
        }

        //有历史记录了
        List<Product> list = (List<Product>) historyList;
        if(!list.remove(product)&&list.size()==6){
            //当前商品不在历史记录中,并且list的长度为6
            list.remove(5);
        }
        list.add(0,product);

    }
}