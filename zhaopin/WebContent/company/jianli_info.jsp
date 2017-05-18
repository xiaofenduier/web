<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.zhaopin.dao.JianliDao"%>
<%@ page import="com.zhaopin.entity.Jianli"%>
<%@ page import="com.zhaopin.dao.ZhaopinDao"%>
<%@ page import="com.zhaopin.entity.Zhaopin"%>
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
<title>Insert title here</title>
<script>
$(document).ready(function(){
	var url = location.href; 
	str=url.split("=")[1];
	state=str.split("&")[0];
	if(state == -200){
		alert("请您等待管理员认证！");
	}
});
</script>
</head>
<body>
<%
String state = request.getParameter("state");
if(state != null && state.equals("-300")){
	request.getSession().removeAttribute("companyid");
	request.getSession().removeAttribute("companyname");
}
%>
<nav class="navbar nav_bottom" role="navigation">
 <div class="container">
    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
        <ul class="nav navbar-nav nav_1">
            <li><a href="company/jianli_info.jsp?currentPage=1">首页</a></li>
			<li><a href="company/myjianli_info.jsp?currentPage=1">投递我的</a></li>
            <li><a href="company/zhiwei.jsp?currentPage=1">我的职位</a></li>
            <li><a href="company/information.jsp">我的基本信息</a></li>
            <%
            Object companyidObj = request.getSession().getAttribute("companyid");
			if (companyidObj == null) {
            %>
            <li style = "margin-left:300px"><a href="front/companylogin.jsp">登录</a></li>
            <%}else{ %>
            <li style = "margin-left:300px"><a href="company/jianli_info.jsp?currentPage=1&state=-300">注销</a></li>
            <%} %>
            <li style = "margin-left:50px"><a href="front/companyregister.jsp">注册</a></li>
        </ul>
      </div>
   </div>
</nav>
<div class="details">
	<div class="container">
	<form method = "post" action = "company/jianli_info.jsp?op=search&currentPage=1"> 
		<div class="col-sm-10 dropdown-buttons">
			<div class="col-sm-3 dropdown-button">           			
    			<div class="input-group">
                	<input class="form-control has-dark-background" name="hxueli" id="hxueli" placeholder="学历" type="text">
              	</div>
			</div>
			<div class="col-sm-3 dropdown-button">           			
    		  	<div class="input-group">
                	<input class="form-control has-dark-background" name="hzhuanye" id="hzhuanye" placeholder="专业" type="text">
              	</div>
			</div>
			<div class="col-sm-3 dropdown-button">           			
    		  	<div class="input-group">
                	<input class="form-control has-dark-background" name="job" id="job" placeholder="期望工作" type="text">
              	</div>
			</div>
			<div class="clearfix"> </div>
		</div> 
		<div class="col-sm-2 submit_button"> 
		   	<input type="submit" value="搜索">
		</div>
		</form>
		<div class="clearfix"> </div>
	</div>
</div>
	<div class="courses_box1">
	   <div class="container">
		<div class="ol-md-12">
			<div class="course_list">
                <div class="table-header clearfix">
                	<div class="name_col">意向职位</div>
                	<div class="id_col">要求工资</div>
                	<div class="name_col">专业</div>
                    <div class="id_col">最高学历</div>
                    <div class="name_col">学校</div>
    			</div>
                <ul class="table-list">
                <%
                request.setCharacterEncoding("UTF-8");
                Jianli jianli = new Jianli();
                String op = request.getParameter("op");
                if(op != null && op != ""){
                	String job = request.getParameter("job");
                	String hxueli = request.getParameter("hxueli");
                	String hzhuanye = request.getParameter("hzhuanye");
                	if(job != null && job != ""){
                		jianli.setJob(job);
                	}
                	if(hxueli != null && hxueli != ""){
                		jianli.setHxueli(hxueli);
                	}
                	if(hzhuanye != null && hzhuanye != ""){
                		jianli.setHzhuanye(hzhuanye);
                	}
                }
                String curPage = request.getParameter("currentPage");
    			int currentPage = Integer.parseInt(curPage);
    			int pageSize = 10; /* 每页显示行数 */
    			JianliDao jianliDao = new JianliDao();
    			Map<String, Object> map = new HashMap<String, Object>();
    			map = jianliDao.select4List(jianli, currentPage, pageSize);
    			List<Jianli> list = new ArrayList<Jianli>();
    			list = (List<Jianli>) map.get("data");
    			int pageCount = (Integer) map.get("pageCount");
				for (Jianli j : list) {
                %>
                    <li class="clearfix">
    					<div class="name_col"><a href="company/jianli_detail.jsp?id=<%=j.getId()%>"><%=j.getJob() %></a></div>
        				<div class="id_col"><%=j.getGongzi() %></div>
        				<div class="name_col"><%=j.getZhuanye() %></div>
        				<div class="id_col"><%=j.getHxueli() %></div>
        				<div class="name_col"><%=j.getSchool() %></div>
    				</li>
    			<%} %>
    			</ul>
    			<ul class="pagination">
							<%
								if (pageCount <= 5) {
									for (int i = 1; i <= pageCount; i++) {
							%>
							<li><a href="company/jianli_info.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
								}
								if (pageCount > 5) {
									if (currentPage > 1) {
							%>
							<li><a
								href="company/jianli_info.jsp?currentPage=<%=currentPage - 1%>">&laquo;</a></li>
							<%
								}
							%>
							<%
								for (int i = 1; i <= 5; i++) {
							%>
							<li><a href="company/jianli_info.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
									if (currentPage < pageCount) {
							%>
							<li><a
								href="company/jianli_info.jsp?currentPage=<%=currentPage + 1%>">&raquo;</a></li>
							<%
								}
								}
							%>
						</ul>
               </div>
		    </div>
		    <div class="clearfix"> </div>
	   </div>
	</div>
</body>
</html>