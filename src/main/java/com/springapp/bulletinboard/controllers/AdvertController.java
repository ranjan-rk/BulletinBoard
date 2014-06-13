package com.springapp.bulletinboard.controllers;

import com.springapp.bulletinboard.Advert;
import com.springapp.bulletinboard.service.AdvertService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class AdvertController {
    @Autowired
    private AdvertService advertService;

    @RequestMapping(value = "/adverts", method = RequestMethod.GET)
    public String listAdverts(ModelMap model) {
        model.addAttribute("advert", new Advert());
        model.addAttribute("adverts", advertService.findAll());
        return "adverts";
    }

    @RequestMapping(value = "/adverts/add", method = RequestMethod.POST)
    public String addAdvert(@ModelAttribute("advert") Advert advert, BindingResult result) {
        advertService.save(advert);
        return "redirect:/adverts";
    }

    @RequestMapping(value = "/adverts/delete/{advertId}", method = RequestMethod.POST)
    public String deleteAdvert(@PathVariable("advertId") Long advertId) {
        advertService.delete(advertId);
        return "redirect:/adverts";
    }

    @RequestMapping(value = "/api/adverts", method = RequestMethod.GET)
    public
    @ResponseBody
    String listAdvertsJson(ModelMap model) throws JSONException {
        JSONArray advertsArray = new JSONArray();
        for (Advert ad : advertService.findAll()) {
            JSONObject advertJSON = new JSONObject();
            advertJSON.put("id", ad.getId());
            advertJSON.put("title", ad.getTitle());
            advertJSON.put("text", ad.getText());
            advertJSON.put("userName", ad.getUserName());
            advertJSON.put("timeStamp", ad.getTimeStamp());
            advertsArray.put(advertJSON);
        }
        return advertsArray.toString();
    }
}
