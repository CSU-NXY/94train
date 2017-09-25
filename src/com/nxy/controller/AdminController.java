package com.nxy.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nxy.model.JsonObject;
import com.nxy.model.Train;
import com.nxy.model.TrainTable;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.xgh.service.AdminService;
import com.xgh.service.TicketService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/Admin", method = RequestMethod.GET)
public class AdminController {
    @RequestMapping("/Change.do")
    public String viewIndex(HttpSession httpSession)
    {
        if((int)httpSession.getAttribute("S_UserID")==1)
            return "Change";
        return "redirect:index/ViewIndex.do";
    }
    @RequestMapping("/TrainList.do")
    @ResponseBody
    public List<Train> GetTrainList(HttpSession httpSession)
    {
        List<Train> ls = AdminService.GetTrainList();
        return ls;
    }

    @RequestMapping("/TrainInfo.do")
    public String GetTrainTableList(String TrainID,int seats, ModelMap model)
    {
        model.addAttribute("TrainID",TrainID);
        model.addAttribute("seats",seats);
        return "InfoChange";
    }

    @RequestMapping("/TrainSectionList.do")
    @ResponseBody
    public List<TrainTable> GetTrainSectionList(String TrainID)
    {
        return TicketService.SearchByID(TrainID);
    }


    @RequestMapping("/TrainDelete.do")
    public String DelectTrain(String TrainID)
    {
        AdminService.DeleteTrain(TrainID);
        return "redirect:/Admin/Change.do";
    }

    @RequestMapping(value = "/SaveTrainList.do",method = RequestMethod.POST)
    public  String Save(@ModelAttribute("json") String json,@ModelAttribute("trainid")String trainID,@ModelAttribute("index")int index,@ModelAttribute("seats")int seats)
    {
        String a = json;
        ObjectMapper mapper = new ObjectMapper();
        JsonObject[] ls = null;
        try {
            ls = mapper.readValue(json, JsonObject[].class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        AdminService.AddSections(AdminService.JsonObjectToTrainTable(ls,trainID),trainID,seats);
        return "redirect:/Admin/Change.do";
    }

}