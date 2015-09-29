package com.myweb.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.myweb.entity.User;

public interface UserDao extends JpaRepository<User, Long> {

    User findByUsername(String username);
}
