package com.alan.hrsys.ajax.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @RequestMapping("/")
    public String redirectToIndex() {
        return "redirect:/index"; // 将根路径重定向到 /index
    }
    @RequestMapping("index")
    public String index() {
        return "index";
    }

}
