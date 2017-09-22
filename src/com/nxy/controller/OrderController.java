package com.nxy.controller;

import com.nxy.model.Order;
import com.xgh.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping(value = "/Order", method = RequestMethod.GET)
public class OrderController {

    @ResponseBody
    @RequestMapping("/Search.do")
    public List<Order> Search(@RequestParam("type")String type, HttpSession session)
    {
        List<Order> ls = OrderService.FindOrder((int)session.getAttribute("S_UserID"));
        if(Objects.equals(type, "ALL")) {
            return ls;
        }
        else if(Objects.equals(type, "NotEnd"))
        {
            List<Order> temp = new ArrayList<Order>();
            for(int i =0;i<ls.size();i++)
            {
                if(temp.get(i).getStatus()==1)
                    temp.add(temp.get(i));
            }
            return temp;
        }
        else if(Objects.equals(type, "NotPay"))
        {
            List<Order> temp = new ArrayList<Order>();
            for(int i =0;i<ls.size();i++)
            {
                if(temp.get(i).getStatus()==0)
                    temp.add(temp.get(i));
            }
            return temp;
        }
        return ls;
    }
}
