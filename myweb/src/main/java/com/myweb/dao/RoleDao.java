package com.myweb.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.myweb.entity.Role;

public interface RoleDao extends JpaRepository<Role, Long> {

}
