package com.lj.demo.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lj.demo.model.Login;
import com.lj.demo.model.User;
import com.lj.demo.service.LoginService;
import com.lj.demo.service.UserService;
import com.lj.demo.util.RandomValidateCode;
import com.lj.demo.util.TimeUtil;

/** 
* @author liujie 
* @version 创建时间：2017年8月28日 下午5:09:33 
* 类说明  登录类
*/

@Controller
@RequestMapping("login")
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("getRandomValidateCode")
	@ResponseBody
	public void getRandomValidateCode(HttpServletRequest request, HttpServletResponse response){
		response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
        	String randomValidateCodeStr = randomValidateCode.getRandcode(request, response);//输出图片方法
        	request.getSession().setAttribute("randomValidateCodeStr", randomValidateCodeStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	@ResponseBody
	@RequestMapping("loginin")
	public int loginIn(User user, String login_randomValidateCode, HttpServletRequest request){
		String randomValidateCodeStr = (String) request.getSession().getAttribute("randomValidateCodeStr");
		if(randomValidateCodeStr.compareToIgnoreCase(login_randomValidateCode) != 0){
			return -1;
		}
		/*shiro*/
		Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(user.getTelphone(), user.getPassword());
        subject.login(token);//会跳到我们自定义的realm中
        if(subject.isAuthenticated()){
        	Session session = subject.getSession();
        	Date startTimestamp = session.getStartTimestamp();
        	Date lastAccessTime = session.getLastAccessTime();
        	String host = session.getHost();
        	
        	TimeUtil timeUtil = new TimeUtil();
    		String startTimeStr = timeUtil.Date2String(startTimestamp);
    		String lastAccessTimeStr = timeUtil.Date2String(lastAccessTime);
    		Login login = new Login();
    		login.setHost(host);
    		login.setLastaccesstime(lastAccessTimeStr);
    		login.setStarttime(startTimeStr);
    		user = userService.getUserByUserModel(user, "asc", "id").get(0);
    		login.setUserid(user.getId());
    		return loginService.insert(login);
        }else{
        	return 0;
        }
	}
}
