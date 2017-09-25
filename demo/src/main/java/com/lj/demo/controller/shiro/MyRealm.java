package com.lj.demo.controller.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.lj.demo.model.User;
import com.lj.demo.service.LoginService;
import com.lj.demo.service.UserService;

/** 
* @author liujie 
* @version 创建时间：2017年9月12日 下午2:24:45 
* 类说明 
*/
public class MyRealm extends AuthorizingRealm {

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private UserService userService;
	
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String telphone = (String) principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		authorizationInfo.setRoles(loginService.getRoles(telphone));
        /*authorizationInfo.setStringPermissions(userService.getPermissions(username));*/
        return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String telphone = (String) token.getPrincipal(); // 获取登录账号
		User user = new User();
		user.setTelphone(telphone);
		user = userService.getUserByUserModel(user, "asc", "id").get(0);
		if(user != null) {
            AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(user.getTelphone(), user.getPassword(), "myRealm");
            return authcInfo;
        } else {
            return null;
        }       
	}

}
