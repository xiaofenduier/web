<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="com.zhaopin.dao.JianliDao"%>
<%@ page import="com.zhaopin.entity.Jianli"%>
<%@ page import="com.zhaopin.dao.UserDao"%>
<%@ page import="com.zhaopin.entity.User"%>
<%@ page import="com.zhaopin.dao.ZhaopinDao"%>
<%@ page import="com.zhaopin.entity.Zhaopin"%>
<%@ page import="com.zhaopin.dao.CompanyDao"%>
<%@ page import="com.zhaopin.entity.Company"%>
<%@ page import="com.zhaopin.dao.ZhiweiDao"%>
<%@ page import="com.zhaopin.entity.Zhiwei"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="css/bootstrap-theme.min.css" rel='stylesheet'
	type='text/css' />
<link href="css/templatemo_main.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/jquery.countdown.css" />
<link
	href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700'
	rel='stylesheet' type='text/css'>
<link href="css/font-awesome.css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/moment-with-locales.min.js"></script>

<link href="css/fileinput.css" media="all" rel="stylesheet"
	type="text/css" />
<script src="js/sortable.js" type="text/javascript"></script>
<script src="js/fileinput.js" type="text/javascript"></script>
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
function deljianli(id){
	$("#modal-container-770346").modal();
	$("#del_id").val(id);
}
function updatejianli(id, name ,sex, age, birthday, passport, address, telphone, school, xueli, zhuanye, hxueli, hzhuanye, language, job, gongzi, jiangli, shijian, pingjia){
	$("#modal-container-770347").modal();
	$("#update_id").val(id);
	$("#update_name").val(name);
	$("#update_sex").val(sex);
	$("#update_age").val(age);
	$("#update_birthday").val(birthday);
	$("#update_passport").val(passport);
	$("#update_address").val(address);
	$("#update_telphone").val(telphone);
	$("#update_school").val(school);
	$("#update_xueli").val(xueli);
	$("#update_zhuanye").val(zhuanye);
	$("#update_hxueli").val(hxueli);
	$("#update_hzhuanye").val(hzhuanye);
	$("#update_language").val(language);
	$("#update_job").val(job);
	$("#update_gongzi").val(gongzi);
	$("#update_jiangli").val(jiangli);
	$("#update_shijian").val(shijian);
	$("#update_pingjia").val(pingjia);
}
function add(){
	$("#modal-container-770348").modal();
}
function initFileInput(ctrlName, uploadUrl) {
	var control = $('#' + ctrlName);
	control.fileinput({
		uploadUrl : uploadUrl,
	});
};
function checkaddpassport(){
	var passport = $("#add_passport").val();
	if(passport.length != 18){
		$("#passportm").html("身份证号要求18位！");
	}else{
		$("#passportm").html("");
	}
}

function checkaddphone(){
	var telphone = $("#add_telphone").val();
	alert(telphone);
	var re= /^1\d{10}$/;
	if(!re.test(telphone)){
		$("#telphonem").html("联系方式错误！");
	}else{
		$("#telphonem").html("");
	}
}

function checkaddSubmit(){
	var passport = $("#add_passport").val();
	if(passport.length != 18){
		$("#passportm").html("身份证号要求18位！");
		return false;
	}
	var telphone = $("#add_telphone").val();
	var re= /^1\d{10}$/;
	if(!re.test(telphone)){
		$("#telphonem").html("联系方式错误！");
		return false;
	}
}

function checkupdatepassport(){
	var passport = $("#update_passport").val();
	if(passport.length != 18){
		$("#passportm2").html("身份证号要求18位！");
	}else{
		$("#passportm2").html("");
	}
}

function checkupdatephone(){
	var telphone = $("#update_telphone").val();
	var re= /^1\d{10}$/;
	if(!re.test(telphone)){
		$("#telphonem2").html("联系方式错误！");
	}else{
		$("#telphonem2").html("");
	}
}

function checkupdateSubmit(){
	var passport = $("#update_passport").val();
	if(passport.length != 18){
		$("#passportm2").html("身份证号要求18位！");
		return false;
	}
	var telphone = $("#update_telphone").val();
	var re= /^1\d{10}$/;
	if(!re.test(telphone)){
		$("#telphonem2").html("联系方式错误！");
		return false;
	}
}

