package com.myweb.service.imp;

import java.util.HashSet;
import java.util.Set;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.dao.UserDao;
import com.myweb.entity.Operation;
import com.myweb.entity.Permission;
import com.myweb.entity.Resource;
import com.myweb.entity.Role;
import com.myweb.entity.User;
import com.myweb.security.util.PasswordHelper;
import com.myweb.service.UserService;

@Service
public class UserServiceImp implements UserService {

    @Inject
    private UserDao userDao;

    @Inject
    private PasswordHelper passwordHelper;

    @Override
    public User save(User user) {
        // TODO Auto-generated method stub
        passwordHelper.encryptPassword(user);

        return userDao.save(user);
    }

    @Override
    public Set<String> getStringRoles(String username) {
        // TODO Auto-generated method stub

        User user = userDao.findByUsername(username);

        Set<Role> roles = user.getRoles();

        Set<String> stringRoles = new HashSet<>();
        for (Role r : roles) {
            stringRoles.add(r.getRole());
        }

        return stringRoles;
    }

    @Override
    public Set<String> getStringPermissions(String username) {
        // TODO Auto-generated method stub

        User user = userDao.findByUsername(username);

        Set<String> stringPermissions = new HashSet<>();

        for (Role r : user.getRoles()) {
            for (Permission p : r.getPermissions()) {
                Resource res = p.getResource();

                for (Operation o : p.getOperations()) {
                    stringPermissions.add(res.getIdentity() + ":" + o.getOperation());

                }

            }

        }

        return stringPermissions;
    }

}
