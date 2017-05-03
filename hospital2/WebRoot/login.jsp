<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
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
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="assets/css/bootstrapValidator.min.css">

<script src="assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="assets/js/bootstrap.js"></script>
<script src="assets/js/bootstrapValidator.min.js"></script>
<script type="text/javascript">
	$(document).ready(
		function() {
		/* 验证码 */
			function randomNumber(min, max) {
				return Math.floor(Math.random() * (max - min + 1)+ min);
			};
			function generateCaptcha() {
				$('#captchaOperation').html([ randomNumber(1, 50), '+',randomNumber(1, 50), '=' ].join(' '));
			};
			generateCaptcha();
			$('#LoginG').bootstrapValidator(
				{
					feedbackIcons : {
						valid : 'glyphicon glyphicon-ok',
						invalid : 'glyphicon glyphicon-remove',
						validating : 'glyphicon glyphicon-refresh'
					},
					fields : {
						captcha : {
							validators : {
								callback : {
									message : '验证码错误',
									callback : function(value,validator) {
										var items = $('#captchaOperation').html().split(' '), sum = parseInt(items[0])+ parseInt(items[2]);
											return value == sum;
										}
									}
								}
							}
						}
					}).on('error.form.bv',function(e) {
						var $form = $(e.target), bootstrapValidator = $form.data('bootstrapValidator');
						if (!bootstrapValidator.isValidField('captcha')) {
							generateCaptcha();
						}
					});
				});
	var url = location.href; 
	state=url.split("=")[1];
	if(state != null && state <= 0){
		alert("登录失败");
	}
</script>
</head>
<body style="background-color: #E2E2E2;">
	<div class="container">
		<div class="row text-center " style="padding-top: 100px;">
			<div class="col-md-12">
				<h3>预约挂号管理系统</h3>
			</div>
		</div>
		<div class="row ">
			<div
				class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
				<div class="panel-body" style="width: 400px">
					<form role="form" method="post" action="loginDao.jsp">
						<hr />
						<h5>用户登录</h5>
						<br />

						<div class="form-group input-group">
							<span class="input-group-addon"><i class="fa fa-tag"></i></span>
							<input type="text" class="form-control"
								placeholder="Your Username " name = "username"/>
						</div>
						<div class="form-group input-group">
							<span class="input-group-addon"><i class="fa fa-lock"></i></span>
							<input type="password" class="form-control"
								placeholder="Your Password" name = "password"/>
						</div>
						<div name="LoginG" id="LoginG" method="post">
							<h5>请将如下计算结果填入文本框内：</h5>
							<div class="form-group form-horizontal">
								<label class="col-lg-3 control-label " id="captchaOperation"></label>
								<div class="col-lg-9">
									<input type="text" class="form-control " name="captcha" />
								</div>
							</div>
						</div>
						<div class="form-group input-group">
							<label class="checkbox-inline"> <input type="radio"
								name="optionsRadiosinline" id="optionsRadios3" value="root"
								checked>管理员
							</label> <label class="checkbox-inline"> <input type="radio"
								name="optionsRadiosinline" id="optionsRadios4" value="doctor">医生
							</label> <label class="checkbox-inline"> <input type="radio"
								name="optionsRadiosinline" id="optionsRadios4" value="user">患者
							</label>
						</div>
						<button type="submit" class="btn btn-primary ">Login</button>
						<hr />
						还没有注册？<a href="register.jsp">点击这里进行注册</a>
					</form>

				</div>
			</div>
		</div>
	</div>
</body>
</html>
