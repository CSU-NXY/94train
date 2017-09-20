package com.nxy.model;

import com.sun.mail.util.MailSSLSocketFactory;

import java.security.GeneralSecurityException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailTool {
    /**
     * 获取当前时间
     *
     * @return String
     */
    public static String getStringDate() {
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(currentTime);
        return dateString;
    }

    public static void sendMail(String checkSum, String targetAddress)throws MessagingException, GeneralSecurityException  {
        Properties props = new Properties();

        // 开启debug调试
        props.setProperty("mail.debug", "true");
        // 发送服务器需要身份验证
        props.setProperty("mail.smtp.auth", "true");
        // 设置邮件服务器主机名
        props.setProperty("mail.host", "smtp.qq.com");
        // 发送邮件协议名称
        props.setProperty("mail.transport.protocol", "smtp");

        // 开启SSL加密，否则会失败
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.socketFactory", sf);

        // 创建session
        Session session = Session.getInstance(props);

        // 创建邮件
        Message msg = new MimeMessage(session);
        // 设置标题
        msg.setSubject("94train");
        // 编辑内容
        StringBuilder builder = new StringBuilder();
        builder.append("您的验证码是\n");
        builder.append(checkSum + "\n");
        builder.append("请及时输入。");
        builder.append("\n时间 " + getStringDate());
        // 设置内容
        msg.setText(builder.toString());
        // 发送的邮箱地址
        msg.setFrom(new InternetAddress("1104155190@qq.com"));
        // 通过session得到transport对象
        Transport transport = session.getTransport();
        // 连接邮件服务器：邮箱类型，帐号，授权码代替密码（更安全）
        transport.connect("smtp.qq.com", "1104155190@qq.com", "dtzyyshoqbkgibge");
        // 发送邮件
        transport.sendMessage(msg, new Address[]{new InternetAddress(targetAddress)});
        transport.close();
    }
}
