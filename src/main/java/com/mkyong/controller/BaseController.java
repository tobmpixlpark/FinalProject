package com.mkyong.controller;

import com.google.gson.Gson;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.FileWriter;
import java.io.FilterWriter;
import java.io.IOException;

@Controller
public class BaseController {
    private static int counter = 0;
    private static final String VIEW_INDEX = "index";
    private final static org.slf4j.Logger logger = LoggerFactory.getLogger(BaseController.class);

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String welcome(ModelMap model) {

        model.addAttribute("message", "Welcome");
        model.addAttribute("counter", ++counter);
        logger.debug("[welcome] counter : {}", counter);

        // Spring uses InternalResourceViewResolver and return back index.jsp
        return VIEW_INDEX;

    }

    @RequestMapping(value = "/{name}", method = RequestMethod.GET)
    public String welcomeName(@PathVariable String name, ModelMap model) {

        model.addAttribute("message", "Welcome " + name);
        model.addAttribute("counter", ++counter);
        return VIEW_INDEX;

    }

    @RequestMapping(value = "/Formular", method = RequestMethod.POST)
    public ModelAndView formular(@ModelAttribute ContactForm contactForm, ModelAndView model) throws IOException {

        logger.debug("Hello "+ contactForm.getVname()+" "+contactForm.getZname());
        logger.debug("works");
        model.setViewName("index");
        Gson gson = new Gson();
        gson.toJson(contactForm, new FileWriter("C:\\Users\\tobmerx\\Downloads\\CounterWebApp-master\\User\\test.json")); //Daten von Webseite werden in JSON gespechert
        return model;
    }

}