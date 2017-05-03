<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hospital.dao.UserDao"%>
<%@ page import="com.hospital.entity.User"%>
<%@ page import="com.hospital.dao.GuahaoDao"%>
<%@ page import="com.hospital.entity.Guahao"%>
<%@ page import="com.hospital.dao.DoctorDao"%>
<%@ page import="com.hospital.entity.Doctor"%>
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
	Guahao g = new Guahao();
	GuahaoDao guahaoDao = new GuahaoDao();
	if (op.equals("update")) {
		String up_id = request.getParameter("up_id");
		String up_departmentid = request.getParameter("up_departmentid");
		String up_doctorid = request.getParameter("up_doctorid");
		String up_time = request.getParameter("up_time");
		String up_userid = request.getParameter("up_userid");
		int id = Integer.parseInt(up_id);
		int up_docid = Integer.parseInt(up_doctorid);
		int up_departid = Integer.parseInt(up_departmentid);
		int up_uid = Integer.parseInt(up_userid);
		g.setId(id);
		g.setDepartmentId(up_departid);
		g.setDoctorId(up_docid);
		g.setUserid(up_uid);
		g.setTime(up_time);
		int result = guahaoDao.update(g);
		response.sendRedirect("root_guahao.jsp?currentPage=1");
	}

	if (op.equals("delete")) {
		String idStr = request.getParameter("delete_id");
		int id = Integer.parseInt(idStr);
		g.setId(id);
		int result = guahaoDao.delete(g);
		response.sendRedirect("root_guahao.jsp?currentPage=1");
	}
	if (op.equals("add")) {
		String add_departmentid = request.getParameter("add_departmentid");
		String add_doctorid = request.getParameter("add_doctorid");
		String add_time = request.getParameter("add_time");
		String add_userid = request.getParameter("add_userid");
		int add_docid = Integer.parseInt(add_doctorid);
		int add_departid = Integer.parseInt(add_departmentid);
		int add_uid = Integer.parseInt(add_userid);
		g.setDepartmentId(add_departid);
		g.setDoctorId(add_docid);
		g.setUserid(add_uid);
		g.setTime(add_time);
		Doctor doctor = new Doctor();
		doctor.setId(add_docid);
		DoctorDao doctorDao = new DoctorDao();
		doctor = doctorDao.select(doctor);
		g.setDoctorName(doctor.getName());
		int result = guahaoDao.add(g);
		response.sendRedirect("root_guahao.jsp?currentPage=1");
	}
%>
