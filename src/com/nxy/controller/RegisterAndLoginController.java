package com.nxy.controller;

import com.nxy.model.User;
import com.xgh.service.SendCodeService;
import com.xgh.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;


@Controller
@SessionAttributes({"S_UserID","S_Username", "S_ID", "S_Name"})

@RequestMapping(value = "/registerAndLogin", method = RequestMethod.GET)
public class RegisterAndLoginController {

    @RequestMapping(value = "/viewRegister.do", method = RequestMethod.GET)
    public String viewRegister(ModelMap model) {
        return "Register";
    }

    @RequestMapping(value = "/viewLogin.do", method = RequestMethod.GET)
    public String viewLogin() {
        return "Login";
    }

    @RequestMapping(value = "/Login.do",method = RequestMethod.POST)
    public  String Login(@ModelAttribute("User")User user,RedirectAttributesModelMap model,ModelMap modelMap) {
        int userid = UserService.Login(user);
        if (userid == -1) {
            model.addFlashAttribute("Msg", "登录失败!");
            return "redirect:/registerAndLogin/viewLogin.do";
        } else {
//            user.setUserID(userid);
            user = UserService.GetUserByUserID(userid);
            modelMap.addAttribute("S_UserID", user.getUserID());
            modelMap.addAttribute("S_Username", user.getPhoneNum());
            modelMap.addAttribute("S_ID", user.getID());
            modelMap.addAttribute("S_Name", user.getName());
            if(user.getUserID()==1)
            {
                return "redirect:/Admin/Change.do";
            }
            return "redirect:/index/viewIndex.do";
        }
    }

    String checkCode = null;

    @ResponseBody
    @RequestMapping(value = "/getWord.do",method = RequestMethod.POST)
    public void getWord(String id){
        checkCode = SendCodeService.SendCode(id);
    }


    @ResponseBody
    @RequestMapping(value = "/checkWord.do",method = RequestMethod.POST)
    public void checkWord(String id,HttpServletResponse response) throws Exception{
        PrintWriter writer = response.getWriter();
        if(checkCode.equals(id)){
            writer.write("true");
        }else{
            writer.write("false");
        }

        writer.flush();
        writer.close();
    }




    User tempUser = null;
    @RequestMapping(value = "/noJump.do",method = RequestMethod.POST)
    public void Register(@ModelAttribute("User")User user){
        tempUser = user;
    }

    @RequestMapping(value = "/noJump2.do",method = RequestMethod.POST)
    public void Register2(@ModelAttribute("User")User user2) {
        User user = new User(tempUser, user2);
        UserService.Register(user);
    }

    @RequestMapping(value = "/LogOut.do",method = RequestMethod.POST)
    public  String LogOut(SessionStatus sessionStatus)
    {
        sessionStatus.setComplete();
        return "redirect:/index/viewIndex.do";

    }
}
