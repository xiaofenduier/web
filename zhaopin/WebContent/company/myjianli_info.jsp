<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.zhaopin.dao.JianliDao"%>
<%@ page import="com.zhaopin.entity.Jianli"%>
<%@ page import="com.zhaopin.dao.ZhaopinDao"%>
<%@ page import="com.zhaopin.entity.Zhaopin"%>
<%@ page import="com.zhaopin.dao.CompanyDao"%>
<%@ page import="com.zhaopin.entity.Company"%>
<%@ page import="com.zhaopin.dao.ZhiweiDao"%>
<%@ page import="com.zhaopin.entity.Zhiwei"%>
<%@ page import="com.zhaopin.dao.ZhiweijianliDao"%>
<%@ page import="com.zhaopin.entity.Zhiweijianli"%>
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
<script type="text/javascript">
function tongguo(id){
	$("#modal-container-937765").modal();
	$("#check_id").val(id);
}
function refuse(id){
	$("#modal-container-937766").modal();
	$("#refuse_id").val(id);
}
</script>
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
	<div class="courses_box1">
	   <div class="container">
		<div class="ol-md-12">
			<div class="course_list">
                <div class="table-header clearfix">
                	<div class="id_col">意向职位</div>
                	<div class="id_col">公司职位</div>
                	<div class="id_col">要求工资</div>
                	<div class="name_col">专业</div>
                    <div class="id_col">最高学历</div>
                    <div class="id_col">学校</div>
                    <div class="id_col">操作</div>
    			</div>
                <ul class="table-list">
                <%
                request.setCharacterEncoding("UTF-8");
                Jianli jianli = new Jianli();
                List<Integer> zwjlidlist = new ArrayList<Integer>();
                Object companyidObj = request.getSession().getAttribute("companyid");
    			if(companyidObj != null){
    				int companyid = ((Integer)companyidObj).intValue();
    				Zhaopin zp = new Zhaopin();
    				zp.setCompanyId(companyid);
    				ZhaopinDao zpDao = new ZhaopinDao();
    				List<Zhaopin> zplist = new ArrayList<Zhaopin>();
    				zplist = zpDao.selectList(zp);
    				if(zplist.size() > 0){
    				for(Zhaopin zhaopin : zplist){
    					Zhiwei zw = new Zhiwei();
    					ZhiweiDao zwDao = new ZhiweiDao();
    					zw.setZhaopinId(zhaopin.getId());
    					zw = zwDao.selectwithzhaopinid(zw);
    					zwjlidlist.add(zw.getId());
    				}
    				String curPage = request.getParameter("currentPage");
        			int currentPage = Integer.parseInt(curPage);
        			int pageSize = 10; /* 每页显示行数 */
        			Zhiweijianli zwjl = new Zhiweijianli();
        			ZhiweijianliDao zwjlDao = new ZhiweijianliDao();
        			Map<String, Object> map = new HashMap<String, Object>();
        			map = zwjlDao.selectwithList4page(zwjlidlist, currentPage, pageSize);
        			List<Zhiweijianli> list = new ArrayList<Zhiweijianli>();
        			list = (List<Zhiweijianli>) map.get("data");
        			int pageCount = (Integer) map.get("pageCount");
    				for (Zhiweijianli j : list) {
    					Jianli jl = new Jianli();
    					JianliDao jlDao = new JianliDao();
    					jl.setId(j.getJianliid());
    					jl = jlDao.select(jl);
    					Zhiwei zw = new Zhiwei();
    					ZhiweiDao zwDao = new ZhiweiDao();
    					zw.setId(j.getZhiweiid());
    					zw = zwDao.select(zw);
                	%>
                    <li class="clearfix">
    					<div class="id_col"><a href="company/jianli_detail.jsp?id=<%=jl.getId()%>"><%=jl.getJob() %></a></div>
        				<div class="id_col"><%=zw.getZhiweiName() %></div>
        				<div class="id_col"><%=jl.getGongzi() %></div>
        				<div class="name_col"><%=jl.getZhuanye() %></div>
        				<div class="id_col"><%=jl.getHxueli() %></div>
        				<div class="id_col"><%=jl.getSchool() %></div>
        				<div class="id_col">
        					<button class="btn btn-primary" onclick="tongguo(<%=j.getId()%>)">通过</button>
							<button class="btn btn-danger" onclick="refuse(<%=j.getId()%>)" style = "margin-top:-34px;margin-left:70px">拒绝</button>
        				</div>
    				</li>
    			<%} %>
    			</ul>
    			<ul class="pagination">
							<%
								if (pageCount <= 5) {
									for (int i = 1; i <= pageCount; i++) {
							%>
							<li><a href="company/myjianli_info.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
								}
								if (pageCount > 5) {
									if (currentPage > 1) {
							%>
							<li><a
								href="company/myjianli_info.jsp?currentPage=<%=currentPage - 1%>">&laquo;</a></li>
							<%
								}
							%>
							<%
								for (int i = 1; i <= 5; i++) {
							%>
							<li><a href="company/myjianli_info.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
									if (currentPage < pageCount) {
							%>
							<li><a
								href="company/myjianli_info.jsp?currentPage=<%=currentPage + 1%>">&raquo;</a></li>
							<%
								}
								}}}else{
									response.sendRedirect("../front/companylogin.jsp?state=100");
								}
							%>
						</ul>
               </div>
		    </div>
		    <div class="clearfix"> </div>
	   </div>
	</div>
	
<!-- 通过-->
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="modal fade" id="modal-container-937765" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<form role="form" action="company/myjianliDao.jsp?op=tongguo" method="post">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">通过</h4>
							</div>
							<div class="modal-body">
								确认通过？
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
<!-- 拒绝 -->
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="modal fade" id="modal-container-937766" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<form role="form" action="company/myjianliDao.jsp?op=refuse" method="post">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">拒绝</h4>
							</div>
							<div class="modal-body">
								确认拒绝？
								<div class="form-group">
									<input id="refuse_id" name="refuse_id" class="form-control" type="hidden">
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