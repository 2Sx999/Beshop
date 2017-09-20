package cn.porkchop.servlet;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @description  注册页面使用
 * @author porkchop
 * @date 2017/9/20 21:45
 */
public class RegisterServlet extends BaseServlet {
    public String register(HttpServletRequest request,HttpServletResponse response){

        return "redirect:/index";
    }
}
