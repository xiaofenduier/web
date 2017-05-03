<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hospital.dao.DepartmentDao"%>
<%@ page import="com.hospital.entity.Department"%>
<%@ page import="com.hospital.entity.Doctor"%>
<%@ page import="com.hospital.dao.DoctorDao"%>
<%@ page import="com.hospital.entity.User"%>
<%@ page import="com.hospital.dao.UserDao"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
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

<script type="text/javascript">
	function update(id, name, introduce, telphone) {
		$("#modal-container-985683").modal();
		$("#id").val(id);
		$("#name").val(name);
		$("#introduce").val(introduce);
		$("#telphone").val(telphone);
		/* $("#modal-container-985683").modal("toggle"); */
	}
	function del(id) {
		alert(id);
		$("#modal-container-937765").modal();
		$("#delete_id").val(id);
	}
	function add(id) {
		$("#modal-container-985684").modal();
	}
	function todoctor(id){
		location.href = "guahao_doctor.jsp?departmentid="+id;
	}
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
			<a class="navbar-brand" href="index.html">挂号管理</a>
		</div>

		<div class="header-right">

		</div>
		</nav>
		<%
		UserDao ddDao = new UserDao();
		User uu = new User();
		Object idObj = request.getSession().getAttribute("id");
		if(idObj != null){
			int id = (int)idObj;
			uu = ddDao.select(id);
		}else{
			response.sendRedirect("user_index.jsp?state=-1");
		}
		%>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">
				<li>
					<div class="user-img-div">
						<div class="inner-text">
							<%=uu.getRealname()%><br /> <small id = "now"></small>
						</div>
					</div>

				</li>


				<li><a href="user_index.jsp"><i class="fa fa-dashboard "></i>首页</a></li>
				<li><a href="#"><i class="fa fa-desktop "></i>个人信息管理<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="user_info.jsp"><i class="fa fa-send "></i>修改个人信息</a></li>
						<li><a href="user_password.jsp"><i class="fa fa-coffee "></i>登录密码管理</a></li>
					</ul></li>
				<li><a href="#" class="active-menu-top"><i
						class="fa fa-yelp "></i>挂号管理<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse in">
						<li><a class="active-menu" href="guahao.jsp"><i
								class="fa fa-coffee"></i>挂号管理</a></li>
						<li><a href="guahao_persion.jsp?currentPage=1"><i
								class="fa fa-flash "></i>个人挂号信息</a></li>
					</ul></li>
			</ul>

		</div>
		<%
			DepartmentDao departmentDao = new DepartmentDao();
			Map<String, Object> map = new HashMap<String, Object>();
			Department department = new Department();
			map = departmentDao.selectList(department, 1, 100);
			List<Department> list = new ArrayList<Department>();
			list = (List<Department>) map.get("data");
		%> </nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h1 class="page-head-line">挂号管理</h1>
						<div class="panel-body">
							<div class="panel-group" id="accordion">
							<%for(Department depart : list){ 
									int departmentId = depart.getId();
									Doctor doctor = new Doctor();
									doctor.setDepartmentId(departmentId);
									List<Doctor> doctorList = new ArrayList<Doctor>();
									DoctorDao doctorDao = new DoctorDao();
									doctorList = doctorDao.select4List(doctor);
							%>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#<%=depart.getId() %>" class="collapsed"><%=depart.getName() %>
											</a>
											<form method = "post" action = "guahao_doctor.jsp">
													<input id = "departId" name = "departId" type = "hidden" value = "<%=depart.getId()%>">
													<button type="submit" class="btn btn-lg btn-success" style = "margin-left:1000px">进入</button>
											</form>
										</h4>
									</div>
									<div id="<%=depart.getId()%>" class="panel-collapse collapse"
										style="height: 0px;">
										<div class="panel-body">
											<%=depart.getIntroduce() %>
										</div>
									</div>
								</div>
								<%} %>
							</div>
						</div>
						<%-- <div class="panel panel-default">
							<div class="panel-heading">科室-医生</div>
							<div class="panel-body">
								<div id="wizard">
								<%for(Department depart : list){ 
									int departmentId = depart.getId();
									Doctor doctor = new Doctor();
									doctor.setDepartmentId(departmentId);
									List<Doctor> doctorList = new ArrayList<Doctor>();
									DoctorDao doctorDao = new DoctorDao();
									doctorList = doctorDao.select4List(doctor);
								%>
									<h2><%=depart.getName() %></h2>
									<section>
									<p>
                                <%
                                int i = 0;
                                for(Doctor d : doctorList){
                                %>
                                    <img src="<%=d.getPic() %>" alt="" />
                                    <%=d.getIntroduce() %>
                                    <%} %>
									</p>
									</section>
								<%} %>
							</div>
						</div>
					</div> --%>
					</div>
				</div>
			</div>
		</div>

		<div id="footer-sec">
		</div>
</body>
</html>
