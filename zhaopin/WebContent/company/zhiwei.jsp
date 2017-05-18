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

<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/moment-with-locales.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function del(zhaopinid, zwid){
	$("#modal-container-937765").modal();
	$("#del_zhaopin_id").val(zhaopinid);
	$("#del_zw_id").val(zwid);
}
function sub(){
	$("#modal-container-937767").modal();
}
function update(zhaopinid, zhaopintelphone, zhaopinstarttime, zhaopinendtime, zwid, zwname, zwgongzi, zwxueli, zwsex, zwage,zwzhuanye, zwrenshu, zwzige, zwzhize){
	$("#modal-container-937766").modal();
	$("#zhaopin_id").val(zhaopinid);
	$("#zhaopin_telphone").val(zhaopintelphone);
	$("#zhaopin_starttime").val(zhaopinstarttime);
	$("#zhaopin_endtime").val(zhaopinendtime);
	$("#zw_id").val(zwid);
	$("#zw_name").val(zwname);
	$("#zw_gongzi").val(zwgongzi);
	$("#zw_xueli").val(zwxueli);
	$("#zw_sex").val(zwsex);
	$("#zw_age").val(zwage);
	$("#zw_zhuanye").val(zwzhuanye);
	$("#zw_renshu").val(zwrenshu);
	$("#zw_zige").val(zwzige);
	$("#zw_zhize").val(zwzhize);
}
$(document).ready(function() {
	var url = location.href; 
	str=url.split("=")[1];
	state=str.split("&")[0];
	if(state == 22){
		alert("删除成功");
	}
	if(state == 33){
		alert("更新成功");
	}
	$('#add_zhaopin_endtime').datetimepicker({
		minView:"month", //选择日期后，不会再跳转去选择时分秒 
		format:"yyyy-mm-dd", //选择日期后，文本框显示的日期格式 
		todayBtn:true,
		autoclose:true //选择日期后自动关闭 
	});
	$('#zhaopin_endtime').datetimepicker({
		minView:"month", //选择日期后，不会再跳转去选择时分秒 
		format:"yyyy-mm-dd", //选择日期后，文本框显示的日期格式 
		todayBtn:true,
		autoclose:true //选择日期后自动关闭 
	});
});
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

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			 <button type="button" class="btn btn-default" style = "margin-top:10px" onclick = "sub()">发布职位</button>
		</div>
	</div>
