package com.neusoft.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import sun.awt.SunHints;


@Controller
public class IndexController {

    @RequestMapping(value={"","/"})
    public String index(){

        return "redirect:/login/uIndex";
    }
}
