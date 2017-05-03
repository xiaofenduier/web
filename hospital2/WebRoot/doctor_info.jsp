<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="com.hospital.dao.DoctorDao"%>
<%@ page import="com.hospital.dao.DepartmentDao"%>
<%@ page import="com.hospital.entity.Doctor"%>
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
<link href="assets/css/fileinput.css" media="all" rel="stylesheet"
	type="text/css" />
<script src="assets/js/sortable.js" type="text/javascript"></script>
<script src="assets/js/fileinput.js" type="text/javascript"></script>

<script type="text/javascript">
	function update(id, name, password, sex, level, departmentid, introduce, time) {
		$("#modal-container-985683").modal();
		$("#id").val(id);
		$("#name").val(name);
		$("#introduce").val(introduce);
		$("#password").val(password);
		$("#sex").val(sex);
		$("#level").val(level);
		$("#departmentid").val(departmentid);
		$("#time").val(time);
		$("#sex").val(sex);
		$("#level").val(level);
		$("#departmentid").val(departmentid);
	/* $("#modal-container-985683").modal("toggle"); */
	}
	function del(id) {
		$("#modal-container-937765").modal();
		$("#delete_id").val(id);
	}
	function add(id) {
		$("#modal-container-985684").modal();
	}

	function initFileInput(ctrlName, uploadUrl) {
		var control = $('#' + ctrlName);
		control.fileinput({
			resizeImage : true,
			maxImageWidth : 200,
			maxImageHeight : 200,
			resizePreference : 'width',
			language : 'zh', //设置语言  
			uploadUrl : uploadUrl,
			uploadAsync : true,
			allowedFileExtensions : [ 'jpg', 'png', 'gif' ], //接收的文件后缀  
			showUpload : true, //是否显示上传按钮  
			showCaption : true, //是否显示标题  
			browseClass : "btn btn-primary", //按钮样式  
			previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",
			maxFileCount : 3,
			msgFilesTooMany : "选择图片超过了最大数量",
			maxFileSize : 20000,
		});
	}
	;
	$(document).ready(function() {
		//初始化控件initFileInput(id,uploadurl)控件id，与上传路径  
		initFileInput("file", "doctorDao.jsp?op=uploadpic");
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
			<a class="navbar-brand" href="index.html">医生信息管理</a>
		</div>

		<div class="header-right"></div>
		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">
				<li>
					<div class="user-img-div">
						<div class="inner-text">
							管理员 <br /> <small id="now"> </small>
						</div>
					</div>

				</li>


				<li><a href="index.jsp"><i class="fa fa-dashboard "></i>首页</a></li>
				<li><a href="#"><i class="fa fa-desktop "></i>科室管理<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="department_info.jsp?currentPage=1"><i
								class="fa fa-send "></i>科室信息管理</a></li>
						<li><a href="department_doctor.jsp?currentPage=1"><i
								class="fa fa-send "></i>科室医生管理</a></li>
					</ul></li>
				<li><a href="#" class="active-menu-top"><i
						class="fa fa-yelp "></i>人员管理<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse in">
						<li><a href="root_user_info.jsp?currentPage=1"><i
								class="fa fa-coffee"></i>注册用户管理</a></li>
						<li><a class="active-menu"
							href="doctor_info.jsp?currentPage=1"><i class="fa fa-flash "></i>医生信息管理</a>
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
			DoctorDao doctorDao = new DoctorDao();
			Map<String, Object> map = new HashMap<String, Object>();
			Doctor doctor = new Doctor();
			map = doctorDao.selectList(doctor, currentPage, pageSize);
			List<Doctor> list = new ArrayList<Doctor>();
			list = (List<Doctor>) map.get("data");
			int pageCount = (Integer) map.get("pageCount");
			DepartmentDao departmentDao = new DepartmentDao();
		%> </nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<div class="panel-heading">
							<h3>医生信息</h3>
							<dl class="dl-horizontal">
							<dt>
							<button class="btn btn-inverse" onclick="add()">
								<i class="glyphicon glyphicon-plus"></i>新加
							</button></dt>
							<dd>
							<form action="doctor_info_search.jsp" method = "post">
							<div class="input-group" style = "width:300px">
								<input type="text" class="form-control" placeholder = "医生编号" id = "doc_id" name = "doc_id"/> <span
									class="form-group input-group-btn">
									<button class="btn btn-default" type="submit">搜索</button>
								</span>
							</div>
							</form>
							</dd>
							</dl>
						</div>
						</button>
						<!-- Table -->
						<table class="table">
							<thead>
								<tr>
									<th>编号</th>
									<th>医生姓名</th>
									<th>医生密码</th>
									<th>医生性别</th>
									<th>医生等级</th>
									<th>所属科室</th>
									<th>医生简介</th>
									<th>出诊时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (Doctor d : list) {
										String sexStr = "";
										String levelStr = "";
										int sex = d.getSex();
										int level = d.getLevel();
										if (sex == 1) {
											sexStr = "男";
										}
										if (sex == 2) {
											sexStr = "女";
										}
										if (level == 1) {
											levelStr = "医师";
										}
										if (level == 2) {
											levelStr = "专家";
										}
								%>
								<tr class="list-group-item-success">
									<td><%=d.getId()%></td>
									<td><%=d.getName()%></td>
									<td><%=d.getPassword()%></td>
									<td><%=sexStr%></td>
									<td><%=levelStr%></td>
									<td><%=d.getDepartment().getName()%></td>
									<td><%=d.getIntroduce()%></td>
									<td><%=d.getTime()%></td>
									<td>
										<button class="btn btn-primary"
											onclick="update(<%=d.getId()%>,'<%=d.getName()%>','<%=d.getPassword()%>',<%=d.getSex()%>,<%=d.getLevel()%>,<%=d.getDepartmentId()%>,'<%=d.getIntroduce()%>','<%=d.getTime()%>')">
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
							<li><a href="doctor_info.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
								}
								if (pageCount > 5) {
									if (currentPage > 1) {
							%>
							<li><a
								href="doctor_info.jsp?currentPage=<%=currentPage - 1%>">&laquo;</a></li>
							<%
								}
							%>
							<%
								for (int i = 1; i <= 5; i++) {
							%>
							<li><a href="doctor_info.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
									if (currentPage < pageCount) {
							%>
							<li><a
								href="doctor_info.jsp?currentPage=<%=currentPage + 1%>">&raquo;</a></li>
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
						<form role="form" action="doctorDao.jsp?op=add" method="post">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">新增医生信息</h4>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label>医生姓名</label> <input id="add_name" name="add_name"
											class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>医生密码</label> <input id="add_password"
											name="add_password" class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>医生性别</label> <select class="form-control" id="add_sex"
											name="add_sex">
											<option value="1">男</option>
											<option value="2">女</option>
										</select>
									</div>
									<div class="form-group">
										<label>医生等级</label> <select class="form-control"
											id="add_level" name="add_level">
											<option value="1">医师,挂号费10元</option>
											<option value="2">专家,挂号费20元</option>
										</select>
									</div>
									<div class="form-group">
										<label>所属科室</label> <select class="form-control"
											id="add_departmentid" name="add_departmentid">
											<%
												List<Department> departmentList = new ArrayList<Department>();
												departmentList = departmentDao.selectall();
												for (Department depart : departmentList) {
											%>
											<option value="<%=depart.getId()%>"><%=depart.getName()%></option>
											<%
												}
											%>
										</select>
									</div>
									<div class="form-group">
										<label>医生简介</label> <input id="add_introduce"
											name="add_introduce" class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>医生照片</label> <input id="file" name="add_pic"
											type="file" multiple>
									</div>
									<div class="form-group">
										<label>出诊时间</label> 
										<select class="form-control" id="add_time" name="add_time">
											<option value="0.0">全选</option>
											<option value="1.0">周日上午</option>
											<option value="1.5">周日下午</option>
											<option value="2.0">周一上午</option>
											<option value="2.5">周一下午</option>
											<option value="3.0">周二上午</option>
											<option value="3.5">周二下午</option>
											<option value="4.0">周三上午</option>
											<option value="4.5">周三下午</option>
											<option value="5.0">周四上午</option>
											<option value="5.5">周四下午</option>
											<option value="6.0">周五上午</option>
											<option value="6.5">周五下午</option>
											<option value="7.0">周六上午</option>
											<option value="7.5">周六下午</option>
											<option value="0.0">重选</option>
										</select>
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
						<form role="form" action="doctorDao.jsp?op=update" method="post">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">修改医生信息</h4>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label>医生编号</label> <input id="id" name="id"
											class="form-control" type="text" readonly>
									</div>
									<div class="form-group">
										<label>医生姓名</label> <input id="name" name="name"
											class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>医生密码</label> <input id="password" name="password"
											class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>医生性别</label> <select class="form-control" id="sex"
											name="sex">
											<option value="1">男</option>
											<option value="2">女</option>
										</select>
									</div>
									<div class="form-group">
										<label>医生等级</label> <select class="form-control" id="level"
											name="level">
											<option value="1">医师</option>
											<option value="2">专家</option>
										</select>
									</div>
									<div class="form-group">
										<label>所属科室</label> <select class="form-control"
											id="departmentid" name="departmentid">
											<%
												for (Department depart : departmentList) {
											%>
											<option value="<%=depart.getId()%>"><%=depart.getName()%></option>
											<%
												}
											%>
										</select>
									</div>
									<div class="form-group">
										<label>医生简介</label> <input id="introduce" name="introduce"
											class="form-control" type="text">
									</div>
									<div class="form-group">
										<label>出诊时间</label> <input id="time" name="time"
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
						<form role="form" action="doctorDao.jsp?op=delete" method="post">
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
