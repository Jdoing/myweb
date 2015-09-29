package com.myweb.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.myweb.entity.Permission;

public interface PermissionDao extends JpaRepository<Permission, Long> {

}
