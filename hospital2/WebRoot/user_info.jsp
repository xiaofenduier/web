<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hospital.dao.UserDao"%>
<%@ page import="com.hospital.entity.User"%>
<%@ page import="com.hospital.entity.Doctor"%>
<%@ page import="com.hospital.dao.DoctorDao"%>
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
<link href="assets/css/fileinput.css" media="all" rel="stylesheet"
	type="text/css" />
<script src="assets/js/sortable.js" type="text/javascript"></script>
<script src="assets/js/fileinput.js" type="text/javascript"></script>
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
			<a class="navbar-brand" href="index.html">个人信息管理</a>
		</div>

		<div class="header-right">

		</div>
		</nav>
		<%
		User uu = new User();
		Object idObj = request.getSession().getAttribute("id");
		if(idObj != null){
			int id = (int)idObj;
			UserDao userDao = new UserDao();
			uu.setId(id);
			uu = userDao.select(id);
		}
		%>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">
				<li>
					<div class="user-img-div">
						<div class="inner-text">
							<%=uu.getRealname()%> <br /> <small id = "now"></small>
						</div>
					</div>

				</li>


				<li><a href="user_index.jsp"><i class="fa fa-dashboard "></i>首页</a></li>
				<li><a href="#" class="active-menu-top"><i
						class="fa fa-desktop "></i>个人信息管理<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse in">
						<li><a class="active-menu" href="user_info.jsp"><i
								class="fa fa-send "></i>修改个人信息</a></li>
						<li><a href="user_password.jsp"><i class="fa fa-coffee "></i>登录密码管理</a></li>
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
		<%
			int id = (int)request.getSession().getAttribute("id");
			UserDao userDao = new UserDao();
			User user = new User();
			user.setId(id);
			Map<String, Object> map = new HashMap<String, Object>();
			map = userDao.selectList(user, 1, 1);
			List<User> list = new ArrayList<User>();
			user = ((List<User>) map.get("data")).get(0);
		%> </nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<div class="panel-heading">
							<h3>用户信息</h3>
						</div>
							<div class="modal-dialog">
								<form role="form" action="userDao.jsp?op=update" method="post">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button>
											<h4 class="modal-title" id="myModalLabel">修改个人信息</h4>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<label>用户姓名</label> <input id="realname" name="realname"
													class="form-control" type="text" placeholder = <%=user.getRealname() %>>
											</div>
											<div class="form-group">
												<label>登录账号</label> <input id="username" name="username"
													class="form-control" type="text" placeholder = <%=user.getUsername() %>>
											</div>
											<div class="form-group">
												<label>用户性别</label> <select class="form-control" id="sex"
													name="sex">
													<%if(user.getSex() == 1){ %>
													<option value="1" selected = "selected">男</option>
													<option value="2">女</option>
													<%}else{ %>
													<option value="1">男</option>
													<option value="2" selected = "selected">女</option>
													<%} %>
												</select>
											</div>
											<div class="form-group">
												<label>用户年龄</label> <input id="age" name="age"
													class="form-control" type="text" placeholder = <%=user.getAge() %>>
											</div>
											<div class="form-group">
												<label>联系方式</label> <input id="telphone" name="telphone"
													class="form-control" type="text" placeholder = <%=user.getTelphone() %>>
											</div>
											<div class="form-group">
												<label>邮箱</label> <input id="email" name="email"
													class="form-control" type="text" placeholder = <%=user.getEmail() %>>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">关闭</button>
											<button type="submit" class="btn btn-primary">保存</button>
										</div>
									</div>
								</form>
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
