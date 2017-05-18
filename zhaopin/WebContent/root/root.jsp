<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.RootDao"%>
<%@ page import="com.zhaopin.entity.Root"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<link href="http://www.jq22.com/jquery/font-awesome.4.6.0.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/templatemo_main.css">
<title>招聘系统管理后台</title>
</head>
<body>
<script>
$(document).ready(function(){
	var url = location.href; 
	str=url.split("=")[1];
	state=str.split("&")[0];
	if(state > 0){
		alert("修改成功！");
	}
});
function checkphone(){
	var telphone = $("#telphone").val();
	var re= /^1\d{10}$/;
	if(!re.test(telphone)){
		$("#telphonem").html("联系方式错误！");
	}else{
		$("#telphonem").html("");
	}
}
function checkSubmit(){
	var telphone = $("#telphone").val();
	var re= /^1\d{10}$/;
	if(!re.test(telphone)){
		$("#telphonem").html("联系方式错误！");
		return false;
	}
}
</script>
<div id="main-wrapper">
	<div class="navbar navbar-inverse" role="navigation">
      	<div class="navbar-header">
        	<div class="logo"><h1>招聘网站管理后台</h1></div>
        	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          		<span class="sr-only">招聘网站管理后台</span>
          		<span class="icon-bar"></span>
          		<span class="icon-bar"></span>
          		<span class="icon-bar"></span>
        	</button> 
      	</div>   
	</div>
   	<div class="template-page-wrapper">
      	<div class="navbar-collapse collapse templatemo-sidebar">
        	<ul class="templatemo-sidebar-menu">
				<li id= "company"><a href="root/company.jsp?currentPage=1"><i class="fa fa-cubes"></i>企业管理</a></li>
				<li class="active" id = "root"><a href="root/root.jsp"><i class="fa fa-map-marker"></i>个人管理</a></li>
				<li id= "zhaopin"><a href="root/zhaopin.jsp?currentPage=1"><i class="fa fa-cog"></i>招聘管理</a></li>
				<li id= "login"><a href="root/login.jsp?currentPage=1"><i class="fa fa-cog"></i>登录管理</a></li>
        		<li id= "zhuxiao"><a href="root/company.jsp?currentPage=1&state=-300"><i class="fa fa-cog"></i>注销</a></li>
        	</ul>
      	</div>
		<div class="templatemo-content-wrapper">
			<div class="templatemo-content">	
				<%
					RootDao rDao = new RootDao();
					Root r = new Root();
					r = rDao.select();
				%>
				
				<!-- 个人信息 -->
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form action="root/rootDao.jsp" method = "post"  onsubmit="return checkSubmit()">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">
								个人详细信息
							</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="exampleInputEmail1">ID</label>
								<input type="text" name = "id" class="form-control" value = <%=r.getId() %> readonly>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">姓名</label>
								<input type="text" name = "name" class="form-control" value = <%=r.getName() %> >
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">密码</label>
								<input type="text" name = "password" class="form-control" value = <%=r.getPassword() %>>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">性别</label>
								<input type="text" name = "sex" class="form-control" value = <%=r.getSex() %>>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">联系方式</label>
								<input type="text" name = "telphone" id = "telphone" class="form-control" value = <%=r.getTelphone() %> onblur="checkphone()">
								<p id = "telphonem" style = "height:20px;color:red"></p>
							</div>
						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							 <button type="submit" class="btn btn-danger">修改</button>
						</div>
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
</body>
</html>