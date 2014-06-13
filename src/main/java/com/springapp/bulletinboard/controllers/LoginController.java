package com.springapp.bulletinboard.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
    @RequestMapping(method=RequestMethod.GET, value="/login")
    public String displayLoginPage(){
        return "login";
    }

    @RequestMapping(value="/login", params="error")
    public String directToLoginPageWithError(Model model){
        // Adding an attribute to flag that an error happened at login
        model.addAttribute("loginFailed", true);

        return "login";
    }
}
