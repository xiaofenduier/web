<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.CompanyDao"%>
<%@ page import="com.zhaopin.entity.Company"%>
<%@ page import="com.zhaopin.dao.UserDao"%>
<%@ page import="com.zhaopin.entity.User"%>
<%@ page import="com.zhaopin.dao.RootDao"%>
<%@ page import="com.zhaopin.entity.Root"%>
<%@ page import="com.zhaopin.dao.LoginDao"%>
<%@ page import="com.zhaopin.entity.Login"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	String op = request.getParameter("op");
	if (op.equals("company")) {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		Company c = new Company();
		c.setName(name);
		c.setPassword(password);
		CompanyDao cDao = new CompanyDao();
		Company lc = new Company();
		lc = cDao.select(c);
		int result = 0;
		if(lc.getAddress() != null){
			Login l = new Login();
			l.setUserName(name);
			Date date = new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			l.setLoginTime(sdf.format(date));
			LoginDao lDao = new LoginDao();
			result = lDao.add(l);
			request.getSession().setAttribute("companyid", lc.getId());
			request.getSession().setAttribute("companyname", lc.getName());
		}
		if(result <= 0){
			response.sendRedirect("companylogin.jsp?state="+result);
		}else{
			response.sendRedirect("../company/jianli_info.jsp?currentPage=1");
		}
	}
	if (op.equals("user")) {
		String realname = request.getParameter("realname");
		String password = request.getParameter("password");
		User user = new User();
		user.setPassword(password);
		user.setRealName(realname);
		
		UserDao userDao = new UserDao();
		User lc = new User();
		lc = userDao.select(user);
		int result = 0;
		if(lc.getPassword() != null){
			Login l = new Login();
			l.setUserName(realname);
			Date date = new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			l.setLoginTime(sdf.format(date));
			LoginDao lDao = new LoginDao();
			result = lDao.add(l);
			request.getSession().setAttribute("userid", lc.getId());
			request.getSession().setAttribute("username", lc.getRealName());
		}
		System.out.println(lc);
		if(result <= 0){
			response.sendRedirect("userlogin.jsp?state="+result);
		}else{
 			response.sendRedirect("../user/zhiwei_info.jsp?currentPage=1");
		}
	}
	if (op.equals("root")) {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		Root root = new Root();
		root.setPassword(password);
		root.setName(name);
		
		RootDao rootDao = new RootDao();
		Root lc = new Root();
		lc = rootDao.login(root);
		int result = 0;
		if(lc.getPassword() != null){
			Login l = new Login();
			l.setUserName(name);
			Date date = new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			l.setLoginTime(sdf.format(date));
			LoginDao lDao = new LoginDao();
			result = lDao.add(l);
			request.getSession().setAttribute("userid", lc.getId());
			request.getSession().setAttribute("username", lc.getName());
		}
		if(result <= 0){
			response.sendRedirect("rootlogin.jsp?state="+result);
		}else{
 			response.sendRedirect("../root/company.jsp?currentPage=1");
		}
	}
%>
