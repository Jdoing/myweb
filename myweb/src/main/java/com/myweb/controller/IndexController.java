package com.myweb.controller;

import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.myweb.annotations.CurrentUser;
import com.myweb.entity.Permission;
import com.myweb.entity.Resource;
import com.myweb.entity.Role;
import com.myweb.entity.User;

@Controller
public class IndexController {

    @RequestMapping(value = { "/index", "/" })
    public ModelAndView index(@CurrentUser User user) {
        Set<Role> roles = user.getRoles();

        Set<Permission> permissions = new HashSet<>();
        for (Role r : roles) {
            permissions.addAll(r.getPermissions());
        }

        Set<Resource> resources = new HashSet<>();
        for (Permission p : permissions) {
            resources.add(p.getResource());
        }

        ModelAndView mv = new ModelAndView();
        mv.addObject("menus", resources);
        mv.setViewName("index");

        return mv;
    }

    @RequestMapping(value = "/unauthorized")
    public String unauthorized() {
        return "unauthorized";
    }

}
