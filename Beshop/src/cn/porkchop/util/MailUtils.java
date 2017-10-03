package cn.porkchop.util;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Properties;

public class MailUtils {
    /**
     * @param fromEmail 发送者的邮箱
     * @param toEmail   接受者的邮箱
     * @param emailHTMLMsg  发送的html代码
     * @param password 发送者的邮箱密码或者授权码
     * @author porkchop
     * @date 2017/9/21 14:55
     */
    public static boolean sendMail(String fromEmail, String password, String toEmail, String emailHTMLMsg)  {

        try {
            //定义Properties对象,设置环境信息
            Properties props = new Properties();

            //设置邮件服务器的地址
            props.setProperty("mail.transport.protocol", "smtp");//设置发送邮件使用的协议
            props.setProperty("mail.host", "smtp.qq.com"); // 指定的smtp服务器
            props.setProperty("mail.smtp.auth", "true");// 发送服务器需要身份验证
            props.setProperty("mail.debug", "true");// 开启debug调试

            //开启 SSL 加密,QQ 邮箱需要 SSL 加密
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            props.put("mail.smtp.ssl.enable", "true");
            props.put("mail.smtp.ssl.socketFactory", sf);


            //创建Session对象,session对象表示整个邮件的环境信息
            Session session = Session.getInstance(props);

            //设置输出调试信息
            session.setDebug(true);


            //Message的实例对象表示一封电子邮件
            MimeMessage message = new MimeMessage(session);
            //设置发件人的地址
            message.setFrom(new InternetAddress(fromEmail));
            //设置主题
            message.setSubject("用户激活");
            //设置邮件的文本内容
            message.setContent(emailHTMLMsg, "text/html;charset=utf-8");
            //从session的环境中获取发送邮件的对象
            Transport transport = session.getTransport();
            //连接邮件服务器
            transport.connect("smtp.qq.com", fromEmail, password);
            //设置收件人地址,并发送消息
            transport.sendMessage(message, new Address[]{new InternetAddress(toEmail)});
            transport.close();
            return true;
        } catch (GeneralSecurityException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }
}


