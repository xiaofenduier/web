<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.hospital.dao.DepartmentDao"%>
<%@ page import="com.hospital.entity.Department"%>
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
	function update(id, name, telphone, introduce) {
		$("#modal-container-985683").modal();
		$("#id").val(id);
		$("#name").val(name);
		$("#introduce").val(introduce);
		$("#telphone").val(telphone);
	/* $("#modal-container-985683").modal("toggle"); */
	}
	function del(id) {
		$("#modal-container-937765").modal();
		$("#delete_id").val(id);
	}
	function add(id) {
		$("#modal-container-985684").modal();
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
			<a class="navbar-brand" href="index.html">科室信息管理</a>
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
				<li><a href="#" class="active-menu-top"><i class="fa fa-desktop "></i>科室管理<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse in">
						<li><a class="active-menu" href="department_info.jsp?currentPage=1"><i
								class="fa fa-send "></i>科室信息管理</a></li>
						<li><a href="department_doctor.jsp?currentPage=1"><i
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
		<%
			String curPage = request.getParameter("currentPage");
			int currentPage = Integer.parseInt(curPage);
			int pageSize = 5; /* 每页显示行数 */
			DepartmentDao departmentDao = new DepartmentDao();
			Map<String, Object> map = new HashMap<String, Object>();
			Department department = new Department();
			map = departmentDao.selectList(department, currentPage, pageSize);
			List<Department> list = new ArrayList<Department>();
			list = (List<Department>) map.get("data");
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
							<button class="btn btn-inverse" onclick = "add()">
								<i class="glyphicon glyphicon-plus"></i>新加
						</div>
						</button>
						<!-- Table -->
						<table class="table">
							<thead>
								<tr>
									<th>编号</th>
									<th>科室名称</th>
									<th>科室电话</th>
									<th>科室介绍</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (Department d : list) {
								%>
								<tr class="list-group-item-success">
									<td><%=d.getId()%></td>
									<td><%=d.getName()%></td>
									<td><%=d.getTelphone()%></td>
									<td><%=d.getIntroduce()%></td>
									<td>
										<button class="btn btn-primary"
											onclick="update(<%=d.getId()%>,'<%=d.getName()%>','<%=d.getTelphone()%>','<%=d.getIntroduce()%>')">
											<i class="glyphicon glyphicon-search"></i>修改
										</button>
										<button class="btn btn-danger" onclick="del(<%=d.getId()%>)">
											<i class="glyphicon glyphicon-home"></i>删除
										</button>
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
							<li><a href="department_info.jsp?currentPage=<%=i%>"><%=i%></a></li>
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
							<%
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

	<!-- 新增窗体 -->
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="modal fade" id="modal-container-985684" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<form role="form" action="departmentDao.jsp?op=add"
							method="post">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">新增科室信息</h4>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label>科室名称</label> <input id="add_name" name="add_name"
											class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>科室电话</label> <input id="add_telphone" name="add_telphone"
											class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>科室简介</label> <input id="add_introduce" name="add_introduce"
											class="form-control" type="text">
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

	<!-- 修改窗体 -->
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="modal fade" id="modal-container-985683" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<form role="form" action="departmentDao.jsp?op=update"
							method="post">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">修改科室信息</h4>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label>科室编号</label> <input id="id" name="id"
											class="form-control" readonly type="text">
									</div>
									<div class="form-group">
										<label>科室名称</label> <input id="name" name="name"
											class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>科室电话</label> <input id="telphone" name="telphone"
											class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>科室简介</label> <input id="introduce" name="introduce"
											class="form-control" type="text">
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
