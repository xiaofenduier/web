<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hospital.dao.UserDao"%>
<%@ page import="com.hospital.entity.User"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!-- 封装user对象 -->
<%
	request.setCharacterEncoding("UTF-8");
	String op = request.getParameter("op");
	User user = new User();
	UserDao userDao = new UserDao();
	if (op.equals("updatepassword")) {
		int result = 0;
		int id = (int) request.getSession().getAttribute("id");
		String password = request.getParameter("new_password");
		String password2 = request.getParameter("new_password2");
		if (!password.equals(password2)) {
			result = 0;
		} else {
			user.setId(id);
			user.setPassword(password);
			result = userDao.updatePassword(user);
		}
		response.sendRedirect("user_index.jsp?state=" + result);
	}
	if (op.equals("update")) {
		int id = (int) request.getSession().getAttribute("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String realname = request.getParameter("realname");
		String telphone = request.getParameter("telphone");
		String sexStr = request.getParameter("sex");
		int sex = Integer.parseInt(sexStr);
		String ageStr = request.getParameter("age");
		int age = Integer.parseInt(ageStr);
		String email = request.getParameter("email");
		user.setId(id);
		user.setEmail(email);
		user.setRealname(realname);
		user.setSex(sex);
		user.setAge(age);
		user.setTelphone(telphone);
		user.setUsername(username);
		user.setPassword(password);
		int result = userDao.update(user);
		response.sendRedirect("user_info.jsp");
	}
	if (op.equals("add")) {
		String realname = request.getParameter("add_realname");
		String username = request.getParameter("add_username");
		String sexStr = request.getParameter("add_sex");
		int sex = Integer.parseInt(sexStr);
		String password = request.getParameter("add_password");
		String ageStr = request.getParameter("add_age");
		int age = Integer.parseInt(ageStr);
		String email = request.getParameter("add_email");
		String telphone = request.getParameter("add_telphone");
		user.setTelphone(telphone);
		user.setRealname(realname);
		user.setSex(sex);
		user.setAge(age);
		user.setUsername(username);
		user.setEmail(email);
		user.setPassword(password);
		int result = userDao.add(user);
		response.sendRedirect("user_index.jsp?state=" + result);
	}
	if (op.equals("delete")) {
		String idStr = request.getParameter("delete_id");
		System.out.println(idStr);
		int id = Integer.parseInt(idStr);
		user.setId(id);
		int result = userDao.delete(user);
		response.sendRedirect("user_index.jsp?state=" + result);
	}
	if (op.equals("updaterootpassword")) {
		int result = 0;
		int id = (int) request.getSession().getAttribute("id");
		String password = request.getParameter("new_password");
		String password2 = request.getParameter("new_password2");
		if (!password.equals(password2)) {
			result = 0;
		} else {
			user.setId(id);
			user.setPassword(password);
			result = userDao.updatePassword(user);
		}
		response.sendRedirect("index.jsp?state=" + result);
	}
	if (op.equals("addroot")) {
		String realname = request.getParameter("realname");
		String username = request.getParameter("username");
		String sexStr = request.getParameter("sex");
		int sex = Integer.parseInt(sexStr);
		String password = request.getParameter("password");
		String ageStr = request.getParameter("age");
		int age = Integer.parseInt(ageStr);
		String email = request.getParameter("email");
		String telphone = request.getParameter("telphone");
		String passport = request.getParameter("passport");
		user.setTelphone(telphone);
		user.setRealname(realname);
		user.setSex(sex);
		user.setAge(age);
		user.setUsername(username);
		user.setEmail(email);
		user.setPassport(passport);
		user.setPassword(password);
		int result = userDao.add(user);
		response.sendRedirect("index.jsp?state=" + result);
	}
%>
