<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.zhaopin.dao.JianliDao"%>
<%@ page import="com.zhaopin.entity.Jianli"%>
<%@ page import="com.zhaopin.dao.ZhaopinDao"%>
<%@ page import="com.zhaopin.entity.Zhaopin"%>
<%@ page import="com.zhaopin.dao.ZhiweijianliDao"%>
<%@ page import="com.zhaopin.entity.Zhiweijianli"%>
<%@ page import="com.zhaopin.dao.ZhiweiDao"%>
<%@ page import="com.zhaopin.entity.Zhiwei"%>
<%@ page import="com.zhaopin.dao.CompanyDao"%>
<%@ page import="com.zhaopin.entity.Company"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/jquery.countdown.css" />
<link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>
<link href="css/font-awesome.css" rel="stylesheet"> 
<title>Insert title here</title>
<script>
$(document).ready(function(){

});

function select(){
	$("#modal-container-42315").modal();
}
</script>
</head>
<body>
<nav class="navbar nav_bottom" role="navigation">
	<div class="container">
    	<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
        	<ul class="nav navbar-nav nav_1">
            	<li><a href="company/jianli_info.jsp?currentPage=1">首页</a></li>
				<li><a href="company/myjianli_info.jsp?currentPage=1">投递我的</a></li>
           		<li><a href="company/zhiwei.jsp?currentPage=1">我的职位</a></li>
           		<li><a href="company/information.jsp">我的基本信息</a></li>
           		<li style = "margin-left:300px"><a href="company/jianli_info.jsp?currentPage=1&state=-300">注销</a></li>
        	</ul>
     	</div>
   	</div>
</nav>

<div class="courses_box1">
	<div class="container">
		<div class="col-md-12">
		<%
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		Jianli j = new Jianli();
		j.setId(id);
		JianliDao jDao = new JianliDao();
		j = jDao.select(j);
		%>
				<div class="panel-body">
					<div class="course_list">
						<div class="table-header clearfix">
							<div class="name_col">个人信息</div>
						</div>
						<ul class="table-list">
							<li class="clearfix" style="background:#DDDDDD">
								<div>姓名：<%=j.getName()%></div>
								<div>性别：<%=j.getSex()%></div>
								<div>年龄：<%=j.getAge()%></div>
							</li>
							<li class="clearfix" style="background:#DDDDDD">
								<div>生日：<%=j.getBirthday()%></div>
							</li>
							<li class="clearfix" style="background:#DDDDDD">
								<div>地址：<%=j.getAddress()%></div>
								<div>电话：<%=j.getTelphone()%></div>
							</li>
						</ul>
						<div class="table-header clearfix">
							<div class="name_col">学习情况</div>
						</div>
						<ul class="table-list">
							<li class="clearfix" style="background:#DDDDDD">
								<div>学校：<%=j.getSchool()%></div>
								<div>语言：<%=j.getLanguage()%></div>
							</li>
							<li class="clearfix" style="background:#DDDDDD">
								<div>学历：<%=j.getXueli()%></div>
								<div>专业：<%=j.getZhuanye()%></div>
								<div>最高学历：<%=j.getHxueli()%></div>
								<div>最高专业：<%=j.getHzhuanye()%></div>
							</li>
						</ul>
						<div class="table-header clearfix">
							<div class="name_col">职位意向</div>
						</div>
						<ul class="table-list">
							<li class="clearfix" style="background:#DDDDDD">
								<div>期望职位：<%=j.getJob()%></div>
								<div>期望工资：<%=j.getGongzi()%></div>
							</li>
						</ul>
						<div class="table-header clearfix">
							<div class="name_col">奖励情况</div>
						</div>
						<ul class="table-list">
							<li class="clearfix" style="background:#DDDDDD">
								<a href="<%=j.getJiangli()%>">下载奖励情况</a>
							</li>
						</ul>
						<div class="table-header clearfix">
							<div class="name_col">实践情况</div>
						</div>
						<ul class="table-list">
							<li class="clearfix" style="background:#DDDDDD">
								<a href="<%=j.getShijian()%>">下载实践情况</a>
							</li>
						</ul>
						<div class="table-header clearfix">
							<div class="name_col">自我评价</div>
						</div>
						<ul class="table-list">
							<li class="clearfix" style="background:#DDDDDD">
								<a href="<%=j.getPingjia()%>">下载自我评价</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
	</div>
</div>
</body>
</html>	