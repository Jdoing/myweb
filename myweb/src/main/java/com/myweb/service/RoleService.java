package com.myweb.service;

import java.util.List;

public interface RoleService {
    boolean authorise(Long roleId, Long resourceId, List<Long> operationIds);

}
