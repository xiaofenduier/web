<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.zhaopin.dao.ZhiweiDao"%>
<%@ page import="com.zhaopin.entity.Zhiwei"%>
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
</head>
<body>
<%
String state = request.getParameter("state");
if(state != null){
	request.getSession().removeAttribute("userid");
	request.getSession().removeAttribute("username");
}
%>
<nav class="navbar nav_bottom" role="navigation">
 <div class="container">
    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
        <ul class="nav navbar-nav nav_1">
            <li><a href="user/zhiwei_info.jsp?currentPage=1">首页</a></li>
			<li><a href="user/jianli_info.jsp">简历管理</a></li>
            <li><a href="user/xiaoxi.jsp?currentPage=1">我的消息</a></li>
            <li><a href="user/tuijian.jsp?currentPage=1">我的推荐</a></li>
            <li><a href="user/information.jsp">个人信息</a></li>
            <%
            Object idObj = request.getSession().getAttribute("userid");
			if (idObj == null) {
            %>
            <li style = "margin-left:300px"><a href="front/userlogin.jsp">登录</a></li>
            <%}else{ %>
            <li style = "margin-left:300px"><a href="user/zhiwei_info.jsp?currentPage=1&state=-300">注销</a></li>
            <%} %>
            <li style = "margin-left:50px"><a href="front/userregister.jsp">注册</a></li>
            
        </ul>
      </div>
   </div>
</nav>
<!-- banner -->
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
<div class="features" style = "margin-top:-60px"><div class="container">
    <img src="img/b2.jpg" class="img-responsive" alt=""/></a> 
</div></div>
<div class="details">
	<div class="container">
	<form method = "post" action = "user/zhiwei_info.jsp?op=search&currentPage=1"> 
		<div class="col-sm-10 dropdown-buttons">
			<div class="col-sm-3 dropdown-button">           			
    			<div class="input-group">
                	<input class="form-control has-dark-background" name="zhiweiname" id="zhiweiname" placeholder="职位名称" type="text">
              	</div>
			</div>
			<div class="col-sm-3 dropdown-button">           			
    		  	<div class="input-group">
                	<input class="form-control has-dark-background" name="gongzi" id="gongzi" placeholder="月薪" type="text">
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
                List<Integer> idlist = new ArrayList<Integer>();
                String op = request.getParameter("op");
                if(op != null && op != ""){
                	String companyname = request.getParameter("companyname");
                	System.out.println(companyname);
                	String zhiweiname = request.getParameter("zhiweiname");
                	String address = request.getParameter("address");
                	String gongziStr = request.getParameter("gongzi");
                	if(gongziStr != null && gongziStr != ""){
                		int gongzi = Integer.parseInt(gongziStr);
                		zhiwei.setGongzi(gongzi);
                	}
                	if(zhiweiname != null && zhiweiname != ""){
                		zhiwei.setZhiweiName(zhiweiname);
                	}
                	Company c = new Company();
                	if(companyname != null && companyname != ""){
                		c.setName(companyname);
                	}
                	if(address != null && address != ""){
                		c.setAddress(address);
                	}
                	CompanyDao cDao = new CompanyDao();
                	c = cDao.selectwithname(c);
                	if(c != null){
                		List<Zhaopin> zlist = new ArrayList<Zhaopin>();
                		Zhaopin zp = new Zhaopin();
                		zp.setCompanyId(c.getId());
                		ZhaopinDao zDao = new ZhaopinDao();
                		zlist = zDao.selectList(zp);
                		if(zlist.size() > 0){
                			for(Zhaopin z : zlist){
                				idlist.add(z.getId());
                			}
                		}
                	}
                }
                String curPage = request.getParameter("currentPage");
    			int currentPage = Integer.parseInt(curPage);
    			int pageSize = 10; /* 每页显示行数 */
    			ZhiweiDao zhiweiDao = new ZhiweiDao();
    			Map<String, Object> map = new HashMap<String, Object>();
    			map = zhiweiDao.select4pageandlist(idlist, zhiwei, currentPage, pageSize);
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
							<li><a href="user/zhiwei_info.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
								}
								if (pageCount > 5) {
									if (currentPage > 1) {
							%>
							<li><a
								href="user/zhiwei_info.jsp?currentPage=<%=currentPage - 1%>">&laquo;</a></li>
							<%
								}
							%>
							<%
								for (int i = 1; i <= 5; i++) {
							%>
							<li><a href="user/zhiwei_info.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
									if (currentPage < pageCount) {
							%>
							<li><a
								href="user/zhiwei_info.jsp?currentPage=<%=currentPage + 1%>">&raquo;</a></li>
							<%
								}
								}}else{
							%>
							未搜索到相关职位
							<%} %>
						</ul>
               </div>
		    </div>
		    <div class="clearfix"> </div>
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
		    
