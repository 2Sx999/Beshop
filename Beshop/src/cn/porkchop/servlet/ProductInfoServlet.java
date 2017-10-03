package cn.porkchop.servlet;

import cn.porkchop.domain.Cart;
import cn.porkchop.domain.CartItem;
import cn.porkchop.domain.Product;
import cn.porkchop.exception.NoSuchProductException;
import cn.porkchop.service.CategoryService;
import cn.porkchop.service.ProductService;
import cn.porkchop.service.impl.CategoryServiceImpl;
import cn.porkchop.service.impl.ProductServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.LinkedList;
import java.util.List;

public class ProductInfoServlet extends BaseServlet {
    private ProductService productService = new ProductServiceImpl();
    private CategoryService categoryService = new CategoryServiceImpl();

    /**
     * @description 显示产品信息, 通过id
     * @author porkchop
     * @date 2017/9/23 20:35
     */
    public String showProductInfo(HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, IllegalAccessException {
        try {
            String pid = request.getParameter("pid");
            Product product = productService.findProductById(pid);
            addThisToHistoryList(request, product);
            request.setAttribute("product", product);
            return "forward:/product_info";
        } catch (NoSuchProductException e) {
            response.sendRedirect(request.getContextPath() + "/index.php");
            return null;
        }
    }

    /**
     * @description 把历史记录的list存放在session中, 并且当作队列来操作
     * @author porkchop
     * @date 2017/9/24 21:45
     */
    private void addThisToHistoryList(HttpServletRequest request, Product product) {
        HttpSession session = request.getSession();

        Object historyList = session.getAttribute("historyList");
        if (historyList == null) {
            //没有历史浏览记录
            List<Product> list = new LinkedList<>();
            list.add(product);
            session.setAttribute("historyList", list);
            return;
        }

        //有历史记录了
        List<Product> list = (List<Product>) historyList;
        if (!list.remove(product) && list.size() == 6) {
            //当前商品不在历史记录中,并且list的长度为6
            list.remove(5);
        }
        list.add(0, product);

    }

    /**
     * @description 添加购物车
     * @author porkchop
     * @date 2017/9/26 9:57
     */
    public String addToCart(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, IllegalAccessException {
        try {
            String quantity = request.getParameter("quantity");
            String pid = request.getParameter("pid");
            Product product = productService.findProductById(pid);
            addThisToCart(request, Integer.parseInt(quantity), product);
            return "redirect:/cart";
        } catch (NoSuchProductException e) {
            return "redirect:/error";
        }
    }

    /**
     * @description 把商品放到session中的购物车中
     * @author porkchop
     * @date 2017/9/26 9:57
     */
    private void addThisToCart(HttpServletRequest request, int quantity, Product product) {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        CartItem cartItem = null;
        if (cart == null) {
            //session中没有购物车
            cart = new Cart();
            session.setAttribute("cart", cart);
            cartItem = new CartItem();
            cartItem.setProduct(product);
            cart.getMap().put(product.getPid(), cartItem);
        } else {
            //有购物车
            cartItem = cart.getMap().get(product.getPid());
            if (cartItem == null) {
                //没有这个商品
                cartItem = new CartItem();
                cartItem.setProduct(product);
                cart.getMap().put(product.getPid(), cartItem);
            }
        }
        cartItem.setCount(cartItem.getCount() + quantity);
        cartItem.setSubtotal(cartItem.getSubtotal() + quantity * product.getShop_price());
        cart.setTotal(cart.getTotal() + quantity * product.getShop_price());
    }
    /**
     * @description  删除购物车的单项商品
     * @author porkchop
     * @date 2017/9/26 13:03
     */
    public String deleteFromCart(HttpServletRequest request, HttpServletResponse response){
        try {
            String pid = request.getParameter("pid");
            Cart cart = (Cart)request.getSession().getAttribute("cart");
            //总价为原总价减去当前商品项的小记
            cart.setTotal(cart.getTotal()-cart.getMap().get(pid).getSubtotal());
            cart.getMap().remove(pid);
            return "redirect:/cart";
        } catch (Exception e) {
            return "redirect:/error";
        }
    }
    public String deleteAllFromCart(HttpServletRequest request, HttpServletResponse response){
        Cart cart = (Cart)request.getSession().getAttribute("cart");
        cart.getMap().clear();
        return "redirect:/cart";

    }
}