<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body style="background-color: #E2E2E2;background-image:url(../images/bg1.jpg)">
<script type="text/javascript">
$(document).ready(function() {
	var url = location.href; 
	state=url.split("=")[1];
	if(state != null && state <= 0){
		alert("登录失败");
	}
});
</script>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<ul class="nav nav-tabs">
				<li>
					 <a href="userlogin.jsp">用户登录</a>
				</li>
				<li>
					 <a href="companylogin.jsp">公司登录</a>
				</li>
				<li class="active">
					 <a href="rootlogin.jsp">管理员登录</a>
				</li>
			</ul>
			<div class="modal-dialog">
				<form role="form" action="loginDao.jsp?op=root" method="post">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">管理员登录</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>用户姓名</label> 
								<input id="name" name="name" class="form-control" type="text">
							</div>
							<div class="form-group">
								<label>登录密码</label> 
								<input id="password" name="password" class="form-control" type="password">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								<button type="submit" class="btn btn-primary">登录</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>