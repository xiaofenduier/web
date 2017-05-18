<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.zhaopin.dao.UserDao"%>
<%@ page import="com.zhaopin.entity.User"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/jquery.countdown.css" />
<link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>
<link href="css/font-awesome.css" rel="stylesheet"> 

<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/moment-with-locales.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var url = location.href; 
	state=url.split("=")[1];
	if(state >= 1){
		alert("更新成功！");
	}
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

<div id="wrapper">
		<%
Object idObj = request.getSession().getAttribute("userid");
if (idObj != null) {
	int id = ((Integer)idObj).intValue();
	User u = new User();
	UserDao uDao = new UserDao();
	u.setId(id);
	u = uDao.selectbyid(u);
%>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<div class="panel-heading">
							<h3>个人信息</h3>
						</div>
							<div class="modal-dialog">
								<form role="form" action="user/informationDao.jsp" method="post"  onsubmit="return checkSubmit()">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button>
											<h4 class="modal-title" id="myModalLabel">修改个人信息</h4>
										</div>
										<div class="modal-body">
											<input id="id" name="id" type="hidden" value = <%=u.getId() %>>
											<div class="form-group">
												<label>姓名</label> <input id="name" name="name"
													class="form-control" type="text" value = <%=u.getRealName() %>>
											</div>
											<div class="form-group">
												<label>登录密码</label> <input id="password" name="password"
													class="form-control" type="text" value = <%=u.getPassword()%>>
											</div>
											<div class="form-group">
												<label>联系方式</label> <input id="telphone" name="telphone"
													class="form-control" type="text" value = <%=u.getTelphone() %>  onblur="checkphone()">
													<p id = "telphonem" style = "height:20px;color:red"></p>
											</div>
											<div class="form-group">
												<label>邮箱</label> <input id="fanwei" name="fanwei"
													class="form-control" type="email" value = <%=u.getEmail() %>>
											</div>
											<div class="form-group">
												<label for="exampleInputEmail1">性别</label> 
												<select class="form-control" id="sex" name="update_sex">
													<option value="男" selected = "selected">男</option>
													<option value="女">女</option>
												</select>
											</div>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary">保存</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
			</div>
		</div>
		<%} %>
</div>
</body>
</html>	