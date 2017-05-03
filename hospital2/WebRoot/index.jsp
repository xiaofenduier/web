<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
			<a class="navbar-brand" href="index.html">管理员首页</a>
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


				<li><a class="active-menu" href="index.jsp"><i
						class="fa fa-dashboard "></i>首页</a></li>
				<li><a href="#"><i class="fa fa-desktop "></i>科室管理<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="department_info.jsp?currentPage=1"><i
								class="fa fa-send "></i>科室信息管理</a></li>
						<li><a href="department_doctor.jsp"><i
								class="fa fa-send "></i>科室医生管理</a></li>
					</ul></li>
				<li><a href="#"><i class="fa fa-yelp "></i>人员管理<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="root_user_info.jsp?currentPage=1"><i class="fa fa-coffee"></i>注册用户管理</a>
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

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">

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
</body>
</html>
