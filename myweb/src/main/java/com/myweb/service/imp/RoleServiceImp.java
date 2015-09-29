package com.myweb.service.imp;

import java.util.List;
import java.util.Set;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.dao.OperationDao;
import com.myweb.dao.PermissionDao;
import com.myweb.dao.ResourceDao;
import com.myweb.dao.RoleDao;
import com.myweb.entity.Operation;
import com.myweb.entity.Permission;
import com.myweb.entity.Resource;
import com.myweb.entity.Role;
import com.myweb.service.RoleService;

@Service
public class RoleServiceImp implements RoleService {
    @Inject
    private RoleDao roleDao;

    @Inject
    private ResourceDao resourceDao;

    @Inject
    private OperationDao operationDao;

    @Inject
    private PermissionDao permissionDao;

    @Override
    public boolean authorise(Long roleId, Long resourceId, List<Long> operationIds) {
        // TODO Auto-generated method stub

        Role r = roleDao.findOne(roleId);

        if (r == null)
            return false;

        Resource resource = resourceDao.findOne(resourceId);
        List<Operation> operations = operationDao.findAll(operationIds);

        Set<Permission> hasPerms = r.getPermissions();

        Permission permission = null;
        for (Permission p : hasPerms) {
            if (p.getResource().equals(resource)) {
                permission = p;
                break;
            }

        }

        if (permission == null) {
            permission = new Permission();
            permission.setResource(resource);
            permission.getOperations().addAll(operations);
            // permission = permissionDao.save(permission);
            r.getPermissions().add(permission);
            roleDao.save(r);
        } else {
            permission.getOperations().addAll(operations);
            permissionDao.save(permission);
        }
        return true;
    }

}
