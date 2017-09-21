package com.nxy.controller;

import com.nxy.model.User;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.*;

@Controller
public class jsonController {

    @RequestMapping("/tojson.do")
    @ResponseBody
    public void returnJSON(HttpServletResponse response) throws Exception{
        User user1 = new User(1,"a");
        User user2 = new User(2,"b");
        User user3 = new User(3,"c");
        User user4 = new User(4,"d");

        List<User> userList = new ArrayList(){};
        userList.add(user1);
        userList.add(user2);
        userList.add(user3);
        userList.add(user4);

        if (userList != null) {
            // 返回json字符串
            response.setContentType("text/plain; charset=utf-8");
            JSONArray obj = JSONArray.fromObject(userList); // 集合转为json
            JSONObject jb = new JSONObject();
            //将jsonArray对象装入
            jb.put("user", obj);
            PrintWriter out = response.getWriter();
            //输出Json数据，它就是一种特殊格式的字符串
            //out.write(jb.toString());
            out.write(obj.toString());
            out.flush();
            out.close();
        }

    }
}
