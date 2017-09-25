package cn.porkchop.servlet;

import cn.porkchop.domain.User;
import cn.porkchop.exception.EmailInactivatedException;
import cn.porkchop.exception.WrongCaptchaException;
import cn.porkchop.exception.WrongUorPException;
import cn.porkchop.service.LoginService;
import cn.porkchop.service.impl.LoginServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class LoginNLogoutServlet extends BaseServlet {
    LoginService loginService = new LoginServiceImpl();

    /**
     * @description 登陆
     * @author porkchop
     * @date 2017/9/21 19:14
     */
    public String login(HttpServletRequest request, HttpServletResponse response) throws InvocationTargetException, IllegalAccessException {
        String autoLogin = request.getParameter("autoLogin");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //封装到user中
        User user = new User();
        Map<String, String[]> map = request.getParameterMap();
        BeanUtils.populate(user, map);

        try {
            HttpSession session = request.getSession();
            if (!session.getAttribute("captchaString").equals(request.getParameter("captcha"))) {
                throw new WrongCaptchaException("验证码输入错误");
            }
            User u = loginService.login(user);
            session.setAttribute("user", u);
            if ("true".equals(autoLogin)) {
                //如果七天自动登陆
                session.setMaxInactiveInterval(7 * 24 * 60 * 60);
                Cookie cookie = new Cookie("JSESSIONID", session.getId());
                cookie.setMaxAge(7 * 24 * 60 * 60);
                response.addCookie(cookie);
            }
            return "redirect:/index";
        } catch (WrongCaptchaException e) {
            request.setAttribute("username", user.getUsername());
            request.setAttribute("wrongCaptchaException", e.getMessage());
            return "forward:/login";
        } catch (EmailInactivatedException e) {
            //邮箱未激活
            request.setAttribute("username", user.getUsername());
            request.setAttribute("emailInactivatedException", e.getMessage());
            return "forward:/login";
        } catch (WrongUorPException e) {
            //错误的用户名或密码
            request.setAttribute("wrongUorPException", e.getMessage());
            request.setAttribute("username", user.getUsername());
            return "forward:/login";
        }
    }

    /**
     * @description 登出账户
     * @author porkchop
     * @date 2017/9/22 21:32
     */
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();
        return "redirect:/index";
    }

    // 集合中保存所有成语
    private List<String> words = new ArrayList<String>();

    /**
     * @description 初始化文件中的验证码到list中
     * @author porkchop
     * @date 2017/9/22 11:47
     */
    @Override
    public void init() throws ServletException {
        // 初始化阶段，读取new_words.txt
        // web工程中读取 文件，必须使用绝对磁盘路径
        String path = getServletContext().getRealPath("/WEB-INF/new_words.txt");
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(path), "UTF-8"));
            String line;
            while ((line = reader.readLine()) != null) {
                words.add(line);
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * @description 生成验证码图片, 并且放到session域中
     * @author porkchop
     * @date 2017/9/22 21:31
     */
    public String getCaptchaImg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String captchaString = getCaptchaString(request, response);
        request.getSession().setAttribute("captchaString", captchaString);
        return null;
    }

    /**
     * @return 返回验证码的文字
     * @description 获得验证码
     * @author porkchop
     * @date 2017/9/22 11:46
     */
    public String getCaptchaString(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 禁止缓存
        // response.setHeader("Cache-Control", "no-cache");
        // response.setHeader("Pragma", "no-cache");
        // response.setDateHeader("Expires", -1);
        int width = 120;
        int height = 30;
        // 步骤一 绘制一张内存中图片
        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        // 步骤二 图片绘制背景颜色 ---通过绘图对象
        Graphics graphics = bufferedImage.getGraphics();// 得到画图对象 --- 画笔
        // 绘制任何图形之前 都必须指定一个颜色
        graphics.setColor(getRandColor(200, 250));
        graphics.fillRect(0, 0, width, height);
        // 步骤三 绘制边框
        graphics.setColor(Color.WHITE);
        graphics.drawRect(0, 0, width - 1, height - 1);
        // 步骤四 四个随机数字
        Graphics2D graphics2d = (Graphics2D) graphics;
        // 设置输出字体
        graphics2d.setFont(new Font("宋体", Font.BOLD, 30));
        Random random = new Random();// 生成随机数
        int index = random.nextInt(words.size());
        String word = words.get(index);// 获得成语
        // 定义x坐标
        int x = 10;
        for (int i = 0; i < word.length(); i++) {
            // 随机颜色
            graphics2d.setColor(new Color(20 + random.nextInt(110), 20 + random
                    .nextInt(110), 20 + random.nextInt(110)));
            // 旋转 -30 --- 30度
            int jiaodu = random.nextInt(60) - 30;
            // 换算弧度
            double theta = jiaodu * Math.PI / 180;
            // 获得字母数字
            char c = word.charAt(i);
            // 将c 输出到图片
            graphics2d.rotate(theta, x, 20);
            graphics2d.drawString(String.valueOf(c), x, 20);
            graphics2d.rotate(-theta, x, 20);
            x += 30;
        }
        // 步骤五 绘制干扰线
        graphics.setColor(getRandColor(160, 200));
        int x1;
        int x2;
        int y1;
        int y2;
        for (int i = 0; i < 30; i++) {
            x1 = random.nextInt(width);
            x2 = random.nextInt(12);
            y1 = random.nextInt(height);
            y2 = random.nextInt(12);
            graphics.drawLine(x1, y1, x1 + x2, x2 + y2);
        }
        // 将上面图片输出到浏览器 ImageIO
        graphics.dispose();// 释放资源
        ImageIO.write(bufferedImage, "jpg", response.getOutputStream());
        return word;
    }

    /**
     * 取其某一范围的color
     *
     * @param fc int 范围参数1
     * @param bc int 范围参数2
     * @return Color
     */
    private Color getRandColor(int fc, int bc) {
        // 取其随机颜色
        Random random = new Random();
        if (fc > 255) {
            fc = 255;
        }
        if (bc > 255) {
            bc = 255;
        }
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }
}
