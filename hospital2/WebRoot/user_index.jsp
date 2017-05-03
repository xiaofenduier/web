<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hospital.entity.User"%>
<%@ page import="com.hospital.dao.UserDao"%>
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
</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
	var url = location.href; 
	state=url.split("=")[1];
	if (state >= 1){
		alert("操作成功");
	}
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
			<a class="navbar-brand" href="index.html">用户管理</a>
		</div>

		<div class="header-right">
		</div>
		</nav>
		<%
		User user = new User();
		Object idObj = request.getSession().getAttribute("id");
		if(idObj != null){
			int id = (int)idObj;
			UserDao userDao = new UserDao();
			user.setId(id);
			user = userDao.select(id);
		}
		%>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">
				<li>
					<div class="user-img-div">
						<div class="inner-text">
							<%=user.getRealname() %><br /> <small id ="now"></small>
						</div>
					</div>

				</li>


				<li><a class="active-menu" href="index.jsp"><i
						class="fa fa-dashboard "></i>首页</a></li>
				<li><a href="#"><i class="fa fa-desktop "></i>个人信息管理<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="user_info.jsp"><i
								class="fa fa-send "></i>修改个人信息</a></li>
						<li><a href="user_password.jsp"><i
								class="fa fa-coffee "></i>登录密码管理</a></li>
					</ul></li>
				<li><a href="#"><i class="fa fa-yelp "></i>挂号管理<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="guahao.jsp?currentPage=1"><i class="fa fa-coffee"></i>挂号管理</a>
						</li>
						<li><a href="guahao_persion.jsp?currentPage=1"><i class="fa fa-flash "></i>个人挂号信息</a>
						</li>
					</ul></li>
			</ul>

		</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h1 class="page-head-line" id = "login"></h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="footer-sec">
		&copy; 2014 YourCompany | More Templates <a
			href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
		- Collect from <a href="http://www.cssmoban.com/" title="网页模板"
			target="_blank">网页模板</a>
	</div>
	
	<!-- 登录 -->
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="modal fade" id="modal-container-985684" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<form role="form" action="loginDao.jsp?op=userlogin"
							method="post">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">登录</h4>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label>用户名</label> <input id="username" name="username"
											class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>密码</label> <input id="password" name="password"
											class="form-control" type="password">
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="submit" class="btn btn-primary">登录</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
