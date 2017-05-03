<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.hospital.dao.DoctorDao"%>
<%@ page import="com.hospital.entity.Doctor"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%!String localpath = "img/";%>
<!-- 封装doctor对象 -->
<%
	request.setCharacterEncoding("UTF-8");
	String op = request.getParameter("op");
	Doctor doctor = new Doctor();
	DoctorDao doctorDao = new DoctorDao();
	String uploadPath = "C:/Users/lj/Desktop/1/hospital2/hospital2/WebRoot/img/";
	if (op.equals("uploadpic")) {
		//实例化一个硬盘工厂，用来配置上传文件ServletFileUpload
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(4096);//设置缓冲区大小，这里是4kb
		ServletFileUpload upload = new ServletFileUpload(factory);
		//用以上工厂实例化上传组件
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
				fi.write(new File(uploadPath, filename));
				localpath = localpath + filename;
			}
		}
	}
	if (op.equals("update")) {
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String introduce = request.getParameter("introduce");
		String departmentIdStr = request.getParameter("departmentid");
		int departmentId = 0;
		if (departmentIdStr != null && departmentIdStr != "") {
			departmentId = Integer.parseInt(departmentIdStr);
		}
		String sexStr = request.getParameter("sex");
		int sex = 0;
		if (sexStr != null && sexStr != "") {
			sex = Integer.parseInt(sexStr);
		}
		String levelStr = request.getParameter("level");
		int level = 0;
		if (levelStr != null && levelStr != "") {
			level = Integer.parseInt(levelStr);
		}
		String time = request.getParameter("time");
		doctor.setId(id);
		doctor.setIntroduce(introduce);
		doctor.setName(name);
		doctor.setSex(sex);
		doctor.setLevel(level);
		doctor.setDepartmentId(departmentId);
		doctor.setTime(time);
		doctor.setPassword(password);
		int result = doctorDao.update(doctor);
		response.sendRedirect("doctor_info.jsp?currentPage=1");
	}
	if (op.equals("add")) {
		String name = request.getParameter("add_name");
		String introduce = request.getParameter("add_introduce");
		String sexStr = request.getParameter("add_sex");
		System.out.println(sexStr);
		int sex = Integer.parseInt(sexStr);
		String password = request.getParameter("add_password");
		String levelStr = request.getParameter("add_level");
		int level = Integer.parseInt(levelStr);
		String time = request.getParameter("add_time");
		String departmentIdStr = request.getParameter("add_departmentid");
		int departmentId = Integer.parseInt(departmentIdStr);
		doctor.setIntroduce(introduce);
		doctor.setPic(localpath);
		doctor.setName(name);
		doctor.setSex(sex);
		doctor.setLevel(level);
		doctor.setDepartmentId(departmentId);
		doctor.setTime(time);
		doctor.setPassword(password);
		int result = doctorDao.add(doctor);
		localpath = "img/";
		response.sendRedirect("doctor_info.jsp?currentPage=1");
	}
	if (op.equals("delete")) {
		String idStr = request.getParameter("delete_id");
		int id = Integer.parseInt(idStr);
		doctor.setId(id);
		int result = doctorDao.delete(doctor);
		response.sendRedirect("doctor_info.jsp?currentPage=1");
	}
	if (op.equals("updatepassword")) {
		int result = 0;
		int id = (int) request.getSession().getAttribute("id");
		String password = request.getParameter("new_password");
		String password2 = request.getParameter("new_password2");
		if (!password.equals(password2)) {
			result = 0;
		} else {
			doctor.setId(id);
			doctor.setPassword(password);
			result = doctorDao.updatePassword(doctor);
		}
		response.sendRedirect("doctor_info.jsp?currentPage=1");
	}
	if (op.equals("updatedoctorpassword")) {
		int result = 0;
		int id = (int) request.getSession().getAttribute("id");
		String password = request.getParameter("new_password");
		String password2 = request.getParameter("new_password2");
		if (!password.equals(password2)) {
			result = 0;
		} else {
			doctor.setId(id);
			doctor.setPassword(password);
			result = doctorDao.updatePassword(doctor);
		}
		response.sendRedirect("doctormanage_doctor_index.jsp?state=" + result);
	}
%>
