package cn.porkchop.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * @description 让所有servlet集成此类
 * @author porkchop
 * @date 2017/9/20 21:17
 */
public class BaseServlet extends HttpServlet{
    /**
     * @description 重写service方法,通过method的参数,反射调用对应的方法,再根据返回值判断转发还是重定向,像springmvc一样
     * @author porkchop
     * @date 2017/9/20 21:18
     */
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获得方法名
        String methodName = req.getParameter("method");
        if ("".equals(methodName )|| methodName==null){
            //没有输入method,则返回到首页
            resp.sendRedirect(req.getContextPath()+"/index.jsp");
            return;
        }
        //获得当前对象的class类
        Class<? extends BaseServlet> clazz = this.getClass();
        try {
            //获得指定方法的对象
            Method method = clazz.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            String string = (String) method.invoke(this, req, resp);
            String[] s = string.split(":");
            if("forward".equals(s[0])){
                //转发
                req.getRequestDispatcher(req.getContextPath()+s[1]+".jsp").forward(req, resp);
            }else if("redirect".equals(s[0])){
                //重定向
                resp.sendRedirect(req.getContextPath()+s[1]+".jsp");
            }
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }


    }
}
