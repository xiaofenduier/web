<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hospital.dao.DepartmentDao"%>
<%@ page import="com.hospital.entity.Department"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="com.hospital.dao.DoctorDao"%>
<%@ page import="com.hospital.entity.Doctor"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 封装department对象 -->
<%
	request.setCharacterEncoding("UTF-8");
	String op = request.getParameter("op");
	Department department = new Department();
	DepartmentDao departmentDao = new DepartmentDao();
	if (op.equals("update")) {
		String idStr = request.getParameter("id");
		System.out.println(idStr);
		int id = Integer.parseInt(idStr);
		String name = request.getParameter("name");
		String introduce = request.getParameter("introduce");
		String telphone = request.getParameter("telphone");
		department.setId(id);
		department.setIntroduce(introduce);
		department.setName(name);
		department.setTelphone(telphone);
		int result = departmentDao.update(department);
		response.sendRedirect("department_info.jsp?currentPage=1");
	}
	if (op.equals("add")) {
		String name = request.getParameter("add_name");
		String introduce = request.getParameter("add_introduce");
		String telphone = request.getParameter("add_telphone");
		department.setIntroduce(introduce);
		department.setName(name);
		department.setTelphone(telphone);
		int result = departmentDao.add(department);
		response.sendRedirect("department_info.jsp?currentPage=1");
		
	}
	if (op.equals("delete")) {
		String idStr = request.getParameter("delete_id");
		int id = Integer.parseInt(idStr);
		department.setId(id);
		int result = departmentDao.delete(department);
		response.sendRedirect("department_info.jsp?currentPage=1");
	}
%>
