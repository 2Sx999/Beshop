package cn.porkchop.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * @author porkchop
 * @description 让所有servlet集成此类
 * @date 2017/9/20 21:17
 */
public class BaseServlet extends HttpServlet {
    /**
     * @description 重写service方法, 通过method的参数, 反射调用对应的方法, 再根据返回值判断转发还是重定向, 像springmvc一样
     * @author porkchop
     * @date 2017/9/20 21:18
     */
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获得方法名
        String methodName = req.getParameter("method");
        if ("".equals(methodName) || methodName == null) {
            //没有输入method,则返回到首页
            resp.sendRedirect(req.getContextPath() + "/index.php");
            return;
        }
        //获得当前对象的class类
        Class<? extends BaseServlet> clazz = this.getClass();
        try {
            //获得指定方法的对象
            Method method = clazz.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            String string = (String) method.invoke(this, req, resp);//返回值示例  "forward:/index"
            if (string == null) {
                //没有返回视图,直接return;
                return;
            }
            String[] s = string.split(":");
            if ("forward".equals(s[0])) {
                //转发,注意!前面不需要加项目名的路径
                req.getRequestDispatcher(s[1] + ".jsp").forward(req, resp);
            } else if ("redirect".equals(s[0])) {
                //重定向
                resp.sendRedirect(req.getContextPath() + s[1] + ".php");
            }
        } catch (NoSuchMethodException e) {
            //没有这个方法,返回首页
            resp.sendRedirect(req.getContextPath() + "/index.php");
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }


    }
}
