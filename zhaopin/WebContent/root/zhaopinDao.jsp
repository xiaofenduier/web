<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.ZhaopinDao"%>
<%@ page import="com.zhaopin.entity.Zhaopin"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	String op = request.getParameter("op");
	if(op.equals("del")){
		String idStr = request.getParameter("del_id");
		int id = Integer.parseInt(idStr);
		Zhaopin z = new Zhaopin();
		z.setId(id);

		ZhaopinDao zDao = new ZhaopinDao();
		int result = zDao.delete(z);
		response.sendRedirect("zhaopin.jsp?currentPage=100&state=1");
	}
%>
