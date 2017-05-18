<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.CompanyDao"%>
<%@ page import="com.zhaopin.entity.Company"%>
<%@ page import="com.zhaopin.dao.UserDao"%>
<%@ page import="com.zhaopin.entity.User"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.io.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%!
String localpath = "img/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	String op = request.getParameter("op");
	String uploadPath = "C:/Users/lj/Desktop/1/zhaopin/zhaopin/WebContent/img/";
	if (op.equals("upload")) {
		localpath = "img/";
		//实例化一个硬盘工厂，用来配置上传文件ServletFileUpload
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(4096);//设置缓冲区大小，这里是4kb
		ServletFileUpload upload = new ServletFileUpload(factory);
		//用以上工厂实例化上传组件
		upload.setHeaderEncoding("utf-8");
		upload.setFileSizeMax(4194304); //设置最大文件尺寸，这里是4MB
		//设置上传地址
		List items = upload.parseRequest(request); //得到所有的上传文件
		Iterator it = items.iterator();
		while (it.hasNext()) {
			FileItem fi = (FileItem) it.next();
			if (fi.isFormField()) {
				Map<String, Object> maps = new HashMap<String, Object>();
				maps.put("statue", "ok");
				out.print(maps);
			} else {
				String filename = fi.getName();
				System.out.println(filename);
				System.out.println(filename);
				fi.write(new File(uploadPath, filename));
				localpath = localpath + filename;
			}
		}
	}
	if (op.equals("company")) {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String telphoneStr = request.getParameter("telphone");
		long telphone = Long.parseLong(telphoneStr);
		String range = request.getParameter("range");
		String code = request.getParameter("code");
		String shuiwuStr = request.getParameter("shuiwu");
		long shuiwu = 0;
		if(shuiwuStr != null && shuiwuStr != ""){
			shuiwu = Long.parseLong(shuiwuStr);
		}
		String timeStr = request.getParameter("time");
		String yyzz = request.getParameter("yyzz");
		String xy = request.getParameter("xy");
		String username = request.getParameter("username");
		String userpassport = request.getParameter("userpassport");
		String introduce = request.getParameter("introduce");
		
		Company c = new Company();
		c.setAddress(address);
		c.setCode(code);
		c.setName(name);
		c.setPassword(password);
		c.setRange(range);
		c.setShuiwu(shuiwu);
		c.setTelphone(telphone);
		c.setTime(timeStr);
		c.setUserName(username);
		c.setUserPassport(userpassport);
		c.setXy(xy);
		c.setYyzz(yyzz);
		c.setIntroduce(introduce);
		c.setPic(localpath);
		localpath = "img/";
		
		CompanyDao cDao = new CompanyDao();
		int result = cDao.add(c);
		response.sendRedirect("companylogin.jsp");
	}
	if (op.equals("user")) {
		String realname = request.getParameter("realname");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String telphoneStr = request.getParameter("telphone");
		long telphone = Long.parseLong(telphoneStr);
		String email = request.getParameter("email");
		
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		user.setRealName(realname);
		user.setSex(sex);
		user.setTelphone(telphone);
		user.setJianliId(0);
		
		UserDao userDao = new UserDao();
		int result = userDao.add(user);
		response.sendRedirect("userlogin.jsp?state="+result);
	}
%>
