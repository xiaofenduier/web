<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.ZhiweijianliDao"%>
<%@ page import="com.zhaopin.entity.Zhiweijianli"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	String op = request.getParameter("op");
	if (op.equals("refuse")) {
		String idStr = request.getParameter("refuse_id");
		int id = Integer.parseInt(idStr);
		Zhiweijianli zwjl = new Zhiweijianli();
		zwjl.setId(id);
		zwjl.setState(-1);
		ZhiweijianliDao zwjlDao = new ZhiweijianliDao();
		int result = zwjlDao.update(zwjl);
		response.sendRedirect("myjianli_info.jsp?currentPage=1");
	}
	if (op.equals("tongguo")) {
		String idStr = request.getParameter("check_id");
		int id = Integer.parseInt(idStr);
		Zhiweijianli zwjl = new Zhiweijianli();
		zwjl.setId(id);
		zwjl.setState(1);
		ZhiweijianliDao zwjlDao = new ZhiweijianliDao();
		int result = zwjlDao.update(zwjl);
		response.sendRedirect("myjianli_info.jsp?currentPage=1");
	}
%>
