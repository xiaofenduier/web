<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hospital.dao.GuahaoDao"%>
<%@ page import="com.hospital.entity.Guahao"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 封装department对象 -->
<%
	request.setCharacterEncoding("UTF-8");
	Guahao g = new Guahao();
	GuahaoDao gDao = new GuahaoDao();
	String idStr = request.getParameter("id");
	int id = Integer.parseInt(idStr);
	String name = request.getParameter("name");
	String time = request.getParameter("time");
	String departmentidStr = request.getParameter("departmentid");
	int userid = (int)request.getSession().getAttribute("id");
	g.setDoctorId(id);
	g.setDepartmentId(Integer.parseInt(departmentidStr));
	g.setDoctorName(name);
	g.setTime(time);
	g.setUserid(userid);
	int result = gDao.add(g);
	response.sendRedirect("guahao_persion.jsp?currentPage=1");
%>
