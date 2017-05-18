<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.zhaopin.dao.JianliDao"%>
<%@ page import="com.zhaopin.entity.Jianli"%>
<%@ page import="com.zhaopin.dao.ZhaopinDao"%>
<%@ page import="com.zhaopin.entity.Zhaopin"%>
<%@ page import="com.zhaopin.dao.ZhiweijianliDao"%>
<%@ page import="com.zhaopin.entity.Zhiweijianli"%>
<%@ page import="com.zhaopin.dao.ZhiweiDao"%>
<%@ page import="com.zhaopin.entity.Zhiwei"%>
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
function select(){
	$("#modal-container-42315").modal();
}
</script>
</head>
<body>
<nav class="navbar nav_bottom" role="navigation">
	<div class="container">
  	<!-- Brand and toggle get grouped for better mobile display -->
    	<div class="navbar-header nav_2">
      		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
        		<span class="sr-only">Toggle navigation</span>
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>
      		</button>
      	<a class="navbar-brand" href="#"></a>
    	</div> 
    	<!-- Collect the nav links, forms, and other content for toggling -->
    	<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
        	<ul class="nav navbar-nav nav_1">
            	<li><a href="user/zhiwei_info.jsp?currentPage=1">首页</a></li>
				<li><a href="user/jianli_info.jsp">简历管理</a></li>
            	<li><a href="user/xiaoxi.jsp?currentPage=1">我的消息</a></li>
            	<li><a href="user/tuijian.jsp?currentPage=1">我的推荐</a></li>
            	<li><a href="user/information.jsp">个人信息</a></li>
            	<li style = "margin-left:300px"><a href="user/zhiwei_info.jsp?currentPage=1&state=-300">注销</a></li>
        	</ul>
     	</div><!-- /.navbar-collapse -->
   	</div>
</nav>

   <!-- //banner -->
<div class="courses_box1">
	<div class="container">
		<div class="col-md-3">
            	<div class="personBox_1">
                	<div class="person_image_desc">
                   		<h1>公司介绍</h1>
                	</div>
                	<div class="clearfix"> </div>
            	</div>
            	<div class="person_description">
            	<%
                	String companyidStr = request.getParameter("cid");
    				int companyid = Integer.parseInt(companyidStr);
    				Company c = new Company();
    				c.setId(companyid);
    				CompanyDao cDao = new CompanyDao();
    				c = cDao.selectwithid(c);
                %>
                	<p><%=c.getIntroduce() %></p>
            	</div>
       
	      	<ul class="posts">
	      		<h3>联系我们</h3>
				<li>
					<article class="entry-item">
						<div class="entry-content">
							<h6>地址</h6>
							<p><%=c.getAddress() %></p>
						</div>
						<div class="clearfix"> </div>
					</article>
				</li>
				<li>
					<article class="entry-item">
						<div class="entry-content">
							<h6>电话</h6>
							<p><%=c.getTelphone() %></p>
						</div>
						<div class="clearfix"> </div>
					</article>
				</li>
				<li>
					<article class="entry-item">
						<div class="entry-content">
							<h6>经营范围</h6>
							<p><%=c.getRange() %></p>
						</div>
						<div class="clearfix"> </div>
					</article>
				</li>
         	</ul>
		</div>
		
		<div class="col-md-9">
		<%
		Zhiwei z = new Zhiwei();
		ZhiweiDao zDao = new ZhiweiDao();
		String zhiweiidStr = request.getParameter("zid");
		int zhiweiid = Integer.parseInt(zhiweiidStr);
		z.setId(zhiweiid);
		z = zDao.select(z);
		Zhaopin zp = new Zhaopin();
		zp = z.getZp();
		%>
		<div class="course_list">
			<div class="table-header clearfix">
                <div class="name_col">职位月薪</div>
    		</div>
            <ul class="table-list">
            	<li class="clearfix">
            		<div><%=z.getGongzi() %></div>
            	</li>
            </ul>
            <div class="table-header clearfix">
                <div class="name_col">工作地点</div>
    		</div>
            <ul class="table-list">
            	<li class="clearfix">
            		<div><%=c.getAddress() %></div>
            	</li>
            </ul>
            <div class="table-header clearfix">
                <div class="name_col">发布日期</div>
    		</div>
            <ul class="table-list">
            	<li class="clearfix">
            		<div><%=zp.getStartTime() %></div>
            	</li>
            </ul>
            <div class="table-header clearfix">
                <div class="name_col">最低学历</div>
    		</div>
            <ul class="table-list">
            	<li class="clearfix">
            		<div><%=z.getZuidixueli() %></div>
            	</li>
            </ul>
            <div class="table-header clearfix">
                <div class="name_col">招聘人数</div>
    		</div>
            <ul class="table-list">
            	<li class="clearfix">
            		<div><%=z.getRenshu() %></div>
            	</li>
            </ul>
            <div class="table-header clearfix">
                <div class="name_col">岗位职责</div>
    		</div>
            <ul class="table-list">
            	<li class="clearfix">
            		<div><%=z.getZhize() %></div>
            	</li>
            </ul>
            <div class="table-header clearfix">
                <div class="name_col">任职资格</div>
    		</div>
            <ul class="table-list">
            	<li class="clearfix">
            		<div><%=z.getZige() %></div>
            	</li>
            </ul>
            
            <br>
            <div class="container">
				<div class="row clearfix">
					<div class="col-md-12 column">
			 			<button type="button" class="btn btn-default" style = "background:yellow" onclick="select()">申请该职位</button>
					</div>
				</div>
			</div>
			<br>
		</div>
		<div class="clearfix"> </div>
	</div>
</div>

<%
						Object idObj = request.getSession().getAttribute("userid");
						if(idObj != null){
							int id = ((Integer)idObj).intValue();
							JianliDao jlDao = new JianliDao();
							Jianli jl = new Jianli();
							jl.setUserId(id);
							Map<String, Object> map = new HashMap<String, Object>();
							map = jlDao.select4List(jl, 1, 5);
							List<Jianli> list = new ArrayList<Jianli>();
			    			list = (List<Jianli>) map.get("data");
			    			if(list.size() > 0){
						%>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="modal fade" id="modal-container-42315" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">
								选择简历
							</h4>
						</div>
						<form action="user/zhiweijianliDao.jsp?op=choice" method = "post">
						<div class="modal-body">
								<input type = "hidden" name = "zhiweiid" value = "<%=zhiweiid %>">
								<div class="btn-toolbar" role="toolbar">
									<div class="btn-group">
										<select class="form-control" id="jianliid" name="jianliid" style="width:500px">
											<%
												for (Jianli j : list) {
											%>
											<option value="<%=j.getId()%>"><%=j.getId()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;创建时间：<%=j.getCreateTime() %></option>
											<%
												}
											%>
										</select>
									</div>
								</div>
						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="submit" class="btn btn-primary">投递</button>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%}else{%>
	<script type="text/javascript">
		alert("请先创建一份简历");
	</script>
<% }} %>
</body>
</html>	