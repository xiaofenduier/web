<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8" %>
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
<!--WIZARD STYLES-->
<link href="assets/css/wizard/normalize.css" rel="stylesheet" />
<link href="assets/css/wizard/wizardMain.css" rel="stylesheet" />
<link href="assets/css/wizard/jquery.steps.css" rel="stylesheet" />
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
<!-- WIZARD SCRIPTS -->
<script src="assets/js/wizard/modernizr-2.6.2.min.js"></script>
<script src="assets/js/wizard/jquery.cookie-1.3.1.js"></script>
<script src="assets/js/wizard/jquery.steps.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="assets/js/custom.js"></script>

</head>
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
<body>
	<%
		String departId = request.getParameter("departId");
		Doctor doctor = new Doctor();
		doctor.setDepartmentId(Integer.parseInt(departId));
		List<Doctor> doctorList = new ArrayList<Doctor>();
		DoctorDao doctorDao = new DoctorDao();
		doctorList = doctorDao.select4List(doctor);
	%>
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
			<a class="navbar-brand" href="index.html">挂号管理</a>
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
							<%=user.getRealname() %> <br /> <small id = "now"></small>
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
						<h1 class="page-head-line">科室医生</h1>
						<div class="panel-body">
							<div class="panel panel-default">
								<div class="panel-heading"><a href = "guahao.jsp">返回科室</a></div>
								<div class="panel-body">
									<div id="wizard">
										<%
											for (Doctor d : doctorList) {
												String time = d.getTime();
												String[] timeArr = time.split(",");
												String money = "";
												String levelStr = "";
												int level = d.getLevel();
												if(level == 1){
													levelStr = "医师";
													money = "10元";
												}else{
													levelStr = "专家";
													money = "20元";
												}
										%>
										<h2><%=d.getName()%></h2>
										<section>
										<p>
											<img alt="" src="<%=d.getPic()%>"> 
											<br/>
											医生职称：<%=levelStr%>
											<br/>
											挂号费：<%=money %>
											<br/>
											医生介绍：<%=d.getIntroduce()%>
											<br/>
											出诊时间：<%=d.getTime()%>
											<br/>
											已挂号人数：<%=1%>
										</p>
										<p>
										<div class="container">
											<div class="row clearfix">
												<div class="col-md-12 column">
													<a id="modal-169374" href="#modal-container-169374-<%=d.getId() %>"
														role="button" class="btn" data-toggle="modal">预约</a>
													<div class="modal fade" id="modal-container-169374-<%=d.getId()%>"
														role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close"
																		data-dismiss="modal" aria-hidden="true">×</button>
																	<h4 class="modal-title" id="myModalLabel">预约挂号</h4>
																</div>
																<form action="guahao_doctorDao.jsp" method="post">
																<div class="modal-body">
																		<div class="form-group">
																			<input id="id" name="id" class="form-control"
																				type="hidden" value="<%=d.getId()%>">
																		</div>
																		<div class="form-group">
																			<input id="departmentid" name="departmentid" class="form-control"
																				type="hidden" value="<%=d.getDepartmentId()%>">
																		</div>
																		<div class="form-group">
																			<label>医生姓名</label> <input id="name" name="name"
																				class="form-control" type="text"
																				value="<%=d.getName()%>">
																		</div>
																</div>
																<div class="modal-body">
																	<label>预约时间</label> <select class="form-control"
																		id="time" name="time">
																		<%
																			for (int i = 0; i < timeArr.length; i++) {
																		%>
																		<option value="<%=timeArr[i]%>"><%=timeArr[i]%></option>
																		<%
																			}
																		%>
																	</select>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-default"
																		data-dismiss="modal">关闭</button>
																	<button type="submit" class="btn btn-primary">保存</button>
																</div>
																</form>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										</p>
										</section>
										<%
											}
										%>
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
