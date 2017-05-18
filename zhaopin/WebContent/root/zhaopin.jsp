<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.CompanyDao"%>
<%@ page import="com.zhaopin.entity.Company"%>
<%@ page import="com.zhaopin.dao.ZhaopinDao"%>
<%@ page import="com.zhaopin.entity.Zhaopin"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
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
function del(id){
	$("#modal-container-937765").modal();
	$("#del_id").val(id);
}
$(document).ready(function() {
	var url = location.href; 
	str=url.split("=")[1];
	state=str.split("&")[0];
	if(state != null && state == 100){
		alert("删除成功");
	}
})
</script>
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
				<li id= "company"><a href="root/company.jsp?currentPage=1"><i class="fa fa-cubes"></i>企业管理</a></li>
				<li id = "root"><a href="root/root.jsp"><i class="fa fa-map-marker"></i>个人管理</a></li>
				<li class="active" id= "zhaopin"><a href="root/zhaopin.jsp?currentPage=1"><i class="fa fa-cog"></i>招聘管理</a></li>
				<li id= "login"><a href="root/login.jsp?currentPage=1"><i class="fa fa-cog"></i>登录管理</a></li>
        		<li id= "zhuxiao"><a href="root/company.jsp?currentPage=1&state=-300"><i class="fa fa-cog"></i>注销</a></li>
        	</ul>
      	</div>
		<div class="templatemo-content-wrapper">
			<div class="templatemo-content">	
				<%
					String time = request.getParameter("time");
					Zhaopin z = new Zhaopin();
					System.out.println(time);
					if(time != null && time.equals("time")){
						Date endtime = new Date();
						SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
						z.setEndTime(sdf.format(endtime));
					}
					String curPage = request.getParameter("currentPage");
					int currentPage = Integer.parseInt(curPage);
					int pageSize = 5; /* 每页显示行数 */
					ZhaopinDao zDao = new ZhaopinDao();
					Map<String, Object> map = new HashMap<String, Object>();
					map = zDao.select4Page(z, currentPage, pageSize);
					List<Zhaopin> list = new ArrayList<Zhaopin>();
					list = (List<Zhaopin>) map.get("data");
					int pageCount = (Integer) map.get("pageCount");
				%>
				
				<div class="container-fluid">
				<form action="root/zhaopin.jsp?currentPage=1" method = "post">
					<input type = "hidden" name = "time" value = "time">
					<button type="submit" class="btn btn-default">搜索已过期的招聘信息</button>
				</form>
					<div class="row-fluid">
						<div class="span12">
							<table class="table">
								<thead id="thead">
									<th>编号</th>
									<th>企业名称</th>
									<th>联系方式</th>
									<th>截止时间</th>
									<th>发布时间</th>
									<th>操作</th>
								</thead>
								<tbody id="tbody">
									<%
										int j = 0;
										for(Zhaopin zhaopin : list){
											if(j % 2 == 0){
									%>
									<tr class = 'success'>
										<td><%=zhaopin.getId() %></td>
										<td><%=zhaopin.getCopmpany().getName() %></td>
										<td><%=zhaopin.getTelphone() %></td>
										<td><%=zhaopin.getEndTime() %></td>
										<td><%=zhaopin.getStartTime() %></td>
										<td><a id='del' role='button' data-toggle='modal' onclick="del(<%=zhaopin.getId() %>)">删除</a></td>
									</tr>
									<%
											}else{
									%>
									<tr class = 'info'>
										<td><%=zhaopin.getId() %></td>
										<td><%=zhaopin.getCopmpany().getName() %></td>
										<td><%=zhaopin.getTelphone() %></td>
										<td><%=zhaopin.getEndTime() %></td>
										<td><%=zhaopin.getStartTime() %></td>
										<td><a id='del' role='button' data-toggle='modal' onclick="del(<%=zhaopin.getId() %>)">删除</a></td>
									</tr>
									<%
											}
											j++;
										} 
									%>
								</tbody>
							</table>
							<%if(time != null && time.equals("time")){ %>
							<ul class="pagination">
							<%
								if (pageCount <= 5) {
									for (int i = 1; i <= pageCount; i++) {
							%>
							<li><a href="root/zhaopin.jsp?time=time&currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
								}
								if (pageCount > 5) {
									if (currentPage > 1) {
							%>
							<li><a
								href="root/zhaopin.jsp?time=time&currentPage=<%=currentPage - 1%>">&laquo;</a></li>
							<%
								}
							%>
							<%
								for (int i = 1; i <= 5; i++) {
							%>
							<li><a href="root/zhaopin.jsp?time=time&currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
									if (currentPage < pageCount) {
							%>
							<li><a
								href="root/zhaopin.jsp?time=time&currentPage=<%=currentPage + 1%>">&raquo;</a></li>
							<%
								}
								}
							%>
						</ul>							
							<%}else{ %>
							<ul class="pagination">
							<%
								if (pageCount <= 5) {
									for (int i = 1; i <= pageCount; i++) {
							%>
							<li><a href="root/zhaopin.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
								}
								if (pageCount > 5) {
									if (currentPage > 1) {
							%>
							<li><a
								href="root/zhaopin.jsp?currentPage=<%=currentPage - 1%>">&laquo;</a></li>
							<%
								}
							%>
							<%
								for (int i = 1; i <= 5; i++) {
							%>
							<li><a href="root/zhaopin.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
									if (currentPage < pageCount) {
							%>
							<li><a
								href="root/zhaopin.jsp?currentPage=<%=currentPage + 1%>">&raquo;</a></li>
							<%
								}
								}
							%>
						</ul>
						<%} %>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 删除 -->
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="modal fade" id="modal-container-937765" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<form role="form" action="root/zhaopinDao.jsp?op=del" method="post">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">删除</h4>
							</div>
							<div class="modal-body">
								确认删除？
								<div class="form-group">
									<input id="del_id" name="del_id" class="form-control" type="hidden">
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