package com.springapp.bulletinboard.controllers;

import com.springapp.bulletinboard.Advert;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(ModelMap model) {
        return "index";
    }
}
