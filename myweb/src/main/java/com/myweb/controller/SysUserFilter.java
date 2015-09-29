package com.myweb.controller;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.web.filter.PathMatchingFilter;

import com.myweb.constants.Constants;
import com.myweb.dao.UserDao;

public class SysUserFilter extends PathMatchingFilter {

    @Inject
    private UserDao userDao;

    @Override
    protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue)
            throws Exception {

        String username = (String) SecurityUtils.getSubject().getPrincipal();
        request.setAttribute(Constants.CURRENT_USER, userDao.findByUsername(username));
        return true;
    }
}