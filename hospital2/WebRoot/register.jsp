<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'register.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
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
/* function checkRealName() {
	var realname = $("realname").val();
	if (realname == null) {
		alert("真实姓名不能为空");
	}
}
function checkUserName() {
	var username = $("username").val();
	if (username == null) {
		alert("账户名不能为空");
	}
}
function checkPassWord() {
	var password = $("password").val();
	if (password == null) {
		alert("密码不能为空");
	}
}
function checkPassWord2() {
	var password = $("password").val();
	var password2 = $("password2").val();
	if (password2 == null) {
		alert("真实姓名不能为空");
	}
	if (password != password2) {
		alert("两次密码不一致");
	}
}
function checkTelPhone() {
	var telphone = $("telphone").val();
	if (telphone == null) {
		alert("手机号不能为空");
	}
}
function checkEmail() {
	var email = $("email").val();
	if (email == null) {
		alert("邮箱不能为空");
	}
} */
</script>
</head>

<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="well well-sm ">
					<h3 class="panel-title">用户注册</h3>
				</div>
				<form role="form" action="registerDao.jsp" method="post">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon">真实姓名</span> <input
								name="realname" type="text" id="realname" class="form-control"
								onblur="checkRealName()">
							</td>
						</div>
						<span id="realname_msg"></span> <br /> <br />
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon">账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</span>
							<input name="username" type="text" id="username"
								class="form-control" onblur="checkUserName()">
							</td>
						</div>
						<span id="username_msg"></span> <br />
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon">身份证</span>
							<input name="passport" type="text" id="passport"
								class="form-control"">
							</td>
						</div>
						<span id="passport_msg"></span> <br />
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄</span>
							<input name="age" type="text" id="age" class="form-control"
								onblur="checkAge()">
							</td>
						</div>
						<span id="age_msg"></span> <br />
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</span>
							<select class="form-control" id="sex" name="sex">
								<option value="1">男</option>
								<option value="2">女</option>
							</select>
						</div>
						<span id="username_msg"></span> <br />
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</span>
							<input name="password" type="Password" id="password"
								class="form-control" onblur="checkPassWord()">
						</div>
						<span id="password_msg">
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon">确认密码&nbsp;</span> <input
								name="Password2" type="Password" id="password2"
								class="form-control" onblur="checkPassWord2()">
						</div>
						<span id="password2_msg">
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon">手机号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<input name="telphone" type="text" id="telphone"
								class="form-control" onblur="checkTelPhone()">
						</div>
						<span id="phone_msg"></span> <br />
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</span>
							<input name="email" type="text" id="email" class="form-control"
								onblur="checkEmail()">
						</div>
						<span id="email_msg"></span> <br />
					</div>
					<div class="form-group">
						<input class="btn btn-primary btn-block" type="submit" value="注册" />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
