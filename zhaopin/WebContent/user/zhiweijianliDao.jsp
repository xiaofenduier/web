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
	if (op.equals("choice")) {
		String zhiweiidStr = request.getParameter("zhiweiid");
		String jianliidStr = request.getParameter("jianliid");
		int zhiweiid = Integer.parseInt(zhiweiidStr);
		int jianliid = Integer.parseInt(jianliidStr);
		Zhiweijianli zj = new Zhiweijianli();
		zj.setJianliid(jianliid);
		zj.setZhiweiid(zhiweiid);

		ZhiweijianliDao zjDao = new ZhiweijianliDao();
		int result = zjDao.add(zj);
		response.sendRedirect("xiaoxi.jsp?currentPage=1&state=999");
	}
%>
