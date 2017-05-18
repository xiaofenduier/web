<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="../css/bootstrap-datetimepicker.min.css" />
<script src="../js/jquery.min.js"></script>
<script src="../js/moment-with-locales.min.js"></script> 
<script type="text/javascript" src="../js/bootstrap-datetimepicker.min.js"></script>

<link href="../css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
<script src="../js/sortable.js" type="text/javascript"></script>
<script src="../js/fileinput.js" type="text/javascript"></script>
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
	$('#datetimepicker').datetimepicker({
		minView: "month", //选择日期后，不会再跳转去选择时分秒 
		format: "yyyy-mm-dd", //选择日期后，文本框显示的日期格式 
		language: 'zh-CN', //汉化 
		autoclose:true //选择日期后自动关闭 
	});
	
	initFileInput("pic", "registerDao.jsp?op=upload");
});
function initFileInput(ctrlName, uploadUrl) {
	var control = $('#' + ctrlName);
	control.fileinput({
		uploadUrl : uploadUrl
	});
};
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
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<ul class="nav nav-tabs">
				<li>
					 <a href="userregister.jsp">用户注册</a>
				</li>
				<li class="active">
					 <a href="companyregister.jsp">公司注册</a>
				</li>
			</ul>
			<div class="modal-dialog">
				<form role="form" action="registerDao.jsp?op=company" method="post" onsubmit="return checkSubmit()">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">公司注册</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>公司名称</label> 
								<input id="name" name="name" class="form-control" type="text">
							</div>
							<div class="form-group">
								<label>登录密码</label> 
								<input id="password" name="password" class="form-control" type="text">
							</div>
							<div class="form-group">
								<label>公司地址</label> 
								<input id="address" name="address" class="form-control" type="text">
							</div>
							<div class="form-group">
								<label>联系方式</label> 
								<input id="telphone" name="telphone" class="form-control" type="text" onblur="checkphone()">
								<p id = "telphonem" style = "height:20px;color:red"></p>
							</div>
							<div class="form-group">
								<label>经营范围</label> 
								<input id="range" name="range" class="form-control" type="text">
							</div>
							<div class="form-group">
								<label>组织机构代码</label> 
								<input id="code" name="code" class="form-control" type="text" onblur = "checkcode()">
								<p id = "codem" style = "height:20px;color:red"></p>
							</div>
							<div class="form-group">
								<label>税务登记证号码</label> 
								<input id="shuiwu" name="shuiwu" class="form-control" type="text" onblur = "checkshuiwu()">
								<p id = "shuiwum" style = "height:20px;color:red"></p>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">成立时间</label>
								<input class="form-control" type="text" id="datetimepicker" name = "time" readonly>
							</div>
							<div class="form-group">
								<label>营业执照注册号</label> 
								<input id="yyzz" name="yyzz" class="form-control" type="text">
							</div>
							<div class="form-group">
								<label>统一社会信用代码</label> 
								<input id="xy" name="xy" class="form-control" type="text"  onblur = "checkxy()">
								<p id = "xym" style = "height:20px;color:red"></p>
							</div>
							<div class="form-group">
								<label>法人姓名</label> 
								<input id="username" name="username" class="form-control" type="text">
							</div>
							<div class="form-group">
								<label>法人身份证号</label> 
								<input id="userpassport" name="userpassport" class="form-control" type="text" onblur="checkpassport()">
								<p id = "passportm" style = "height:20px;color:red"></p>
							</div>
							<div class="form-group">
								<label>企业介绍</label> 
								<input id="introduce" name="introduce" class="form-control" type="text">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">公司图片</label> 
								<input id="pic" name="pic" type="file" multiple>
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