$(document).ready(function() {
	var url = location.href; 
	state=url.split("=")[1];
	if(state == 22){
		alert("删除成功");
	}
	if(state == 33){
		alert("更新成功");
	}
	initFileInput("add_pingjia", "user/jianliDao.jsp?op=pingjiaupload");
	initFileInput("add_shijian", "user/jianliDao.jsp?op=shijianupload");
	initFileInput("add_jiangli", "user/jianliDao.jsp?op=jiangliupload");
	initFileInput("update_pingjia", "user/jianliDao.jsp?op=pingjiaupload");
	initFileInput("update_shijian", "user/jianliDao.jsp?op=shijianupload");
	initFileInput("update_jiangli", "user/jianliDao.jsp?op=jiangliupload");
	var url = location.href; 
	state=url.split("=")[1];
	if(state == -1){
		alert("最多创建5个简历");
	}
	$('#add_birthday').datetimepicker({
		minView:"month", //选择日期后，不会再跳转去选择时分秒 
		format:"yyyy-mm-dd", //选择日期后，文本框显示的日期格式 
		todayBtn:true,
		autoclose:true //选择日期后自动关闭 
	});
	$('#update_birthday').datetimepicker({
		minView:"month", //选择日期后，不会再跳转去选择时分秒 
		format:"yyyy-mm-dd", //选择日期后，文本框显示的日期格式 
		todayBtn:true,
		autoclose:true //选择日期后自动关闭 
	});
});
</script>
	<nav class="navbar nav_bottom" role="navigation">
	<div class="container">
		<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
			<ul class="nav navbar-nav nav_1">
				<li><a href="user/zhiwei_info.jsp?currentPage=1">首页</a></li>
				<li><a href="user/jianli_info.jsp">简历管理</a></li>
				<li><a href="user/xiaoxi.jsp?currentPage=1">我的消息</a></li>
				<li><a href="user/tuijian.jsp?currentPage=1">我的推荐</a></li>
				<li><a href="user/information.jsp">个人信息</a></li>
				<li style = "margin-left:300px"><a href="user/zhiwei_info.jsp?currentPage=1&state=-300">注销</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<script src="js/responsiveslides.min.js"></script>
	<script>
		$(document).ready(function(){
			$(".dropdown").hover(            
				function() {
					$('.dropdown-menu', this).stop( true, true ).slideDown("fast");
					$(this).toggleClass('open');        
				},
				function() {
					$('.dropdown-menu', this).stop( true, true ).slideUp("fast");
					$(this).toggleClass('open');       
				}
			);
		});
		// You can also use "$(window).load(function() {"
		$(function () {
		// Slideshow 4
			$("#slider3").responsiveSlides({
				auto: true,
				pager: true,
				nav: true,
				speed: 500,
				namespace: "callbacks",
				before: function () {
					$('.events').append("<li>before event fired.</li>");
				},
				after: function () {
					$('.events').append("<li>after event fired.</li>");
				}
			});
					
		});
	</script>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="panel-group" id="panel-354825">
					<button id="modal-542094" href="#modal-container-542094"
						role="button" class="btn" data-toggle="modal" onclick="add()">新增简历</button>
					<%
						Object idObj = request.getSession().getAttribute("userid");
						if (idObj != null) {
							int id = ((Integer)idObj).intValue();
							JianliDao jlDao = new JianliDao();
							Jianli jl = new Jianli();
							jl.setUserId(id);
							Map<String, Object> map = new HashMap<String, Object>();
							map = jlDao.select4List(jl, 1, 5);
							List<Jianli> list = new ArrayList<Jianli>();
							list = (List<Jianli>) map.get("data");
							for (Jianli j : list) {
					%>
					<div class="panel panel-default">
						<div class="panel-heading">
							<a class="panel-title" data-toggle="collapse"
								data-parent="#panel-354825"
								href="#panel-element-299510-<%=j.getId()%>">创建时间&nbsp;<%=j.getCreateTime()%></a>
							<a style="margin-left: 600px; margin-top: 8px" id="modal-540442"
								role="button" class="btn" data-toggle="modal"
								onclick="deljianli(<%=j.getId()%>)">删除</a> <a
								style="margin-left: 900px; margin-top: -33px" id="modal-540442"
								role="button" class="btn" data-toggle="modal"
								onclick="updatejianli(<%=j.getId()%>, '<%=j.getName()%>','<%=j.getSex()%>', <%=j.getAge()%>, '<%=j.getBirthday()%>', '<%=j.getPassport()%>', '<%=j.getAddress()%>',<%=j.getTelphone()%>, '<%=j.getSchool()%>','<%=j.getXueli()%>', '<%=j.getZhuanye()%>','<%=j.getHxueli()%>', '<%=j.getHzhuanye()%>', '<%=j.getLanguage()%>','<%=j.getJob()%>',<%=j.getGongzi()%>, '<%=j.getJiangli()%>', '<%=j.getShijian()%>', '<%=j.getPingjia()%>')">修改</a>
						</div>
						<div id="panel-element-299510-<%=j.getId()%>"
							class="panel-collapse collapse">
							<div class="panel-body">
								<div class="course_list">
									<div class="table-header clearfix">
										<div class="name_col">个人信息</div>
									</div>
									<ul class="table-list">
										<li class="clearfix" style="background: #DDDDDD">
											<div>
												姓名：<%=j.getName()%></div>
											<div>
												性别：<%=j.getSex()%></div>
											<div>
												年龄：<%=j.getAge()%></div>
										</li>
										<li class="clearfix" style="background: #DDDDDD">
											<div>
												生日：<%=j.getBirthday()%></div>
										</li>
										<li class="clearfix" style="background: #DDDDDD">
											<div>
												地址：<%=j.getAddress()%></div>
											<div>
												电话：<%=j.getTelphone()%></div>
										</li>
									</ul>
									<div class="table-header clearfix">
										<div class="name_col">学习情况</div>
									</div>
									<ul class="table-list">
										<li class="clearfix" style="background: #DDDDDD">
											<div>
												学校：<%=j.getSchool()%></div>
											<div>
												语言：<%=j.getLanguage()%></div>
										</li>
										<li class="clearfix" style="background: #DDDDDD">
											<div>
												学历：<%=j.getXueli()%></div>
											<div>
												专业：<%=j.getZhuanye()%></div>
											<div>
												最高学历：<%=j.getHxueli()%></div>
											<div>
												最高专业：<%=j.getHzhuanye()%></div>
										</li>
									</ul>
									<div class="table-header clearfix">
										<div class="name_col">职位意向</div>
									</div>
									<ul class="table-list">
										<li class="clearfix" style="background: #DDDDDD">
											<div>
												期望职位：<%=j.getJob()%></div>
											<div>
												期望工资：<%=j.getGongzi()%></div>
										</li>
									</ul>
									<div class="table-header clearfix">
										<div class="name_col">奖励情况</div>
									</div>
									<ul class="table-list">
										<li class="clearfix" style="background: #DDDDDD">
											<%
												if (j.getJiangli().equals("file/")) {
											%> 暂无奖励情况 <%
												} else {
											%> <a
											href="<%=j.getJiangli()%>" download="<%=j.getJiangli()%>">下载奖励情况</a>
											<%
												}
											%>
										</li>
									</ul>
									<div class="table-header clearfix">
										<div class="name_col">实践情况</div>
									</div>
									<ul class="table-list">
										<li class="clearfix" style="background: #DDDDDD">
											<%
												if (j.getShijian().equals("file/")) {
											%> 暂无实践情况 <%
												} else {
											%> <a
											href="<%=j.getShijian()%>" download="<%=j.getShijian()%>">下载实践情况</a>
											<%
												}
											%>
										</li>
									</ul>
									<div class="table-header clearfix">
										<div class="name_col">自我评价</div>
									</div>
									<ul class="table-list">
										<li class="clearfix" style="background: #DDDDDD">
											<%
												if (j.getPingjia().equals("file/")) {
											%> 暂无自我评价 <%
												} else {
											%> <a
											href="<%=j.getPingjia()%>" download="<%=j.getPingjia()%>">下载自我评价</a>
											<%
												}
											%>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<%
						}
						} else {
							response.sendRedirect("../front/userlogin.jsp?state=100");
						}
					%>
				</div>
			</div>
		</div>
	</div>

	<!-- 删除 -->
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="modal fade" id="modal-container-770346" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<form action="user/jianliDao.jsp?op=del" method="post">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">删除！</h4>
								</div>
								<div class="modal-body">
									<p id="delete">确认删除？</p>
									<input type="hidden" name="del_id" id="del_id">
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
	<!-- 修改 -->
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="modal fade" id="modal-container-770347" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<form action="user/jianliDao.jsp?op=update" method="post"
							onsubmit="return checkupdateSubmit()">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">修改简历</h4>
								</div>
								<div class="modal-body">
									<input type="hidden" name="update_id" id="update_id">
									<div class="form-group">
										<label for="exampleInputEmail1">姓名</label> <input type="text"
											id="update_name" name="update_name" readonly class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">性别</label> <input type="text"
											id="update_sex" name="update_sex" readonly class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">年龄</label> <input type="text"
											id="update_age" name="update_age" class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">生日</label>
										<form role="form">
											<input type="text" id="update_birthday"
												name="update_birthday" readonly class="form-control" />
										</form>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">身份证号</label> <input
											type="text" id="update_passport" name="update_passport"
											class="form-control" onblur="checkupdatepassport()" />
										<p id="passportm2" style="height: 20px; color: red"></p>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">地址</label> <input type="text"
											id="update_address" name="update_address"
											class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">联系方式</label> <input
											type="text" id="update_telphone" name="update_telphone"
											class="form-control" readonly onblur="checkupdatephone()" />
										<p id="telphonem2" style="height: 20px; color: red"></p>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">学校</label> <input type="text"
											id="update_school" name="update_school" class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">学历</label> <input type="text"
											id="update_xueli" name="update_xueli" class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">专业</label> <input type="text"
											id="update_zhuanye" name="update_zhuanye"
											class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">最高学历</label> <input
											type="text" id="update_hxueli" name="update_hxueli"
											class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">最高专业</label> <input
											type="text" id="update_hzhuanye" name="update_hzhuanye"
											class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">语言</label> <input type="text"
											id="update_language" name="update_language"
											class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">期望工作</label> <input
											type="text" id="update_job" name="update_job"
											class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">工资</label> <input type="text"
											id="update_gongzi" name="update_gongzi" class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">奖励情况</label> <input
											id="update_jiangli" name="update_jiangli" type="file"
											multiple>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">实践情况</label> <input
											id="update_shijian" name="update_shijian" type="file"
											multiple>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">评价</label> <input
											id="update_pingjia" name="update_pingjia" type="file"
											multiple>
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

