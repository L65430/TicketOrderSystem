package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaySuccessController {


    @RequestMapping("/PaySuccess/Turn_to_single")
    public String turn_to_single(){
        return "showindex";
    }

    @RequestMapping("/PaySuccess/Turn_to_order")
    public String turn_to_order(){
        return "order_list";
    }
}
