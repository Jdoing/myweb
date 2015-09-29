package com.myweb.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myweb.dao.ResourceDao;
import com.myweb.entity.Resource;

@Controller
@RequestMapping("/api/resource")
public class ResourceController {
    @Inject
    private ResourceDao resourceDao;

    @RequiresPermissions("resource:view")
    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view() {

        return "resource/resource";
    }

    @RequestMapping(value = { "/all", "/list" }, method = RequestMethod.GET)
    @ResponseBody
    public List<Resource> getAll() {

        return resourceDao.findAll();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Resource getOne(@PathVariable Long id) {
        return resourceDao.findOne(id);
    }

    @RequiresPermissions("resource:create")
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public String save(Resource resource) {
        resourceDao.save(resource);
        return "OK";
    }

    @RequiresPermissions("resource:edit")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String getResource(@RequestParam Long id, @RequestParam String identity, @RequestParam String name) {
        Resource r = resourceDao.findOne(id);
        r.setIdentity(identity);
        r.setName(name);
        return "OK";
    }

    @RequiresPermissions("resource:delete")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam Long id) {

        resourceDao.delete(id);

        return "OK";
    }

}
