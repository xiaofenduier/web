<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<link href="http://www.jq22.com/jquery/font-awesome.4.6.0.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/templatemo_main.css">
<title>招聘系统管理后台</title>
</head>
<body>
<script type="text/javascript">
function check(id){
	$("#modal-container-937765").modal();
	$("#check_id").val(id);
}
function detail(name, code, shuiwu, time, xy, yyzz, username, userpassport, introduce){
	$("#modal-container-975070").modal();
	$("#jigou").val(code);
	$("#name").val(name);
	$("#starttime").val(time);
	$("#xy").val(xy);
	$("#yyzz").val(yyzz);
	$("#shuiwu").val(shuiwu);
	$("#username").val(username);
	$("#userpassport").val(userpassport);
	$("#introduce").val(introduce);
	
}
</script>
<%
String state2 = request.getParameter("state");
if(state2 != null && state2.equals("-300")){
	request.getSession().removeAttribute("userid");
	request.getSession().removeAttribute("username");
}
%>
<%
Object idObj = request.getSession().getAttribute("userid");
if (idObj == null) {
%>
<script type="text/javascript">
location.href = "front/rootlogin.jsp";
</script>
<%}else{ %>
<div id="main-wrapper">
	<div class="navbar navbar-inverse" role="navigation">
      	<div class="navbar-header">
        	<div class="logo"><h1>招聘系统管理后台</h1></div>
        	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          		<span class="sr-only">招聘系统管理后台</span>
          		<span class="icon-bar"></span>
          		<span class="icon-bar"></span>
          		<span class="icon-bar"></span>
        	</button> 
      	</div>   
	</div>
   	<div class="template-page-wrapper">
      	<div class="navbar-collapse collapse templatemo-sidebar">
        	<ul class="templatemo-sidebar-menu">
				<li class="active" id= "company"><a href="root/company.jsp?currentPage=1"><i class="fa fa-cubes"></i>企业管理</a></li>
				<li id = "root"><a href="root/root.jsp"><i class="fa fa-map-marker"></i>个人管理</a></li>
				<li id= "zhaopin"><a href="root/zhaopin.jsp?currentPage=1"><i class="fa fa-cog"></i>招聘管理</a></li>
				<li id= "login"><a href="root/login.jsp?currentPage=1"><i class="fa fa-cog"></i>登录管理</a></li>
				<li id= "zhuxiao"><a href="root/company.jsp?currentPage=1&state=-300"><i class="fa fa-cog"></i>注销</a></li>
        	</ul>
      	</div>
		<div class="templatemo-content-wrapper">
			<div class="templatemo-content">	
				<%
					String curPage = request.getParameter("currentPage");
					int currentPage = Integer.parseInt(curPage);
					int pageSize = 5; /* 每页显示行数 */
					CompanyDao cDao = new CompanyDao();
					Company c = new Company();
					Map<String, Object> map = new HashMap<String, Object>();
					map = cDao.select4Page(c, currentPage, pageSize);
					List<Company> list = new ArrayList<Company>();
					list = (List<Company>) map.get("data");
					int pageCount = (Integer) map.get("pageCount");
				%>
				
				<div class="container-fluid">
					<div class="row-fluid">
						<div class="span12">
							<table class="table">
								<thead id="thead">
									<th>企业ID</th>
									<th>企业名称</th>
									<th>地址</th>
									<th>电话</th>
									<th>经营范围</th>
									<th>状态</th>
									<th>操作</th>
								</thead>
								<tbody id="tbody">
									<%
										int j = 0;
										for(Company company : list){
											String state = "";
											if(company.getState() == 1){
												state = "已认证";
											}else{
												state = "未认证";
											}
											if(j % 2 == 0){
									%>
									<tr class = 'success'>
										<td><%=company.getId() %></td>
										<td><a id="modal-975070" href="#" data-toggle="modal" onclick = "detail('<%=company.getName() %>', '<%=company.getCode() %>', <%=company.getShuiwu() %>, '<%=company.getTime() %>','<%=company.getXy() %>','<%=company.getYyzz() %>','<%=company.getUserName() %>','<%=company.getUserPassport() %>', '<%=company.getIntroduce()%>')"><%=company.getName() %></a></td>
										<td><%=company.getAddress() %></td>
										<td><%=company.getTelphone() %></td>
										<td><%=company.getRange() %></td>
										<td><%=state %></td>
										<%if(company.getState() == 1){ %>
										<td><%=state %></td>
										<%}else{ %>
										<td><a id='check' role='button' data-toggle='modal' onclick="check(<%=company.getId() %>)">认证</a></td>
										<%} %>
									</tr>
									<%
											}else{
									%>
									<tr class = 'info'>
										<td><%=company.getId() %></td>
										<td><a id="modal-975070" href="#" data-toggle="modal" onclick = "detail('<%=company.getName() %>', '<%=company.getCode() %>', <%=company.getShuiwu() %>, '<%=company.getTime() %>','<%=company.getXy() %>','<%=company.getYyzz() %>','<%=company.getUserName() %>','<%=company.getUserPassport() %>', '<%=company.getIntroduce()%>')"><%=company.getName() %></a></td>										
										<td><%=company.getAddress() %></td>
										<td><%=company.getTelphone() %></td>
										<td><%=company.getRange() %></td>
										<td><%=state %></td>
										<%if(company.getState() == 1){ %>
										<td><%=state %></td>
										<%}else{ %>
										<td><a id='check' role='button' data-toggle='modal' onclick="check(<%=company.getId() %>)">认证</a></td>
										<%} %>
									</tr>
									<%
											}
											j++;
										} 
									%>
								</tbody>
							</table>
							<ul class="pagination">
							<%
								if (pageCount <= 5) {
									for (int i = 1; i <= pageCount; i++) {
							%>
							<li><a href="root/company.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
								}
								if (pageCount > 5) {
									if (currentPage > 1) {
							%>
							<li><a
								href="root/company.jsp?currentPage=<%=currentPage - 1%>">&laquo;</a></li>
							<%
								}
							%>
							<%
								for (int i = 1; i <= 5; i++) {
							%>
							<li><a href="root/company.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
									if (currentPage < pageCount) {
							%>
							<li><a
								href="root/company.jsp?currentPage=<%=currentPage + 1%>">&raquo;</a></li>
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
	</div>
</div>
<%} %>
<!-- 详细信息 -->
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="modal fade" id="modal-container-975070" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">
								公司详细信息
							</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="exampleInputEmail1">公司名称</label>
								<input type="text" id = "name" class="form-control" readonly/>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">组织机构代码</label>
								<input type="text" id = "jigou" class="form-control" readonly/>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">税务登记证代码</label>
								<input type="text" id = "shuiwu" class="form-control" readonly/>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">成立时间</label>
								<input type="text" id = "starttime" class="form-control" readonly/>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">营业执照注册号</label>
								<input type="text" id = "yyzz" class="form-control" readonly/>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">统一社会借用代码</label>
								<input type="text" id = "xy" class="form-control" readonly/>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">法人姓名</label>
								<input type="text" id = "username" class="form-control" readonly/>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">法人身份证号</label>
								<input type="text" id = "userpassport" class="form-control" readonly/>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">企业介绍</label>
								<input type="text" id = "introduce" class="form-control" readonly/>
							</div>
						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 认证 -->
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="modal fade" id="modal-container-937765" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<form role="form" action="root/companyDao.jsp?op=check" method="post">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">删除</h4>
							</div>
							<div class="modal-body">
								确认认证？
								<div class="form-group">
									<input id="check_id" name="check_id" class="form-control" type="hidden">
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								<button type="submit" class="btn btn-primary">确认</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>