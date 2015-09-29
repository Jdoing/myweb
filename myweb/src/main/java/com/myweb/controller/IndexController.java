package com.myweb.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.dao.ResourceDao;

@Controller
public class IndexController {
    @Inject
    private ResourceDao resourceDao;

    @RequestMapping(value = "/index")
    public String index() {

        return "index";
    }

    @RequestMapping(value = "/")
    public String home() {

        return "login";
    }

    @RequestMapping(value = "/unauthorized")
    public String unauthorized() {
        return "unauthorized";
    }

}
