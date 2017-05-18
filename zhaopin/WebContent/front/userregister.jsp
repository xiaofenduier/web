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
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<ul class="nav nav-tabs">
				<li class="active">
					 <a href="userregister.jsp">用户注册</a>
				</li>
				<li>
					 <a href="companyregister.jsp">公司注册</a>
				</li>
			</ul>
			<div class="modal-dialog">
				<form role="form" action="registerDao.jsp?op=user" method="post">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">个人注册</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>用户姓名</label> 
								<input id="realname" name="realname" class="form-control" type="text">
							</div>
							<div class="form-group">
								<label>登录密码</label> 
								<input id="password" name="password" class="form-control" type="text">
							</div>
							<div class="form-group">
								<label>用户性别</label> 
								<select class="form-control" id="sex" name="sex">
									<option value="男" selected = "selected">男</option>
									<option value="女">女</option>
								</select>
							</div>
							<div class="form-group">
								<label>联系方式</label> 
								<input id="telphone" name="telphone" class="form-control" type="text">
							</div>
							<div class="form-group">
								<label>邮箱</label> 
								<input id="email" name="email" class="form-control" type="email">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								<button type="submit" class="btn btn-primary">保存</button>
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