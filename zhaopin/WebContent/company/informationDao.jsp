<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.CompanyDao"%>
<%@ page import="com.zhaopin.entity.Company"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	String idStr = request.getParameter("id");
	int id = Integer.parseInt(idStr);
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String address = request.getParameter("address");
	String telphoneStr = request.getParameter("telphone");
	long telphone = Long.parseLong(telphoneStr);
	String fanwei = request.getParameter("fanwei");
	String jigou = request.getParameter("jigou");
	String shuiwuStr = request.getParameter("shuiwu");
	long shuiwu = 0;
	if(shuiwuStr != null && shuiwuStr != ""){
		shuiwu = Long.parseLong(shuiwuStr);
	}
	String time = request.getParameter("time");
	String yyzz = request.getParameter("yyzz");
	String xy = request.getParameter("xy");
	String username = request.getParameter("username");
	String userpassport = request.getParameter("userpassport");
	String introduce = request.getParameter("introduce");
	
	Company c = new Company();
	c.setId(id);
	c.setName(name);
	c.setAddress(address);
	c.setPassword(password);
	c.setTelphone(telphone);
	c.setRange(fanwei);
	c.setCode(jigou);
	c.setShuiwu(shuiwu);
	c.setTime(time);
	c.setYyzz(yyzz);
	c.setXy(xy);
	c.setUserName(username);
	c.setUserPassport(userpassport);
	c.setIntroduce(introduce);
	CompanyDao cDao = new CompanyDao();
	cDao.update(c);
	response.sendRedirect("information.jsp?state=1");
%>
