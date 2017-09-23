package cn.porkchop.servlet;


import cn.porkchop.domain.User;
import cn.porkchop.exception.WrongCaptchaException;
import cn.porkchop.service.RegisterService;
import cn.porkchop.service.impl.RegisterServiceImpl;
import cn.porkchop.util.UUIDUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;
import org.apache.commons.dbutils.DbUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * @author porkchop
 * @description 注册页面使用
 * @date 2017/9/20 21:45
 */
public class RegisterServlet extends BaseServlet {
    RegisterService registerService = new RegisterServiceImpl();

    /**
     * @description
     * @author porkchop
     * @date 2017/9/20 22:56
     */
    public String register(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, IllegalAccessException {
        Map<String, String[]> map = request.getParameterMap();
        User user = new User();
        //注册日期转换器
        ConvertUtils.register(new Converter() {
            @Override
            public Object convert(Class aClass, Object o) {
                Date date = null;
                try {
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                    date = format.parse(o.toString());
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                return date;
            }
        }, Date.class);
        //封装到user中
        BeanUtils.populate(user, map);
        user.setUid(UUIDUtils.getUUID());
        user.setCode(UUIDUtils.getUUID());
        user.setState(0);

        try {
            if (!request.getSession().getAttribute("captchaString").equals(request.getParameter("captcha"))) {
                throw new WrongCaptchaException("验证码输入错误");
            }
        } catch (WrongCaptchaException e) {
            request.setAttribute("user", user);
            request.setAttribute("wrongCaptchaException", e.getMessage());
            return "forward:/register";
        }
        boolean b = registerService.register(user,request);
        return b ? "redirect:/registerSuccess" : "redirect:/registerFail";
    }

    public String activate(HttpServletRequest request, HttpServletResponse response){
        String activatecode = request.getParameter("activatecode");
        boolean b = registerService.activate(activatecode);
        return "redirect:/activateSuccess";
    }

    /**
     * @description 验证用户名是否存在
     * @author porkchop
     * @date 2017/9/20 23:00
     */
    public String checkUserName(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        boolean b = registerService.checkUserName(username);
        response.getWriter().write("{\"isExist\":" + b + "}");
        return null;
    }
}