</div>

	<div class="courses_box1">
	   <div class="container">
		<div class="ol-md-12">
			<div class="course_list">
                <div class="table-header clearfix">
                	<div class="name_col">职位名称</div>
                	<div class="name_col">发布日期</div>
                	<div class="name_col">截止日期</div>
                	<div class="name_col">操作</div>
    			</div>
                <ul class="table-list">
                <div class="container">
					<div class="row clearfix">
						<div class="col-md-12 column">
							<div class="panel-group" id="panel-346784">
                <%
                request.setCharacterEncoding("UTF-8");
                Object companyidObj = request.getSession().getAttribute("companyid");
    			if(companyidObj != null){
    				int companyid = ((Integer)companyidObj).intValue();
    				Company company = new Company();
    				CompanyDao companyDao = new CompanyDao();
    				company.setId(companyid);
    				company = companyDao.selectwithid(company);
    				if(company.getState() != 1){
    					response.sendRedirect("jianli_info.jsp?state=-200&currentPage=1");
    					return;
    				}
    				
    				Zhaopin zp = new Zhaopin();
    				zp.setCompanyId(companyid);
    				ZhaopinDao zpDao = new ZhaopinDao();
    				List<Zhaopin> zplist = new ArrayList<Zhaopin>();
    				String curPage = request.getParameter("currentPage");
    				int currentPage = Integer.parseInt(curPage);
    				int pageSize = 10; /* 每页显示行数 */
    				Map<String, Object> zpmap = new HashMap<String, Object>();
    				zpmap = zpDao.select4Page(zp, currentPage, pageSize);
    				zplist = (List<Zhaopin>) zpmap.get("data");
    				int pageCount = (Integer) zpmap.get("pageCount");
    				for(Zhaopin zhaopin : zplist){
    					Zhiwei zw = new Zhiwei();
    					ZhiweiDao zwDao = new ZhiweiDao();
    					zw.setZhaopinId(zhaopin.getId());
    					zw = zwDao.selectwithzhaopinid(zw);
                %>
                    <div class="panel panel-default">
					<div class="panel-heading">
						 
						 	<li class="clearfix">
						 		<div class="name_col">
						 			<a class="panel-title" data-toggle="collapse" data-parent="#panel-346784" href="#panel-element-515677-<%=zhaopin.getId()%>">
    									<%=zw.getZhiweiName() %>
    								</a>
    							</div>
        						<div class="name_col"><%=zhaopin.getStartTime() %></div>
        						<div class="name_col"><%=zhaopin.getEndTime() %></div>
        						<div class="name_col">
        							<button class="btn btn-primary" onclick="del(<%=zhaopin.getId()%>, <%=zw.getId()%>)">
										删除
									</button>
									<button class="btn btn-danger" onclick="update(<%=zhaopin.getId()%>, <%=zhaopin.getTelphone()%>, '<%=zhaopin.getStartTime()%>', '<%=zhaopin.getEndTime()%>',<%=zw.getId()%>,'<%=zw.getZhiweiName()%>',<%=zw.getGongzi()%>,'<%=zw.getZuidixueli()%>','<%=zw.getSex()%>',<%=zw.getAge()%>,'<%=zw.getZhuanye()%>',<%=zw.getRenshu()%>,'<%=zw.getZige()%>','<%=zw.getZhize()%>')">
										修改
									</button>
        						</div>
    						</li>
						<li class="clearfix"></li>
					</div>
					<div id="panel-element-515677-<%=zhaopin.getId()%>" class="panel-collapse collapse">
						<div class="panel-body">
							<ul>
								<li>工资：<%=zw.getGongzi() %> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;最低学历：<%=zw.getZuidixueli() %> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;专业：<%=zw.getZhuanye() %></li>
								<li>性别：<%=zw.getSex() %>&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;年龄：<%=zw.getAge() %> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;人数：<%=zw.getRenshu() %></li>
								任职资格：<li><%=zw.getZige() %></li>
								职位职责：<li><%=zw.getZhize() %></li>
							</ul>
						</div>
					</div>
				</div>
    			<%} %>
    			</ul>
    			<ul class="pagination">
							<%
								if (pageCount <= 5) {
									for (int i = 1; i <= pageCount; i++) {
							%>
							<li><a href="company/zhiwei.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
								}
								if (pageCount > 5) {
									if (currentPage > 1) {
							%>
							<li><a
								href="company/zhiwei.jsp?currentPage=<%=currentPage - 1%>">&laquo;</a></li>
							<%
								}
							%>
							<%
								for (int i = 1; i <= 5; i++) {
							%>
							<li><a href="company/zhiwei.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
									if (currentPage < pageCount) {
							%>
							<li><a
								href="company/jianli_info.jsp?currentPage=<%=currentPage + 1%>">&raquo;</a></li>
							<%
								}
								}
    			}else{
    				response.sendRedirect("../front/companylogin.jsp?state=100");
    			}
							%>
						</ul>
               </div>
		    </div>
		    <div class="clearfix"> </div>
	   </div>
	</div>
	
<!-- 删除-->
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="modal fade" id="modal-container-937765" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<form role="form" action="company/zhiweiDao.jsp?op=del" method="post">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">删除</h4>
							</div>
							<div class="modal-body">
								确认删除？
								<div class="form-group">
									<input id="del_zhaopin_id" name="del_zhaopin_id" class="form-control" type="hidden">
									<input id="del_zw_id" name="del_zw_id" class="form-control" type="hidden">
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
<!-- 修改 -->
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="modal fade" id="modal-container-937766" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<form role="form" action="company/zhiweiDao.jsp?op=update" method="post">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">修改</h4>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<label>招聘编号</label> 
									<input id="zhaopin_id" name="zhaopin_id" class="form-control" type="text" readonly>
								</div>
								<div class="form-group">
									<label>招聘联系方式</label> 
									<input id="zhaopin_telphone" name="zhaopin_telphone" class="form-control" type="text">
								</div>
	<!-- 							<div class="form-group">
									<label>招聘开始时间</label> 
									<form role="form" id = "starttime">
										<input type="text" id="zhaopin_starttime" name="zhaopin_starttime" readonly class="form-control" />
									</form>
								</div> -->
								<div class="form-group">
									<label>招聘截止时间</label> 
									<form role="form" id = "endtime">
										<input type="text" id="zhaopin_endtime" name="zhaopin_endtime" readonly class="form-control" />
									</form>
								</div>
								<div class="form-group">
									<label>职位编号</label> 
									<input id="zw_id" name="zw_id" class="form-control" type="text" readonly>
								</div>
								<div class="form-group">
									<label>职位名称</label> 
									<input id="zw_name" name="zw_name" class="form-control" type="text">
								</div>
								<div class="form-group">
									<label>职位工资</label> 
									<input id="zw_gongzi" name="zw_gongzi" class="form-control" type="text">
								</div>
								<div class="form-group">
									<label>职位要求学历</label> 
									<input id="zw_xueli" name="zw_xueli" class="form-control" type="text">
								</div>
								<div class="form-group">
									<label>性别</label> 
									<select class="form-control" id="zw_sex" name="zw_sex">
										<option value="男">男</option>
										<option value="女">女</option>
										<option value="不限">不限</option>
									</select>
								</div>
								<div class="form-group">
									<label>年龄</label> 
									<input id="zw_age" name="zw_age" class="form-control" type="text">
								</div>
								<div class="form-group">
									<label>专业</label> 
									<input id="zw_zhuanye" name="zw_zhuanye" class="form-control" type="text">
								</div>
								<div class="form-group">
									<label>人数</label> 
									<input id="zw_renshu" name="zw_renshu" class="form-control" type="text">
								</div>
								<div class="form-group">
									<label>任职资格</label> 
									<input id="zw_zige" name="zw_zige" class="form-control" type="text">
								</div>
								<div class="form-group">
									<label>职责</label> 
									<input id="zw_zhize" name="zw_zhize" class="form-control" type="text">
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
<!-- 新增 -->
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="modal fade" id="modal-container-937767" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<form role="form" action="company/zhiweiDao.jsp?op=sub" method="post">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">发布</h4>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<label>招聘联系方式</label> 
									<input id="add_zhaopin_telphone" name="add_zhaopin_telphone" class="form-control" type="text">
								</div>
								<div class="form-group">
									<label>招聘截止时间</label> 
									<form role="form" id = "endtime">
										<input type="text" id="add_zhaopin_endtime" name="add_zhaopin_endtime" readonly class="form-control" />
									</form>
								</div>
								<div class="form-group">
									<label>职位名称</label> 
									<input id="add_zw_name" name="add_zw_name" class="form-control" type="text">
								</div>
								<div class="form-group">
									<label>职位工资</label> 
									<input id="add_zw_gongzi" name="add_zw_gongzi" class="form-control" type="text">
								</div>
								<div class="form-group">
									<label>职位要求学历</label> 
									<input id="add_zw_xueli" name="add_zw_xueli" class="form-control" type="text">
								</div>
								<div class="form-group">
									<label>性别</label> 
									<select class="form-control" id="add_zw_sex" name="add_zw_sex">
										<option value="男">男</option>
										<option value="女">女</option>
										<option value="不限">不限</option>
									</select>
								</div>
								<div class="form-group">
									<label>年龄</label> 
									<input id="add_zw_age" name="add_zw_age" class="form-control" type="text">
								</div>
								<div class="form-group">
									<label>专业</label> 
									<input id="add_zw_zhuanye" name="add_zw_zhuanye" class="form-control" type="text">
								</div>
								<div class="form-group">
									<label>人数</label> 
									<input id="add_zw_renshu" name="add_zw_renshu" class="form-control" type="text">
								</div>
								<div class="form-group">
									<label>任职资格</label> 
									<input id="add_zw_zige" name="add_zw_zige" class="form-control" type="text">
								</div>
								<div class="form-group">
									<label>职责</label> 
									<input id="add_zw_zhize" name="add_zw_zhize" class="form-control" type="text">
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