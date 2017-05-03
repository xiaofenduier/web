<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hospital.dao.UserDao"%>
<%@ page import="com.hospital.entity.User"%>
<%@ page import="com.hospital.dao.GuahaoDao"%>
<%@ page import="com.hospital.entity.Guahao"%>
<%@ page import="com.hospital.dao.DoctorDao"%>
<%@ page import="com.hospital.entity.Doctor"%>
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
			<a class="navbar-brand" href="index.html">医生挂号信息</a>
		</div>

		<div class="header-right">

		</div>
		</nav>
		<%
		Doctor doctor = new Doctor();
		Object idObj = request.getSession().getAttribute("id");
		if(idObj != null){
			int id = (int)idObj;
		DoctorDao doctorDao = new DoctorDao();
		doctor.setId(id);
		doctor = doctorDao.select(doctor);
		}
		%>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">
				<li>
					<div class="user-img-div">
						<div class="inner-text">
							<%=doctor.getName() %><br /> <small id = "now"></small>
						</div>
					</div>

				</li>

				<li><a href="doctormanage_doctor_index.jsp"><i
						class="fa fa-dashboard "></i>首页</a></li>
				<li><a href="doctormanage_doctor_password.jsp"><i class="fa fa-desktop "></i>登录密码管理</a>
				</li>
				<li><a class="active-menu" href="doctormanage_guahao_info.jsp?currentPage=1"><i class="fa fa-yelp "></i>查看就诊信息</a>
				</li>
			</ul>
		</div>
		<%	int id = (int)request.getSession().getAttribute("id");
			String curPage = request.getParameter("currentPage");
			int currentPage = Integer.parseInt(curPage);
			int pageSize = 5; /* 每页显示行数 */
			GuahaoDao guahaoDao = new GuahaoDao();
			Map<String, Object> map = new HashMap<String, Object>();
			Guahao guahao = new Guahao();
			guahao.setDoctorId(id);
			map = guahaoDao.selectList(guahao, currentPage, pageSize);
			List<Guahao> list = new ArrayList<Guahao>();
			list = (List<Guahao>) map.get("data");
			int pageCount = (Integer) map.get("pageCount");
		%> </nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">

				<div class="row">
					<div class="col-md-12">
						<div class="panel-heading">
							<h3>患者信息</h3>
						</div>
						</button>
						<!-- Table -->
						<table class="table">
							<thead>
								<tr>
									<th>编号</th>
									<th>患者姓名</th>
									<th>患者性别</th>
									<th>患者年龄</th>
									<th>患者电话</th>
									<th>患者邮箱</th>
									<th>预约时间</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (Guahao g : list) {
										User user = new User();
										int userid = g.getUserid();
										UserDao userDao = new UserDao();
										user = userDao.select(userid);
								%>
								<tr class="list-group-item-success">
									<td><%=g.getId()%></td>
									<td><%=user.getRealname()%></td>
									<td><%=user.getSex()%></td>
									<td><%=user.getAge()%></td>
									<td><%=user.getTelphone()%></td>
									<td><%=user.getEmail()%></td>
									<td><%=g.getTime()%></td>
									<td><%=g.getState()%></td>
									<td>
									<form action="doctormanage_doctorDao.jsp">
										<button class="btn btn-danger" type = "submit">
											<i class="glyphicon glyphicon-home"></i>就诊
										</button>
									</form>
									</td>
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
							<li><a href="doctormanage_guhao_info.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
								}
								if (pageCount > 5) {
									if (currentPage > 1) {
							%>
							<li><a
								href="department_info.jsp?currentPage=<%=currentPage - 1%>">&laquo;</a></li>
							<%
								}
							%>
							s<%
								for (int i = 1; i <= 5; i++) {
							%>
							<li><a href="department_info.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
									if (currentPage < pageCount) {
							%>
							<li><a
								href="department_info.jsp?currentPage=<%=currentPage + 1%>">&raquo;</a></li>
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

	<!-- 删除窗体 -->
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="modal fade" id="modal-container-937765" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<form role="form" action="departmentDao.jsp?op=delete"
							method="post">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">删除</h4>
								</div>
								<div class="modal-body">
									确认删除？
									<div class="form-group">
										<input id="delete_id" name="delete_id" class="form-control"
											type="hidden">
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="submit" class="btn btn-primary">确认</button>
								</div>
							</div>
						</form>
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
