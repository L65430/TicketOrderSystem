package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BeginController {

    @RequestMapping("/index")
    public String  get_index (){
        return "index";
    }

    @RequestMapping("/return_to_index")
    public String return_to_index(){
        return "index";
    }

}
