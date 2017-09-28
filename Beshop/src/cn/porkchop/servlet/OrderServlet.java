package cn.porkchop.servlet;

import cn.porkchop.domain.*;
import cn.porkchop.service.OrderService;
import cn.porkchop.service.impl.OrderServiceImpl;
import cn.porkchop.util.UUIDUtils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.ResourceBundle;


public class OrderServlet extends BaseServlet {
    OrderService orderService = new OrderServiceImpl();

    /**
     * @description 提交订单
     * @author porkchop
     * @date 2017/9/27 12:50
     */
    public String submitOrder(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            //购物车为空,返回购物车页面
            return "redirect:/cart";
        }
        Order order = copyCartToOrder(cart, (User) session.getAttribute("user"));
        orderService.insertOrder(order);
        request.setAttribute("order", order);
        return "forward:/order_info";
    }

    /**
     * @description 把购物车中的对象内容封装到订单中
     * @author porkchop
     * @date 2017/9/27 12:50
     */
    private Order copyCartToOrder(Cart cart, User user) {
        Order order = new Order();
        for (Iterator<Map.Entry<String, CartItem>> iterator = cart.getMap().entrySet().iterator(); iterator.hasNext(); ) {
            Map.Entry<String, CartItem> entry = iterator.next();
            CartItem cartItem = entry.getValue();
            OrderItem orderItem = new OrderItem();
            order.getOrderItemList().add(orderItem);
            orderItem.setSubtotal(cartItem.getSubtotal());
            orderItem.setCount(cartItem.getCount());
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setItemId(UUIDUtils.getUUID());
            orderItem.setOrder(order);
        }
        order.setTotal(cart.getTotal());
        order.setOid(UUIDUtils.getUUID());
        order.setOrderTime(new Date());
        order.setUser(user);
        order.setState(0);
        return order;
    }

    /**
     * @description 确认订单, 并且跳转到支付页面
     * @author porkchop
     * @date 2017/9/27 21:40
     */
    public String confirmOrder(HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, IllegalAccessException {
        request.getSession().removeAttribute("cart");
        //1、更新收货人信息
        Map<String, String[]> properties = request.getParameterMap();
        Order order = new Order();
        BeanUtils.populate(order, properties);
        orderService.updateOrder(order);
        //2、在线支付

        //只接入一个接口，这个接口已经集成所有的银行接口了  ，这个接口是第三方支付平台提供的
        // 获得 支付必须基本数据
        String orderid = request.getParameter("oid");
        //String money = order.getTotal()+"";//支付金额
        String money = "0.01";//支付金额
        // 银行
        String pd_FrpId = request.getParameter("pd_FrpId");

        // 发给支付公司需要哪些数据
        String p0_Cmd = "Buy";
        String p1_MerId = ResourceBundle.getBundle("merchantInfo").getString("p1_MerId");
        String p2_Order = orderid;
        String p3_Amt = money;
        String p4_Cur = "CNY";
        String p5_Pid = "";
        String p6_Pcat = "";
        String p7_Pdesc = "";
        // 支付成功回调地址 ---- 第三方支付公司会访问、用户访问
        // 第三方支付可以访问网址
        String p8_Url = ResourceBundle.getBundle("merchantInfo").getString("callback");
        String p9_SAF = "";
        String pa_MP = "";
        String pr_NeedResponse = "1";
        // 加密hmac 需要密钥
        String keyValue = ResourceBundle.getBundle("merchantInfo").getString(
                "keyValue");
        String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
                p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
                pd_FrpId, pr_NeedResponse, keyValue);


        String url = "https://www.yeepay.com/app-merchant-proxy/node?pd_FrpId=" + pd_FrpId +
                "&p0_Cmd=" + p0_Cmd +
                "&p1_MerId=" + p1_MerId +
                "&p2_Order=" + p2_Order +
                "&p3_Amt=" + p3_Amt +
                "&p4_Cur=" + p4_Cur +
                "&p5_Pid=" + p5_Pid +
                "&p6_Pcat=" + p6_Pcat +
                "&p7_Pdesc=" + p7_Pdesc +
                "&p8_Url=" + p8_Url +
                "&p9_SAF=" + p9_SAF +
                "&pa_MP=" + pa_MP +
                "&pr_NeedResponse=" + pr_NeedResponse +
                "&hmac=" + hmac;

        //重定向到第三方支付平台
        response.sendRedirect(url);
        return null;
    }

    public String paymentCallBack(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 获得回调所有数据
        String p1_MerId = request.getParameter("p1_MerId");
        String r0_Cmd = request.getParameter("r0_Cmd");
        String r1_Code = request.getParameter("r1_Code");
        String r2_TrxId = request.getParameter("r2_TrxId");
        String r3_Amt = request.getParameter("r3_Amt");
        String r4_Cur = request.getParameter("r4_Cur");
        String r5_Pid = request.getParameter("r5_Pid");
        //订单编号
        String r6_Order = request.getParameter("r6_Order");
        String r7_Uid = request.getParameter("r7_Uid");
        String r8_MP = request.getParameter("r8_MP");
        String r9_BType = request.getParameter("r9_BType");
        String rb_BankId = request.getParameter("rb_BankId");
        String ro_BankOrderId = request.getParameter("ro_BankOrderId");
        String rp_PayDate = request.getParameter("rp_PayDate");
        String rq_CardNo = request.getParameter("rq_CardNo");
        String ru_Trxtime = request.getParameter("ru_Trxtime");
        // 身份校验 --- 判断是不是支付公司通知你
        String hmac = request.getParameter("hmac");
        String keyValue = ResourceBundle.getBundle("merchantInfo").getString("keyValue");

        // 自己对上面数据进行加密 --- 比较支付公司发过来hamc
        boolean isValid = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, keyValue);


        if (isValid) {
            // 响应数据有效
            if (r9_BType.equals("1")) {

                //修改订单状态
                orderService.updateOrderStateById(r6_Order);
                // 浏览器重定向
                return "redirect:/paymentSuccess";
            } else if (r9_BType.equals("2")) {
                // 服务器点对点 --- 支付公司通知你
                System.out.println("付款成功！");
                // 修改订单状态 为已付款
                // 回复支付公司
                response.getWriter().print("success");
            }
        } else {
            // 数据无效
            System.out.println("数据被篡改！");
        }
        return null;
    }
}
