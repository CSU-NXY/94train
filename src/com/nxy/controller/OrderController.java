package com.nxy.controller;


import com.nxy.model.Order;
import com.nxy.model.TrainTable;
import com.xgh.service.OrderService;
import com.xgh.service.TicketService;
import org.apache.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import com.xgh.service.OrderService;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.TreeSet;

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

    @RequestMapping("/confirmOrder.do")
    public String ConfirmOrder(HttpSession session, @RequestParam("checkVal")String checkVal, ModelMap modelMap) {
        TrainTable trainTable = (TrainTable) session.getAttribute("trainTable");
        session.setAttribute("checkVal", checkVal);
        String price = (String) session.getAttribute("price");
        double Iprice = Double.valueOf(price);
        switch (checkVal){
            case "学生票": Iprice /= 2;
                break;
            case "军人票": Iprice /= 2;
                break;
            case "残疾票": Iprice /= 4;
                break;
        }
        trainTable.setPrice(Iprice);
        modelMap.addAttribute("price", String.valueOf(Iprice));
//        int UserID =  Integer.valueOf(session.getAttribute("S_UserID").toString());
        return "OrderPay";
    }

    @RequestMapping("/noPay.do")
    public String NoPay(HttpSession session) {
        TrainTable trainTable = (TrainTable) session.getAttribute("trainTable");
        int UserID =  Integer.valueOf(session.getAttribute("S_UserID").toString());
        TicketService.BuyTicket(UserID, trainTable, -1);
        TicketService.TicketCountChange(trainTable, -1);
        return "Index";
    }

    @ResponseBody
    @RequestMapping(value = "/deleteOrder.do",method = RequestMethod.POST)
    public void deleteOrder(int id,String trainid,String start,String end)
    {
        TrainTable trainTable = new TrainTable();
        trainTable.setStartStation(start);
        trainTable.setEndStation(end);
        trainTable.setStrainID(trainid);
        TicketService.TicketCountChange(trainTable,1);
        OrderService.DeleteOrder(id);
    }

    @ResponseBody
    @RequestMapping(value = "/returnTicket.do",method = RequestMethod.POST)
    public void returnTicket(int id,int status){
        OrderService.ChangeOrder(id,status);
    }

    @ResponseBody
    @RequestMapping(value = "/buyTicket.do",method = RequestMethod.POST)
    public void buyTicket(int id,int status){
        OrderService.ChangeOrder(id,status);
    }

    @RequestMapping(value = "/pay.do")
    public String pay(HttpSession session) {
        TrainTable trainTable = (TrainTable) session.getAttribute("trainTable");
        int UserID =  Integer.valueOf(session.getAttribute("S_UserID").toString());
        TicketService.BuyTicket(UserID, trainTable, 0);
        TicketService.TicketCountChange(trainTable, -1);
        return "Index";
    }
}
