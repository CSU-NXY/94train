package com.xgh.service;

import org.junit.Test;

import static org.junit.Assert.*;

public class SendCodeServiceTest {
    @Test
    public void sendCode() throws Exception {
        System.out.println(SendCodeService.SendCode("18373158992"));
    }

    @Test
    public void sendMail() throws Exception {
        System.out.println(SendCodeService.sendMail("1104155190@qq.com"));
    }

}