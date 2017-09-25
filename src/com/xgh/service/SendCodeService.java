package com.xgh.service;

import com.nxy.model.CheckSumBuilder;
import com.sun.mail.util.MailSSLSocketFactory;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

public class SendCodeService {
    /**
     * 获取当前时间并格式化
     *
     * @return String
     */
    private static String getStringDate() {
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return formatter.format(currentTime);
    }

    private static String buildCheckSum() {
        //随机数
        final String NONCE = "123456";
        //网易云信分配的密钥，这里用于生成验证码
        final String APP_SECRET = "1f5ae41e1f8e";

        String curTime = String.valueOf((new Date()).getTime() / 1000L);

        return CheckSumBuilder.getCheckSum(APP_SECRET, NONCE, curTime);
    }

    /**
     * 生成验证码发送到目标手机，并返回此验证码
     *
     * @param MOBILE 手机号
     * @return 验证码
     */
    public static String SendCode(String MOBILE) {
        final String
                SERVER_URL = "https://api.netease.im/sms/sendcode.action";
        //网易云信分配的账号，请替换你在管理后台应用下申请的Appkey
        final String
                APP_KEY = "e63eb9ef151353620955f6931a685477";
        //随机数
        final String NONCE = "123456";
        //短信模板ID
        final String TEMPLATEID = "3078062";
        //验证码长度，范围4～10，默认为4
        final String CODELEN = "4";

        DefaultHttpClient httpClient = new DefaultHttpClient();
        HttpPost httpPost = new HttpPost(SERVER_URL);
        String curTime = String.valueOf((new Date()).getTime() / 1000L);
        /*
         * 参考计算CheckSum的java代码，在上述文档的参数列表中，有CheckSum的计算文档示例
         */
        String checkSum = buildCheckSum();

        // 设置请求的header
        httpPost.addHeader("AppKey", APP_KEY);
        httpPost.addHeader("Nonce", NONCE);
        httpPost.addHeader("CurTime", curTime);
        httpPost.addHeader("CheckSum", checkSum);
        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        // 设置请求的的参数，requestBody参数
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        /*
         * 1.如果是模板短信，请注意参数mobile是有s的，详细参数配置请参考“发送模板短信文档”
         * 2.参数格式是jsonArray的格式，例如 "['13888888888','13666666666']"
         * 3.params是根据你模板里面有几个参数，那里面的参数也是jsonArray格式
         */
        nvps.add(new BasicNameValuePair("templateid", TEMPLATEID));
        nvps.add(new BasicNameValuePair("mobile", MOBILE));
        nvps.add(new BasicNameValuePair("codeLen", CODELEN));

        try {
            httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

            // 执行请求
            HttpResponse response = httpClient.execute(httpPost);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return checkSum;
    }

    public static void sendMail(String targetAddress) {
        Properties props = new Properties();

        String checkSum = buildCheckSum();

        // 开启debug调试
        props.setProperty("mail.debug", "true");
        // 发送服务器需要身份验证
        props.setProperty("mail.smtp.auth", "true");
        // 设置邮件服务器主机名
        props.setProperty("mail.host", "smtp.qq.com");
        // 发送邮件协议名称
        props.setProperty("mail.transport.protocol", "smtp");

        try {
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
            String builder = "您的验证码是\n" +
                    checkSum + "\n" +
                    "请及时输入。" +
                    "\n时间 " + getStringDate();
            // 设置内容
            msg.setText(builder);
            // 发送的邮箱地址
            msg.setFrom(new InternetAddress("1104155190@qq.com"));
            // 通过session得到transport对象
            Transport transport = session.getTransport();
            // 连接邮件服务器：邮箱类型，帐号，授权码代替密码（更安全）
            transport.connect("smtp.qq.com", "1104155190@qq.com", "dtzyyshoqbkgibge");
            // 发送邮件
            transport.sendMessage(msg, new Address[]{new InternetAddress(targetAddress)});
            transport.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}