<%
Object idObj2 = request.getSession().getAttribute("userid");
if (idObj2 != null) {
	int id = ((Integer)idObj2).intValue();
	User u2 = new User();
	UserDao u2Dao = new UserDao();
	u2.setId(id);
	u2 = u2Dao.selectbyid(u2);
%>
	<!-- 新加 -->
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="modal fade" id="modal-container-770348" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<form action="user/jianliDao.jsp?op=add" method="post"
							onsubmit="return checkaddSubmit()">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">新增简历</h4>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label for="exampleInputEmail1">姓名</label> <input type="text"
											id="add_name" name="add_name" class="form-control" readonly value = <%=u2.getRealName() %>/>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">性别</label> 
										<input type="text"
											id="add_sex" name="add_sex" class="form-control" readonly value = <%=u2.getSex() %>/>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">年龄</label> <input type="text"
											id="add_age" name="add_age" class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">生日</label>
										<form role="form">
											<input type="text" id="add_birthday" name="add_birthday"
												readonly class="form-control" />
										</form>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">身份证号</label> <input
											type="text" id="add_passport" name="add_passport"
											class="form-control" onblur="checkaddpassport()" />
										<p id="passportm" style="height: 20px; color: red"></p>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">地址</label> <input type="text"
											id="add_address" name="add_address" class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">联系方式</label> <input
											type="text" id="add_telphone" name="add_telphone"
											class="form-control" onblur="checkaddphone()" readonly value = <%=u2.getTelphone() %>/>
										<p id="telphonem" style="height: 20px; color: red"></p>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">学校</label> <input type="text"
											id="add_school" name="add_school" class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">学历</label> <input type="text"
											id="add_xueli" name="add_xueli" class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">专业</label> <input type="text"
											id="add_zhuanye" name="add_zhuanye" class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">最高学历</label> <input
											type="text" id="add_hxueli" name="add_hxueli"
											class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">最高专业</label> <input
											type="text" id="add_hzhuanye" name="add_hzhuanye"
											class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">语言</label> <input type="text"
											id="add_language" name="add_language" class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">期望工作</label> <input
											type="text" id="add_job" name="add_job" class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">工资</label> <input type="text"
											id="add_gongzi" name="add_gongzi" class="form-control" />
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">奖励情况</label> <input
											id="add_jiangli" name="add_jiangli" type="file" multiple>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">实践情况</label> <input
											id="add_shijian" name="add_shijian" type="file" multiple>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">评价</label> <input
											id="add_pingjia" name="add_pingjia" type="file" multiple>
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
<%} %>	
	
	<%
	List<Company> list = new ArrayList<Company>();
	CompanyDao companyDao = new CompanyDao();
	list = companyDao.select4list();
	%>
	<div id="top" class="callbacks_container">
		<ul class="rslides" id="slider3">
			<li>
				<div class="banner-bg">
					<div class="container">
						<div class="banner-info">
						<%if(list.get(0) != null){ %>
							<h3>
								热门公司<span><%=list.get(0).getName() %></span>
							</h3>
							<p><%=list.get(0).getIntroduce() %></p>
						<%} %>
						</div>
						<a href="user/zhiwei_info.jsp?op=search&currentPage=1&companyname=<%=list.get(0).getName()%>">
                    		<span><i class="fa fa-chain chain_1"></i>查看该公司</span>
                		</a>
					</div>
				</div>
			</li>
			<li>
				<div class="banner-bg banner-img2">
					<div class="container">
						<div class="banner-info">
						<%if(list.get(1) != null){ %>
							<h3>
								热门公司<span><%=list.get(1).getName() %></span>
							</h3>
							<p><%=list.get(1).getIntroduce() %></p>
						<%} %>
						</div>
						<a href="user/zhiwei_info.jsp?op=search&currentPage=1&companyname=<%=list.get(1).getName()%>">
                    		<span><i class="fa fa-chain chain_1"></i>查看该公司</span>
                		</a>
					</div>
				</div>
			</li>
			<li>
				<div class="banner-bg banner-img">
					<div class="container">
						<div class="banner-info">
						<%if(list.get(2) != null){ %>
							<h3>
								热门公司<span><%=list.get(2).getName() %></span>
							</h3>
							<p><%=list.get(2).getIntroduce() %></p>
						<%} %>
						</div>
						<a href="user/zhiwei_info.jsp?op=search&currentPage=1&companyname=<%=list.get(2).getName()%>">
                    		<span><i class="fa fa-chain chain_1"></i>查看该公司</span>
                		</a>
					</div>
				</div>
			</li>
			<li>
				<div class="banner-bg">
					<div class="container">
						<div class="banner-info">
						<%if(list.get(3) != null){ %>
							<h3>
								热门公司<span><%=list.get(3).getName() %></span>
							</h3>
							<p><%=list.get(3).getIntroduce() %></p>
						<%} %>
						</div>
						<a href="user/zhiwei_info.jsp?op=search&currentPage=1&companyname=<%=list.get(3).getName()%>">
                    		<span><i class="fa fa-chain chain_1"></i>查看该公司</span>
                		</a>
					</div>
				</div>
			</li>
			<li>
				<div class="banner-bg banner-img2">
					<div class="container">
						<div class="banner-info">
						<%if(list.get(4) != null){ %>
							<h3>
								热门公司<span><%=list.get(4).getName() %></span>
							</h3>
							<p><%=list.get(4).getIntroduce() %></p>
						<%} %>
						</div>
						<a href="user/zhiwei_info.jsp?op=search&currentPage=1&companyname=<%=list.get(4).getName()%>">
                    		<span><i class="fa fa-chain chain_1"></i>查看该公司</span>
                		</a>
					</div>
				</div>
			</li>

		</ul>
	</div>
</body>
</html>