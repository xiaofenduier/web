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
	String op = request.getParameter("op");
	if (op.equals("check")) {
		String idStr = request.getParameter("check_id");
		int id = Integer.parseInt(idStr);
		Company c = new Company();
		c.setState(1);
		c.setId(id);
		
		CompanyDao cDao = new CompanyDao();
		int result = cDao.check(c);
		response.sendRedirect("company.jsp?currentPage=1");
	}
%>
