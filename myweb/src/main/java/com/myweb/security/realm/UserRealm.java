package com.myweb.security.realm;

import javax.inject.Inject;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import com.myweb.dao.UserDao;
import com.myweb.entity.User;
import com.myweb.service.UserService;

public class UserRealm extends AuthorizingRealm {
    @Inject
    private UserService userService;

    @Inject
    private UserDao userDao;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        // 授权
        String username = (String) principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();

        authorizationInfo.setRoles(userService.getStringRoles(username));
        authorizationInfo.setStringPermissions(userService.getStringPermissions(username));
        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
            throws AuthenticationException {
        // 认证
        String username = (String) authenticationToken.getPrincipal();

        User user = userDao.findByUsername(username);
        // 查出是否有此用户
        if (user == null) {
            throw new UnknownAccountException();// 没找到帐号
        }

        if (Boolean.TRUE.equals(user.getLocked())) {
            throw new LockedAccountException(); // 帐号锁定
        }

        // 交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配，如果觉得人家的不好可以自定义实现
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user.getUsername(),
                user.getPassword(), ByteSource.Util.bytes(user.getCredentialsSalt()), getName());

        return authenticationInfo;

    }
}
