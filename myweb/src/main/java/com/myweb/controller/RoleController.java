package com.myweb.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myweb.dao.RoleDao;
import com.myweb.entity.Role;
import com.myweb.service.RoleService;

@Controller
@RequestMapping("/api/role")
public class RoleController {

    @Inject
    private RoleDao roleDao;

    @Inject
    private RoleService roleService;

    @RequiresPermissions("role:view")
    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view() {
        return "role/role";
    }

    @RequestMapping(value = { "/all", "/list" }, method = RequestMethod.GET)
    @ResponseBody
    public List<Role> all() {
        List<Role> roles = roleDao.findAll();
        return roles;
    }

    @RequiresPermissions("role:delete")
    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    @ResponseBody
    public String delete(@RequestParam Long id) {

        roleDao.delete(id);
        return "OK";
    }

    @RequiresPermissions("role:create")
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public String save(@RequestParam String name, @RequestParam String description, @RequestParam String role) {
        Role r = new Role();
        r.setName(name);
        r.setDescription(description);
        r.setRole(role);
        roleDao.save(r);

        return "OK";
    }

    @RequiresPermissions("role:edit")
    @RequestMapping(value = "/auth", method = RequestMethod.POST)
    @ResponseBody
    public String auth(@RequestParam Long roleId, @RequestParam(value = "resource") Long resourceId,
            @RequestParam(value = "operations") List<Long> operationIds) {
        if (roleService.authorise(roleId, resourceId, operationIds)) {
            return "OK";
        } else {
            return "fail";
        }

    }

}
