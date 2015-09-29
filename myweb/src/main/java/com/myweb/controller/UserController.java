package com.myweb.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myweb.dao.RoleDao;
import com.myweb.dao.UserDao;
import com.myweb.entity.Role;
import com.myweb.entity.User;
import com.myweb.service.UserService;

@Controller
@RequestMapping("/api/user")
public class UserController {
    @Inject
    private UserService userService;

    @Inject
    private RoleDao roleDao;

    @Inject
    private UserDao userDao;

    @RequiresPermissions("user:view")
    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view() {
        return "user/user";
    }

    @RequiresPermissions("user:delete")
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public String delete(@PathVariable Long id) {

        userDao.delete(id);
        return "OK";
    }

    @RequiresPermissions("user:create")
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public String saveUser(@RequestParam String username, @RequestParam String password, @RequestParam String email,
            @RequestParam(value = "roles", required = false) List<Long> roleIds) {

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);

        List<Role> roles = roleDao.findAll(roleIds);

        user.setRoles(new HashSet<>(roles));
        userService.save(user);
        return "OK";
    }

    @RequiresPermissions({ "user:edit", "role:edit" })
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String update(@RequestParam(value = "userId", required = true) Long userId,
            @RequestParam(value = "roles", required = true) List<Long> roleIds) {
        User user = userDao.findOne(userId);
        List<Role> roles = roleDao.findAll(roleIds);

        Set<Role> preRoles = user.getRoles();

        for (Role r : roles) {
            if (preRoles.contains(r))
                continue;
            user.getRoles().add(r);
        }

        try {
            userDao.save(user);
        } catch (Exception e) {
            return "update fail!";
        }

        return "OK";
    }

    @RequestMapping(value = "/all", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    // @ResponseBody
    public ResponseEntity<?> getAll() {

        List<User> list = userDao.findAll();

        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @RequestMapping(value = "/login.page", method = RequestMethod.GET)
    public String loginPage() {
        return "login";
    }

    @RequestMapping(value = "/register.page", method = RequestMethod.GET)
    public String registerPage() {
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public String register(User user) {
        try {
            userService.save(user);
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
        return "OK";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(User user) {
        ModelAndView mv = new ModelAndView();

        try {
            Subject subject = SecurityUtils.getSubject();
            UsernamePasswordToken authenticationToken = new UsernamePasswordToken(user.getUsername(),
                    user.getPassword());
            subject.login(authenticationToken);

        } catch (AuthenticationException e) {
            e.printStackTrace();
            mv.setViewName("redirect:/unauthorized");
            return mv;
        }

        mv.setViewName("redirect:/index");
        return mv;
    }

    @RequestMapping(value = "/logout")
    public void logout() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
    }

}
