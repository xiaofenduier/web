<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	function check() {
		var pswword = $("#new_password").val();
		var password2 = $("#new_password2").val();
		if (pswword != password2) {
			alert("两次密码不一致");
		}
	}
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
			<a class="navbar-brand" href="index.html">个人信息管理</a>
		</div>

		<div class="header-right">

		</div>
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
		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">
				<li>
					<div class="user-img-div">
						<img src="assets/img/user.png" class="img-thumbnail" />

						<div class="inner-text">
							<%=user.getRealname() %> <br /> <small id = "now"></small>
						</div>
					</div>

				</li>


				<li><a href="user_index.jsp"><i class="fa fa-dashboard "></i>首页</a></li>
				<li><a href="#"><i class="fa fa-desktop "></i>科室管理<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="department_info.jsp?currentPage=1"><i
								class="fa fa-send "></i>科室信息管理</a></li>
						<li><a href="department_doctor.jsp"><i
								class="fa fa-send "></i>科室医生管理</a></li>
					</ul></li>
				<li><a href="#" class="active-menu-top"><i
						class="fa fa-yelp "></i>人员管理<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse in">
						<li><a href="user_info.jsp?currentPage=1"><i class="fa fa-coffee"></i>注册用户管理</a>
						</li>
						<li><a class="active-menu"
							href="doctor_info.jsp?currentPage=1"><i class="fa fa-flash "></i>医生信息管理</a>
						</li>
						<li><a href="root_password.jsp"><i class="fa fa-key "></i>管理员密码管理</a>
						</li>
					</ul></li>
				<li><a href="guahao.jsp"><i class="fa fa-flash "></i>挂号信息管理</a></li>
			</ul>

		</div>
		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<!-- Table -->
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="panel panel-danger">
							<div class="panel-heading">修改密码</div>
							<div class="panel-body">
								<form role="form" method="post"
									action="userDao.jsp?op=updatepassword">
									<div class="form-group">
										<label>新密码</label> <input class="form-control" type="password"
											id="new_password" name="new_password">
									</div>
									<div class="form-group">
										<label>确认密码</label> <input class="form-control"
											type="password" id="new_password2" name="new_password2"
											onblur="check()">
									</div>
									<button type="submit" class="btn btn-danger">确认</button>
								</form>
							</div>
						</div>
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
