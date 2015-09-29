package com.myweb.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.myweb.entity.Operation;

public interface OperationDao extends JpaRepository<Operation, Long> {

}
