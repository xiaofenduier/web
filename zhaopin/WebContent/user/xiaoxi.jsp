<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.zhaopin.dao.JianliDao"%>
<%@ page import="com.zhaopin.entity.Jianli"%>
<%@ page import="com.zhaopin.dao.ZhaopinDao"%>
<%@ page import="com.zhaopin.entity.Zhaopin"%>
<%@ page import="com.zhaopin.dao.CompanyDao"%>
<%@ page import="com.zhaopin.entity.Company"%>
<%@ page import="com.zhaopin.dao.ZhiweijianliDao"%>
<%@ page import="com.zhaopin.entity.Zhiweijianli"%>
<%@ page import="com.zhaopin.dao.ZhiweiDao"%>
<%@ page import="com.zhaopin.entity.Zhiwei"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="css/bootstrap-theme.min.css" rel='stylesheet' type='text/css' />
<link href="css/templatemo_main.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/jquery.countdown.css" />
<link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>
<link href="css/font-awesome.css" rel="stylesheet"> 
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/moment-with-locales.min.js"></script>

<link href="css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
<script src="js/sortable.js" type="text/javascript"></script>
<script src="js/fileinput.js" type="text/javascript"></script>
<title>Insert title here</title>
</head>
<body>
<div id="wrapper">
<nav class="navbar nav_bottom" role="navigation">
	<div class="container">
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
<%
Object idObj = request.getSession().getAttribute("userid");
    if(idObj == null){
    	response.sendRedirect("../front/userlogin.jsp?state=100");
    }else{
%>
<div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">我的消息</h1>
                    </div>
                </div>
                <!-- /. ROW  -->
             
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            简历状态
                        </div>
                        <div class="panel-body">
                        <%
                        String curPage = request.getParameter("currentPage");
            			int currentPage = Integer.parseInt(curPage);
            			int pageSize = 3; /* 每页显示行数 */
            			int id = ((Integer)idObj).intValue();
						Jianli jl = new Jianli();
						jl.setUserId(id);
						JianliDao jlDao = new JianliDao();
						List<Jianli> jllist = new ArrayList<Jianli>();
						jllist = jlDao.selectlistu(jl);
						if(jllist != null){
						Map<String, Object> map = new HashMap<String, Object>();
						ZhiweijianliDao zwjlDao = new ZhiweijianliDao();
						map = zwjlDao.selectwithjlid4page(jllist, currentPage, pageSize);
						if(map != null){
						List<Zhiweijianli> list = new ArrayList<Zhiweijianli>();
	        			list = (List<Zhiweijianli>) map.get("data");
	        			int pageCount = (Integer) map.get("pageCount");
	    				for (Zhiweijianli j : list) {
	    					Zhiwei zw = new Zhiwei();
	    					ZhiweiDao zwDao = new ZhiweiDao();
	    					zw.setId(j.getZhiweiid());
	    					zw = zwDao.select(zw);
	    					Zhaopin zp = new Zhaopin();
	    					ZhaopinDao zpDao = new ZhaopinDao();
	    					zp.setId(zw.getZhaopinId());
	    					zp = zpDao.select(zp);
	    					Company c = new Company();
	    					CompanyDao cDao = new CompanyDao();
	    					c.setId(zp.getCompanyId());
	    					c = cDao.selectwithid(c);
	    					String state = "";
	    					if(j.getState() == 1){
	    						state = "等待面试通知";
	    					}
	    					if(j.getState() == -1){
	    						state = "被拒绝";
	    					}
	    					if(j.getState() == 0){
	    						state = "待审核";
	    					}
                        %>
                            <div class="alert alert-success">
                                职位名称:<%=zw.getZhiweiName()%> 状态：<%=state %> 公司：<%=c.getName() %>
                            </div>
                            <%} %>
                        </div>
                        <ul class="pagination">
							<%
								if (pageCount <= 5) {
									for (int i = 1; i <= pageCount; i++) {
							%>
							<li><a href="user/xiaoxi.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
								}
								if (pageCount > 5) {
									if (currentPage > 1) {
							%>
							<li><a
								href="user/xiaoxi.jsp?currentPage=<%=currentPage - 1%>">&laquo;</a></li>
							<%
								}
							%>
							<%
								for (int i = 1; i <= 5; i++) {
							%>
							<li><a href="user/xiaoxi.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
									if (currentPage < pageCount) {
							%>
							<li><a
								href="user/xiaoxi.jsp?currentPage=<%=currentPage + 1%>">&raquo;</a></li>
							<%
								}
								}}}
							%>
						</ul>
                    </div>
                </div>
            </div>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
   <%} %>
</div>
</body>
</html>