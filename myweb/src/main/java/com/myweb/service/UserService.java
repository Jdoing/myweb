package com.myweb.service;

import java.util.Set;

import com.myweb.entity.User;

public interface UserService {

    User save(User user);

    Set<String> getStringRoles(String username);

    Set<String> getStringPermissions(String username);

}
