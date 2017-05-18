<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.zhaopin.dao.ZhiweiDao"%>
<%@ page import="com.zhaopin.entity.Zhiwei"%>
<%@ page import="com.zhaopin.dao.ZhaopinDao"%>
<%@ page import="com.zhaopin.entity.Zhaopin"%>
<%@ page import="com.zhaopin.dao.CompanyDao"%>
<%@ page import="com.zhaopin.entity.Company"%>
<%@ page import="com.zhaopin.dao.JianliDao"%>
<%@ page import="com.zhaopin.entity.Jianli"%>
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

});
</script>
</head>
<body>
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
    <!-- //banner -->
	<div class="courses_box1">
	   <div class="container">
		<div class="ol-md-12">
			<div class="course_list">
                <div class="table-header clearfix">
                	<div class="name_col">职位名称</div>
                    <div class="name_col">公司名称</div>
                    <div class="name_col">工作地点</div>
                    <div class="id_col">职位月薪</div>
                    <div class="id_col">发布时间</div>
    			</div>
                <ul class="table-list">
                <%
                Zhiwei zhiwei = new Zhiwei();
                Object idObj = request.getSession().getAttribute("userid");
				if(idObj != null){
					int id = ((Integer)idObj).intValue();
					Jianli jl = new Jianli();
					jl.setUserId(id);
					JianliDao jDao = new JianliDao();
					Map<String, Object> jmap = new HashMap<String, Object>();
					jmap = jDao.select4List(jl, 1, 5);
					List<Jianli> jlist = new ArrayList<Jianli>();
	    			jlist = (List<Jianli>) jmap.get("data");
	    			if(jlist.size() > 0){
	    			Collections.sort(jlist, new Comparator<Jianli>() {
	    	            @Override
	    	            public int compare(Jianli j1, Jianli j2) {
	    	                String createtime1 = j1.getCreateTime();
	    	                String createtime2 = j2.getCreateTime();
	    	               	if(createtime1.compareTo(createtime2) > 1){
	    	                    return 1;             
	    	                } else {
	    	                    return -1;
	    	                }
	    	            }
	    	        });
	    			zhiwei.setGongzi(jlist.get(jlist.size()-1).getGongzi());
	    			zhiwei.setZhiweiName(jlist.get(jlist.size()-1).getJob());
                	String curPage = request.getParameter("currentPage");
    			int currentPage = Integer.parseInt(curPage);
    			int pageSize = 10; /* 每页显示行数 */
    			ZhiweiDao zhiweiDao = new ZhiweiDao();
    			Map<String, Object> map = new HashMap<String, Object>();
    			map = zhiweiDao.select4page(zhiwei, currentPage, pageSize);
    			System.out.println(map);
    			if(!map.isEmpty()){
    			List<Zhiwei> list = new ArrayList<Zhiwei>();
    			list = (List<Zhiwei>) map.get("data");
    			int pageCount = (Integer) map.get("pageCount");
				for (Zhiwei z : list) {
					Company c = new Company();
	    			Zhaopin zp = new Zhaopin();
					zp = z.getZp();
					c = zp.getCopmpany();
                %>
                    <li class="clearfix">
    					<div class="name_col"><a href="user/zhiwei_detail.jsp?cid=<%=c.getId()%>&zid=<%=z.getId()%>"><%=z.getZhiweiName() %></a></div>
        				<div class="name_col"><%=c.getName() %></div>
        				<div class="name_col"><%=c.getAddress() %></div>
        				<div class="id_col"><%=z.getGongzi() %></div>
        				<div class="id_col"><%=zp.getStartTime() %></div>
    				</li>
    			<%} %>
    			</ul>
    			<ul class="pagination">
							<%
								if (pageCount <= 5) {
									for (int i = 1; i <= pageCount; i++) {
							%>
							<li><a href="zhiwei_info.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
								}
								if (pageCount > 5) {
									if (currentPage > 1) {
							%>
							<li><a
								href="zhiwei_info.jsp?currentPage=<%=currentPage - 1%>">&laquo;</a></li>
							<%
								}
							%>
							<%
								for (int i = 1; i <= 5; i++) {
							%>
							<li><a href="zhiwei_info.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
									if (currentPage < pageCount) {
							%>
							<li><a
								href="zhiwei_info.jsp?currentPage=<%=currentPage + 1%>">&raquo;</a></li>
							<%
								}
								}}}else{
							%>
							未搜索到相关职位
							<%}}else{
								response.sendRedirect("../front/userlogin.jsp?state=100");
							}
							%>
						</ul>
               </div>
		    </div>
		    <div class="clearfix"> </div>
	   </div>
	</div>
	<script src="js/responsiveslides.min.js"></script>
					 <script>
					 $(document).ready(function(){
						    $(".dropdown").hover(            
						        function() {
						            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
						            $(this).toggleClass('open');        
						        },
						        function() {
						            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
						            $(this).toggleClass('open');       
						        }
						    );
						});
						// You can also use "$(window).load(function() {"
						$(function () {
						  // Slideshow 4
						  $("#slider3").responsiveSlides({
							auto: true,
							pager: true,
							nav: true,
							speed: 500,
							namespace: "callbacks",
							before: function () {
							  $('.events').append("<li>before event fired.</li>");
							},
							after: function () {
							  $('.events').append("<li>after event fired.</li>");
							}
						  });
					
						});
					  </script>
		    <%
		    ZhiweiDao zhiweiDao2 = new ZhiweiDao();
		    Zhiwei z2 = new Zhiwei();
		    List<Zhiwei> z2list = new ArrayList<Zhiwei>();
		    z2list = zhiweiDao2.list();
		    %>
		        <div  id="top" class="callbacks_container">
						<ul class="rslides" id="slider3">
							<li>
								<div class="banner-bg">
									<div class="container">
										<div class="banner-info">
											<h3>热门职位<span><%=z2list.get(0).getZhiweiName() %></span></h3>
											<p><%=z2list.get(0).getGongzi() %></p>
										</div>
										<a href="user/zhiwei_detail.jsp?cid=<%=z2list.get(0).getZp().getCompanyId()%>&zid=<%=z2list.get(0).getId()%>">
                    						<span><i class="fa fa-chain chain_1"></i>查看该职位</span>
                						</a>
									</div>
								</div>
							</li>
							<li>
								<div class="banner-bg banner-img2">
									<div class="container">
										<div class="banner-info">
											<h3>热门职位<span><%=z2list.get(1).getZhiweiName() %></span></h3>
											<p><%=z2list.get(1).getGongzi() %></p>
										</div>
										<a href="user/zhiwei_detail.jsp?cid=<%=z2list.get(1).getZp().getCompanyId()%>&zid=<%=z2list.get(1).getId()%>">
                    						<span><i class="fa fa-chain chain_1"></i>查看该职位</span>
                						</a>
									</div>
								</div>
							</li>
							<li>
								<div class="banner-bg banner-img">
									<div class="container">
										<div class="banner-info">
											<h3>热门职位<span><%=z2list.get(2).getZhiweiName() %></span></h3>
											<p><%=z2list.get(2).getGongzi() %></p>
										</div>
										<a href="user/zhiwei_detail.jsp?cid=<%=z2list.get(2).getZp().getCompanyId()%>&zid=<%=z2list.get(2).getId()%>">
                    						<span><i class="fa fa-chain chain_1"></i>查看该职位</span>
                						</a>
									</div>
								</div>
							</li>
							<li>
								<div class="banner-bg">
									<div class="container">
										<div class="banner-info">
											<h3>热门职位<span><%=z2list.get(3).getZhiweiName() %></span></h3>
											<p><%=z2list.get(3).getGongzi() %></p>
										</div>
										<a href="user/zhiwei_detail.jsp?cid=<%=z2list.get(3).getZp().getCompanyId()%>&zid=<%=z2list.get(3).getId()%>">
                    						<span><i class="fa fa-chain chain_1"></i>查看该职位</span>
                						</a>
									</div>
								</div>
							</li>
							<li>
								<div class="banner-bg banner-img2">
									<div class="container">
										<div class="banner-info">
											<h3>热门职位<span><%=z2list.get(4).getZhiweiName() %></span></h3>
											<p><%=z2list.get(4).getGongzi() %></p>
										</div>
										<a href="user/zhiwei_detail.jsp?cid=<%=z2list.get(4).getZp().getCompanyId()%>&zid=<%=z2list.get(4).getId()%>">
                    						<span><i class="fa fa-chain chain_1"></i>查看该职位</span>
                						</a>
									</div>
								</div>
							</li>
							
						</ul>
		          </div>
</body>
</html>