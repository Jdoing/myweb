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

import com.myweb.dao.OperationDao;
import com.myweb.entity.Operation;

@Controller
@RequestMapping("/api/operation")
public class OperationController {

    @Inject
    private OperationDao operationDao;

    @RequiresPermissions("operation:view")
    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view() {
        return "operation/operation";
    }

    @RequestMapping(value = { "/all", "/list" }, method = RequestMethod.GET)
    @ResponseBody
    public List<Operation> getAll() {
        List<Operation> list = operationDao.findAll();

        return list;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Operation getOne(@PathVariable Long id) {

        return operationDao.findOne(id);
    }

    @RequiresPermissions("operation:create")
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public String save(Operation operation) {

        operationDao.save(operation);

        return "OK";
    }

    @RequiresPermissions("operation:edit")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String getOperation(@RequestParam Long id, @RequestParam String name, @RequestParam String operation,
            @RequestParam String description) {

        Operation o = operationDao.findOne(id);
        o.setName(name);
        o.setOperation(operation);
        o.setDescription(description);

        operationDao.save(o);
        return "OK";
    }

    @RequiresPermissions("operation:delete")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam Long id) {

        operationDao.delete(id);

        return "OK";
    }

}