<div class="bottom_content">  
   	 <h3>公司</h3>
     <div class="grid_2">
    <%
	List<Company> list = new ArrayList<Company>();
	CompanyDao companyDao = new CompanyDao();
	list = companyDao.select4list();
	%>	 
     	<div class="col-md-4 portfolio-left">
            <div class="portfolio-img event-img">
                <img src="<%=list.get(0).getPic() %>" class="img-responsive" alt=""/>
                <div class="over-image"></div>
            </div>
            <div class="portfolio-description">
            	<span><%=list.get(0).getName()%></span>
                <a href="user/zhiwei_info.jsp?op=search&currentPage=1&companyname=<%=list.get(0).getName()%>">
                    <span><i class="fa fa-chain chain_1"></i>查看该公司</span>
                </a>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="col-md-4 portfolio-left">
            <div class="portfolio-img event-img">
                <img src="<%=list.get(1).getPic() %>" class="img-responsive" alt=""/>
                 <div class="over-image"></div>
            </div>
            <div class="portfolio-description">
            	<span><%=list.get(1).getName()%></span>
                <a href="user/zhiwei_info.jsp?op=search&currentPage=1&companyname=<%=list.get(1).getName()%>">
                    <span><i class="fa fa-chain chain_1"></i>查看该公司</span>
                </a>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="col-md-4 portfolio-left">
            <div class="portfolio-img event-img">
                <img src="<%=list.get(2).getPic() %>" class="img-responsive" alt=""/>
                 <div class="over-image"></div>
            </div>
            <div class="portfolio-description">
            	<span><%=list.get(2).getName()%></span>
                <a href="user/zhiwei_info.jsp?op=search&currentPage=1&companyname=<%=list.get(2).getName()%>">
                    <span><i class="fa fa-chain chain_1"></i>查看该公司</span>
                </a>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>
     </div>
     <div class="grid_3">
     	<div class="col-md-4 portfolio-left">
            <div class="portfolio-img event-img">
                <img src="<%=list.get(3).getPic() %>" class="img-responsive" alt=""/>
                 <div class="over-image"></div>
            </div>
            <div class="portfolio-description">
            	<span><%=list.get(3).getName()%></span>
                <a href="user/zhiwei_info.jsp?op=search&currentPage=1&companyname=<%=list.get(3).getName()%>">
                    <span><i class="fa fa-chain chain_1"></i>查看该公司</span>
                </a>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="col-md-4 portfolio-left">
            <div class="portfolio-img event-img">
                <img src="<%=list.get(4).getPic() %>" class="img-responsive" alt=""/>
                 <div class="over-image"></div>
            </div>
            <div class="portfolio-description">
            	<span><%=list.get(4).getName()%></span>
                <a href="user/zhiwei_info.jsp?op=search&currentPage=1&companyname=<%=list.get(4).getName()%>">
                    <span><i class="fa fa-chain chain_1"></i>查看该公司</span>
                </a>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="col-md-4 portfolio-left">
            <div class="portfolio-img event-img">
                <img src="<%=list.get(5).getPic() %>" class="img-responsive" alt=""/>
                 <div class="over-image"></div>
            </div>
            <div class="portfolio-description">
               	<span><%=list.get(5).getName()%></span>
                <a href="user/zhiwei_info.jsp?op=search&currentPage=1&companyname=<%=list.get(5).getName()%>">
                    <span><i class="fa fa-chain chain_1"></i>查看该公司</span>
                </a>
            </div>
            <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>
     </div>
</div>
		    
		    
	   </div>
	</div>
</body>
</html>