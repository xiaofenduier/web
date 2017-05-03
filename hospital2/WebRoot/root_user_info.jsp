<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.hospital.dao.UserDao"%>
<%@ page import="com.hospital.entity.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- BOOTSTRAP STYLES-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!--CUSTOM BASIC STYLES-->
<link href="assets/css/basic.css" rel="stylesheet" />
<!--CUSTOM MAIN STYLES-->
<link href="assets/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<!-- JQUERY SCRIPTS -->
<script src="assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="assets/js/bootstrap.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="assets/js/custom.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		 var show = document.getElementById("now"); 
		 setInterval(function() {    
			var time = new Date();    
		 	var m = time.getMonth() + 1; 
		 	var d = time.getDate();
		 	var h = time.getHours();
		 	var minute = time.getMinutes();
		 	var s = time.getSeconds();
		 	if(m < 10){
		 		m = "0"+m;
		 	}
		 	if(d < 10){
		 		d = "0" + d;
		 	}
		 	if(h < 10){
		 		h = "0" + h;
		 	}
		 	if(minute < 10){
		 		minute = "0" + minute;
		 	}
		 	if(s < 10){
		 		s = "0" + s;
		 	}
		 	var t = time.getFullYear() + "-" + m + "-" + d + " " + m + ":" + minute + ":" + s;  
		 	show.innerHTML = t; 
		 }, 1000); 
	});
</script>

</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-cls-top " role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".sidebar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">注册用户管理</a>
		</div>

		<div class="header-right">
		</div>
		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">
				<li>
					<div class="user-img-div">
						<div class="inner-text">
							管理员 <br /> <small id = "now"></small>
						</div>
					</div>

				</li>


				<li><a href="index.jsp"><i
						class="fa fa-dashboard "></i>首页</a></li>
				<li><a href="#"><i class="fa fa-desktop "></i>科室管理<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="department_info.jsp?currentPage=1"><i
								class="fa fa-send "></i>科室信息管理</a></li>
						<li><a href="department_doctor.jsp?currentPage=1"><i
								class="fa fa-send "></i>科室医生管理</a></li>
					</ul></li>
				<li><a href="#" class="active-menu-top"><i class="fa fa-yelp "></i>人员管理<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse in">
						<li><a class="active-menu" href="root_user_info.jsp?currentPage=1"><i class="fa fa-coffee"></i>注册用户管理</a>
						</li>
						<li><a href="doctor_info.jsp?currentPage=1"><i class="fa fa-flash "></i>医生信息管理</a>
						</li>
						<li><a href="root_password.jsp"><i class="fa fa-key "></i>管理员密码管理</a>
						</li>
						<li><a href="root_addroot.jsp"><i class="fa fa-send "></i>增加管理员信息</a>
						</li>
					</ul></li>
				<li><a href="root_guahao.jsp?currentPage=1"><i class="fa fa-flash "></i>挂号信息管理</a></li>
			</ul>

		</div>
		<%
			String curPage = request.getParameter("currentPage");
			int currentPage = Integer.parseInt(curPage);
			int pageSize = 5; /* 每页显示行数 */
			UserDao userDao = new UserDao();
			Map<String, Object> map = new HashMap<String, Object>();
			User user = new User();
			map = userDao.selectList(user, currentPage, pageSize);
			List<User> list = new ArrayList<User>();
			list = (List<User>) map.get("data");
			int pageCount = (Integer) map.get("pageCount");
		%> 
		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">

				<div class="row">
					<div class="col-md-12">
						<div class="panel-heading">
							<h3>科室信息</h3>
						</div>
						</button>
						<!-- Table -->
						<table class="table">
							<thead>
								<tr>
									<th>编号</th>
									<th>用户名</th>
									<th>姓名</th>
									<th>性别</th>
									<th>年龄</th>
									<th>电话</th>
									<th>邮箱</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (User u : list) {
										int sex = u.getSex();
										String sexStr = "";
										if(sex == 1){
											sexStr = "男";
										}else{
											sexStr = "女";
										}
								%>
								<tr class="list-group-item-success">
									<td><%=u.getId()%></td>
									<td><%=u.getUsername()%></td>
									<td><%=u.getRealname()%></td>
									<td><%=sexStr%></td>
									<td><%=u.getAge()%></td>
									<td><%=u.getTelphone()%></td>
									<td><%=u.getEmail()%></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
						<ul class="pagination">
							<%
								if (pageCount <= 5) {
									for (int i = 1; i <= pageCount; i++) {
							%>
							<li><a href="user_info.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
								}
								if (pageCount > 5) {
									if (currentPage > 1) {
							%>
							<li><a
								href="user_info.jsp?currentPage=<%=currentPage - 1%>">&laquo;</a></li>
							<%
								}
							%>
							<%
								for (int i = 1; i <= 5; i++) {
							%>
							<li><a href="user_info.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
									if (currentPage < pageCount) {
							%>
							<li><a
								href="user_info.jsp?currentPage=<%=currentPage + 1%>">&raquo;</a></li>
							<%
								}
								}
							%>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	</div>

	<div id="footer-sec">
	</div>

</body>
</html>
