<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.zhaopin.dao.CompanyDao"%>
<%@ page import="com.zhaopin.entity.Company"%>
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
<script>
$(document).ready(function(){
	var url = location.href; 
	state=url.split("=")[1];
	if(state == 1){
		alert("更新成功！");
	}
	$('#time').datetimepicker({
		minView:"month", //选择日期后，不会再跳转去选择时分秒 
		format:"yyyy-mm-dd", //选择日期后，文本框显示的日期格式 
		todayBtn:true,
		autoclose:true //选择日期后自动关闭 
	});
});
function checkpassport(){
	var passport = $("#userpassport").val();
	if(passport.length != 18){
		$("#passportm").html("身份证号要求18位！");
	}else{
		$("#passportm").html("");
	}
}

function checkphone(){
	var telphone = $("#telphone").val();
	var re= /^1\d{10}$/;
	if(!re.test(telphone)){
		$("#telphonem").html("联系方式错误！");
	}else{
		$("#telphonem").html("");
	}
}
function checkcode(){
	var code = $("#code").val();
	var flag = code.substring(7,8);
	if(!flag.equals("-")){
		$("#codem").html("组织机构代码不符合规则！");
		return false;
	}
	if(code.length != 9){
		$("#codem").html("组织机构代码要求9位！");
	}else{
		$("#codem").html("");
	}
}
function checkshuiwu(){
	var shuiwu = $("#shuiwu").val();
	if(shuiwu.length != 15){
		$("#shuiwum").html("税务代码要求15位！");
	}else{
		$("#shuiwum").html("");
	}
}
function checkxy(){
	var xy = $("#xy").val();
	var shuiwu = $("#shuiwu").val();
	var code = $("#code").val();
	var yyzz = $("#yyzz").val();
	if(xy.length != 18 && ((shuiwu == null && yyzz == null && code == null) || (yyzz == "" && code == "" && shuiwu == ""))){
		$("#xym").html("信用代码要求18位！");
	}
}
function checkSubmit(){
	var passport = $("#userpassport").val();
	if(passport.length != 18){
		$("#passportm").html("身份证号要求18位！");
		return false;
	}
	var telphone = $("#telphone").val();
	var re= /^1\d{10}$/;
	if(!re.test(telphone)){
		$("#telphonem").html("联系方式错误！");
		return false;
	}
	
	var xy = $("#xy").val();
	var shuiwu = $("#shuiwu").val();
	var code = $("#code").val();
	var yyzz = $("#yyzz").val();
	if(xy == null || xy == ""){
		if((yyzz == null && code == null && shuiwu == null) || (yyzz == "" && code == "" && shuiwu == "")){
			$("#xym").html("请填写统一社会信用代码或者营业执照、组织机构代码、税务登记代码");
			return false;
		}else{
			var flag = code.substring(7,8);
			if(!flag.equals("-")){
				$("#codem").html("组织机构代码不符合规则！");
				return false;
			}
			if(code.length != 9){
				$("#codem").html("组织机构代码要求9位！");
				return false;
			}
			
			if(shuiwu.length != 15){
				$("#shuiwum").html("税务代码要求15位！");
				return false;
			}
		}
	}else{
		if(xy.length != 18){
			$("#xym").html("信用代码要求18位！");
			return false;
		}
	}
}
</script>
</head>
<body style="background-color: #E2E2E2;background-image:url(../images/5bffff91-2554-404c-8e8a-e1487557c094.jpg)">

<nav class="navbar nav_bottom" role="navigation">
	<div class="container">
    	<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
        	<ul class="nav navbar-nav nav_1">
            	<li><a href="company/jianli_info.jsp?currentPage=1">首页</a></li>
				<li><a href="company/myjianli_info.jsp?currentPage=1">投递我的</a></li>
           		<li><a href="company/zhiwei.jsp?currentPage=1">我的职位</a></li>
           		<li><a href="company/information.jsp">我的基本信息</a></li>
           		<li style = "margin-left:300px"><a href="company/jianli_info.jsp?currentPage=1&state=-300">注销</a></li>
        	</ul>
     	</div>
   	</div>
</nav>

<div id="wrapper">
		<%
		Object companyidObj = request.getSession().getAttribute("companyid");
		if(companyidObj == null){
			response.sendRedirect("../front/companylogin.jsp?state=100");
		}else{
		int companyid = ((Integer)companyidObj).intValue();
		Company c = new Company();
		c.setId(companyid);
		CompanyDao cDao = new CompanyDao();
		c =  cDao.selectwithid(c);
		%>
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<div class="panel-heading">
							<h3>企业信息</h3>
						</div>
							<div class="modal-dialog">
								<form role="form" action="company/informationDao.jsp" method="post"  onsubmit="return checkSubmit()">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">×</button>
											<h4 class="modal-title" id="myModalLabel">修改企业信息</h4>
										</div>
										<div class="modal-body">
											<input id="id" name="id" type="hidden" value = <%=c.getId() %>>
											<div class="form-group">
												<label>企业名称</label> <input id="name" name="name"
													class="form-control" type="text" value = <%=c.getName() %>>
											</div>
											<div class="form-group">
												<label>登录密码</label> <input id="password" name="password"
													class="form-control" type="text" value = <%=c.getPassword() %>>
											</div>
											<div class="form-group">
												<label>地址</label> <input id="address" name="address"
													class="form-control" type="text" value = <%=c.getAddress() %>>
											</div>
											<div class="form-group">
												<label>联系方式</label> <input id="telphone" name="telphone"
													class="form-control" type="text" value = <%=c.getTelphone() %>  onblur="checkphone()">
													<p id = "telphonem" style = "height:20px;color:red"></p>
											</div>
											<div class="form-group">
												<label>经营范围</label> <input id="fanwei" name="fanwei"
													class="form-control" type="text" value = <%=c.getRange() %>>
											</div>
											<div class="form-group">
												<label>组织机构代码</label> <input id="jigou" name="jigou"
													class="form-control" type="text" value = <%=c.getCode() %> onblur = "checkcode()">
													<p id = "codem" style = "height:20px;color:red"></p>
											</div>
											<div class="form-group">
												<label>税务登记证号码</label> <input id="shuiwu" name="shuiwu"
													class="form-control" type="text" value = <%=c.getShuiwu() %> onblur = "checkshuiwu()">
													<p id = "shuiwum" style = "height:20px;color:red"></p>
											</div>
											<div class="form-group">
												<label>成立时间</label> <input id="time" name="time"
													class="form-control" type="text" value = <%=c.getTime() %>>
											</div>
											<div class="form-group">
												<label>营业执照</label> <input id="yyzz" name="yyzz"
													class="form-control" type="text" value = <%=c.getYyzz() %>>
											</div>
											<div class="form-group">
												<label>统一社会信用代码</label> <input id="xy" name="xy"
													class="form-control" type="text" value = <%=c.getXy() %>  onblur = "checkxy()">
													<p id = "xym" style = "height:20px;color:red"></p>
											</div>
											<div class="form-group">
												<label>法人</label> <input id="username" name="username"
													class="form-control" type="text" value = <%=c.getUserName() %>>
											</div>
											<div class="form-group">
												<label>法人身份证</label> <input id="userpassport" name="userpassport"
													class="form-control" type="text" value = <%=c.getUserPassport() %>>
											</div>
											<div class="form-group">
												<label>介绍</label> <input id="introduce" name="introduce"
													class="form-control" type="text" value = <%=c.getIntroduce() %>>
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
		<%} %>
</div>
</body>
</html>	