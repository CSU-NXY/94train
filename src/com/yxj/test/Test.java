package com.xgh.service;

import com.nxy.model.TrainTable;
import com.nxy.model.User;
import com.yxj.dao.UserDAO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import sun.security.provider.MD5;

import java.sql.SQLException;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/config/spring-common.xml")
public class Test {
    public static void main(String args[]) throws SQLException, ClassNotFoundException {
        @Autowired
        UserDAO userMapper;

        @Test
        public void testAdd(){
            User user = new User(-1, "23", "jiuqiyuliang");
            userMapper.save(user);

        }
    }
}
