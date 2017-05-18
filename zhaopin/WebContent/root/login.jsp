<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.LoginDao"%>
<%@ page import="com.zhaopin.entity.Login"%>
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
				<li id= "zhaopin"><a href="root/zhaopin.jsp?currentPage=1"><i class="fa fa-cog"></i>招聘管理</a></li>
				<li class="active" id= "login"><a href="root/login.jsp?currentPage=1"><i class="fa fa-cog"></i>登录管理</a></li>
        		<li id= "zhuxiao"><a href="root/company.jsp?currentPage=1&state=-300"><i class="fa fa-cog"></i>注销</a></li>
        	</ul>
      	</div>
		<div class="templatemo-content-wrapper">
			<div class="templatemo-content">	
				<%
					String curPage = request.getParameter("currentPage");
					int currentPage = Integer.parseInt(curPage);
					int pageSize = 5; /* 每页显示行数 */
					LoginDao lDao = new LoginDao();
					Login l = new Login();
					Map<String, Object> map = new HashMap<String, Object>();
					map = lDao.select4Page(l, currentPage, pageSize);
					List<Login> list = new ArrayList<Login>();
					list = (List<Login>) map.get("data");
					int pageCount = (Integer) map.get("pageCount");
				%>
				
				<div class="container-fluid">
					<div class="row-fluid">
						<div class="span12">
							<table class="table">
								<thead id="thead">
									<th>登录ID</th>
									<th>登录用户</th>
									<th>登录时间</th>
								</thead>
								<tbody id="tbody">
									<%
										int j = 0;
										for(Login login : list){
											if(j % 2 == 0){
									%>
									<tr class = 'success'>
										<td><%=login.getId() %></td>
										<td><%=login.getUserName() %></td>
										<td><%=login.getLoginTime() %></td>
									</tr>
									<%
											}else{
									%>
									<tr class = 'info'>
										<td><%=login.getId() %></td>
										<td><%=login.getUserName() %></td>
										<td><%=login.getLoginTime() %></td>
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
							<li><a href="root/login.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
								}
								if (pageCount > 5) {
									if (currentPage > 1) {
							%>
							<li><a
								href="root/login.jsp?currentPage=<%=currentPage - 1%>">&laquo;</a></li>
							<%
								}
							%>
							<%
								for (int i = 1; i <= 5; i++) {
							%>
							<li><a href="root/login.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
									if (currentPage < pageCount) {
							%>
							<li><a
								href="root/login.jsp?currentPage=<%=currentPage + 1%>">&raquo;</a></li>
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
</body>
</html>