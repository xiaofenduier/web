<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zhaopin.dao.JianliDao"%>
<%@ page import="com.zhaopin.entity.Jianli"%>
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
String jianglipath = "file/";
String shijianpath = "file/";
String pingjiapath = "file/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	String op = request.getParameter("op");
	String uploadPath = "C:/Users/lj/Desktop/1/zhaopin/zhaopin/WebContent/file/";
	if (op.equals("jiangliupload")) {
		jianglipath = "file/";
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
				fi.write(new File(uploadPath, filename));
				jianglipath = jianglipath + filename;
			}
		}
	}
	if (op.equals("pingjiaupload")) {
		pingjiapath = "file/";
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
				fi.write(new File(uploadPath, filename));
				pingjiapath = pingjiapath + filename;
			}
		}
	}
	if (op.equals("shijianupload")) {
		shijianpath = "file/";
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
				fi.write(new File(uploadPath, filename));
				shijianpath = shijianpath + filename;
			}
		}
	}
	if (op.equals("del")) {
		String jianliidStr = request.getParameter("del_id");
		int jianliid = Integer.parseInt(jianliidStr);
		Jianli j = new Jianli();
		j.setId(jianliid);
		JianliDao jDao = new JianliDao();
		int result = jDao.delete(j);
		response.sendRedirect("jianli_info.jsp?state=22");
	}
	if (op.equals("add")) {
		Object idObj = request.getSession().getAttribute("userid");
		int userid = ((Integer)idObj).intValue();
		String name = request.getParameter("add_name");
		String sex = request.getParameter("add_sex");
		String ageStr = request.getParameter("add_age");
		int age = 0;
		if(ageStr != null && ageStr != ""){
			age = Integer.parseInt(ageStr);
		}
		String birthday = request.getParameter("add_birthday");
		String passport = request.getParameter("add_passport");
		String address = request.getParameter("add_address");
		String telphoneStr = request.getParameter("add_telphone");
		long telphone = 0;
		if(telphoneStr != null && telphoneStr != ""){
			telphone = Long.parseLong(telphoneStr);
		}
		String school = request.getParameter("add_school");
		String xueli = request.getParameter("add_xueli");
		String zhuanye = request.getParameter("add_zhuanye");
		String hxueli = request.getParameter("add_hxueli");
		String hzhuanye = request.getParameter("add_hzhuanye");
		String language = request.getParameter("add_language");
		String job = request.getParameter("add_job");
		String gongziStr = request.getParameter("add_gongzi");
		int gongzi = 0;
		if(gongziStr != null && gongziStr != ""){
			gongzi = Integer.parseInt(gongziStr);
		}
		Jianli j = new Jianli();
		j.setUserId(userid);
		j.setName(name);
		j.setSex(sex);
		j.setAge(age);
		j.setPassport(passport);
		j.setBirthday(birthday);
		j.setAddress(address);
		j.setTelphone(telphone);
		j.setSchool(school);
		j.setXueli(xueli);
		j.setZhuanye(zhuanye);
		j.setHxueli(hxueli);
		j.setHzhuanye(hzhuanye);
		j.setLanguage(language);
		j.setJob(job);
		j.setGongzi(gongzi);
		j.setPingjia(pingjiapath);
		j.setShijian(shijianpath);
		j.setJiangli(jianglipath);
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String createtime = formatter.format(date);
		j.setCreateTime(createtime);
		JianliDao jDao = new JianliDao();
		int result = jDao.add(j);
		jianglipath = "file/";
		shijianpath = "file/";
		pingjiapath = "file/";
		response.sendRedirect("jianli_info.jsp?state="+result);
	}
	if(op.equals("update")){
		String idStr = request.getParameter("update_id");
		int id = Integer.parseInt(idStr);
		String name = request.getParameter("update_name");
		String sex = request.getParameter("update_sex");
		String ageStr = request.getParameter("update_age");
		int age = 0;
		if(ageStr != null && ageStr != ""){
			age = Integer.parseInt(ageStr);
		}
		String birthday = request.getParameter("update_birthday");
		String passport = request.getParameter("update_passport");
		String address = request.getParameter("update_address");
		System.out.println(address);
		String telphoneStr = request.getParameter("update_telphone");
		long telphone = 0;
		if(telphoneStr != null && telphoneStr != ""){
			telphone = Long.parseLong(telphoneStr);
		}
		String school = request.getParameter("update_school");
		String xueli = request.getParameter("update_xueli");
		String zhuanye = request.getParameter("update_zhuanye");
		String hxueli = request.getParameter("update_hxueli");
		String hzhuanye = request.getParameter("update_hzhuanye");
		String language = request.getParameter("update_language");
		String job = request.getParameter("update_job");
		String gongziStr = request.getParameter("update_gongzi");
		int gongzi = 0;
		if(gongziStr != null && gongziStr != ""){
			gongzi = Integer.parseInt(gongziStr);
		}
		Jianli j = new Jianli();
		j.setId(id);
		j.setName(name);
		j.setSex(sex);
		j.setAge(age);
		j.setPassport(passport);
		j.setBirthday(birthday);
		j.setAddress(address);
		j.setTelphone(telphone);
		j.setSchool(school);
		j.setXueli(xueli);
		j.setZhuanye(zhuanye);
		j.setHxueli(hxueli);
		j.setHzhuanye(hzhuanye);
		j.setLanguage(language);
		j.setJob(job);
		j.setPingjia(pingjiapath);
		j.setShijian(shijianpath);
		j.setJiangli(jianglipath);
		j.setGongzi(gongzi);
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String createtime = formatter.format(date);
		j.setCreateTime(createtime);
		JianliDao jDao = new JianliDao();
		int result = jDao.update(j);
		jianglipath = "file/";
		shijianpath = "file/";
		pingjiapath = "file/";
		response.sendRedirect("jianli_info.jsp?state=33");
	}
%>
