<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.ZhiweiDao"%>
<%@ page import="com.zhaopin.entity.Zhiwei"%>
<%@ page import="com.zhaopin.dao.ZhaopinDao"%>
<%@ page import="com.zhaopin.entity.Zhaopin"%>
<%@ page import="com.zhaopin.dao.ZhiweijianliDao"%>
<%@ page import="com.zhaopin.entity.Zhiweijianli"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	String op = request.getParameter("op");
	if (op.equals("del")) {
		String zhaopinidStr = request.getParameter("del_zhaopin_id");
		int zhaopinid = Integer.parseInt(zhaopinidStr);
		String zwidStr = request.getParameter("del_zw_id");
		int zwid = Integer.parseInt(zwidStr);
		Zhaopin zp = new Zhaopin();
		Zhiwei zw = new Zhiwei();
		Zhiweijianli zwjl = new Zhiweijianli();
		ZhaopinDao zpDao = new ZhaopinDao();
		ZhiweiDao zwDao = new ZhiweiDao();
		ZhiweijianliDao zwjlDao = new ZhiweijianliDao();
		zwjl.setZhiweiid(zwid);
		zp.setId(zhaopinid);
		zw.setId(zwid);
		zpDao.delete(zp);
		zwDao.delete(zw);
		zwjl = zwjlDao.select(zwjl);
		zwjlDao.delete(zwjl);
		int result = zwjlDao.update(zwjl);
		response.sendRedirect("zhiwei.jsp?state=22&currentPage=1");
	}
	if (op.equals("update")) {
		String zhaopinidStr = request.getParameter("zhaopin_id");
		int zhaopinid = Integer.parseInt(zhaopinidStr);
		String zwidStr = request.getParameter("zw_id");
		int zwid = Integer.parseInt(zwidStr);
		String telphoneStr = request.getParameter("zhaopin_telphone");
		long telphone = Long.parseLong(telphoneStr);
		String starttime = request.getParameter("zhaopin_starttime");
		String endtime = request.getParameter("zhaopin_endtime");
		Zhaopin zp = new Zhaopin();
		ZhaopinDao zpDao = new ZhaopinDao();
		zp.setEndTime(endtime);
		zp.setStartTime(starttime);
		zp.setTelphone(telphone);
		zp.setId(zhaopinid);
		zpDao.update(zp);
		String name = request.getParameter("zw_name");
		String gongziSre = request.getParameter("zw_gongzi");
		int gongzi = Integer.parseInt(gongziSre);
		String xueli = request.getParameter("zw_xueli");
		String sex = request.getParameter("zw_sex");
		String ageStr = request.getParameter("zw_age");
		int age = Integer.parseInt(ageStr);
		String zhuanye = request.getParameter("zw_zhuanye");
		String renshuStr = request.getParameter("zw_renshu");
		int renshu = Integer.parseInt(renshuStr);
		String zige = request.getParameter("zw_zige");
		String zhize = request.getParameter("zw_zhize");
		Zhiwei zw = new Zhiwei();
		zw.setId(zwid);
		zw.setZhiweiName(name);
		zw.setGongzi(gongzi);
		zw.setRenshu(renshu);
		zw.setZuidixueli(xueli);
		zw.setSex(sex);
		zw.setAge(age);
		zw.setZhuanye(zhuanye);
		zw.setZige(zige);
		zw.setZhize(zhize);
		ZhiweiDao zwDao = new ZhiweiDao();
		zwDao.update(zw);
		response.sendRedirect("zhiwei.jsp?state=33&currentPage=1");
	}
	if (op.equals("sub")) {
		Object idObj = request.getSession().getAttribute("companyid");
		int companyid = 0;
		if(idObj != null){
			companyid = ((Integer)idObj).intValue();
		}
		String telphoneStr = request.getParameter("add_zhaopin_telphone");
		long telphone = Long.parseLong(telphoneStr);
		String endtime = request.getParameter("add_zhaopin_endtime");
		Date starttime = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Zhaopin zp = new Zhaopin();
		ZhaopinDao zpDao = new ZhaopinDao();
		zp.setEndTime(endtime);
		zp.setStartTime(sdf.format(starttime));
		zp.setTelphone(telphone);
		zp.setCompanyId(companyid);
		int id = zpDao.add(zp).getId();
		
		String name = request.getParameter("add_zw_name");
		String gongziSre = request.getParameter("add_zw_gongzi");
		int gongzi = Integer.parseInt(gongziSre);
		String xueli = request.getParameter("add_zw_xueli");
		String sex = request.getParameter("add_zw_sex");
		String ageStr = request.getParameter("add_zw_age");
		int age = Integer.parseInt(ageStr);
		String zhuanye = request.getParameter("add_zw_zhuanye");
		String renshuStr = request.getParameter("add_zw_renshu");
		int renshu = Integer.parseInt(renshuStr);
		String zige = request.getParameter("add_zw_zige");
		String zhize = request.getParameter("add_zw_zhize");
		Zhiwei zw = new Zhiwei();
		zw.setZhaopinId(id);
		zw.setZhiweiName(name);
		zw.setGongzi(gongzi);
		zw.setRenshu(renshu);
		zw.setZuidixueli(xueli);
		zw.setSex(sex);
		zw.setAge(age);
		zw.setZhuanye(zhuanye);
		zw.setZige(zige);
		zw.setZhize(zhize);
		ZhiweiDao zwDao = new ZhiweiDao();
		zwDao.add(zw);
		response.sendRedirect("zhiwei.jsp?currentPage=1");
	}
%>
