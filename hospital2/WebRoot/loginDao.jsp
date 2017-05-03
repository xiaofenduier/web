<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hospital.dao.UserDao"%>
<%@ page import="com.hospital.dao.DoctorDao"%>
<%@ page import="com.hospital.entity.User"%>
<%@ page import="com.hospital.entity.Doctor"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 封装user对象 -->
<%
	String op = request.getParameter("optionsRadiosinline");
	System.out.println(op);
	if (op.equals("user")) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = new User();
		user.setPassword(password);
		user.setUsername(username);
		UserDao userDao = new UserDao();
		int result = userDao.login(user);
		if(result > 0){
			request.getSession().setAttribute("id", result);
			response.sendRedirect("user_index.jsp?state=" + result);
		}else{
			response.sendRedirect("login.jsp?state=" + result);
		}
	}
	if (op.equals("doctor")) {
		String idStr = request.getParameter("username");
		int id = Integer.parseInt(idStr);
		String password = request.getParameter("password");
		Doctor doctor = new Doctor();
		doctor.setPassword(password);
		doctor.setId(id);
		DoctorDao doctorDao = new DoctorDao();
		int result = doctorDao.login(doctor);
		if(result > 0){
			request.getSession().setAttribute("id", result);
			response.sendRedirect("doctormanage_doctor_index.jsp?state=" + result);
		}else{
			response.sendRedirect("login.jsp?state=" + result);
		}
	}
	if(op.equals("root")){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = new User();
		user.setPassword(password);
		user.setUsername(username);
		UserDao userDao = new UserDao();
		int result = userDao.login(user);
		if(result > 0){
			request.getSession().setAttribute("id", result);
			response.sendRedirect("index.jsp?state=" + result);
		}else{
			response.sendRedirect("login.jsp?state=" + result);
		}
	}
%>