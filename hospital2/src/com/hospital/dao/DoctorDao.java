package com.hospital.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hospital.entity.Department;
import com.hospital.entity.Doctor;
import com.hospital.util.JDBCUtil;

/*医生信息的增删改查*/

public class DoctorDao {

	private JDBCUtil jdbc; /* 声明数据库类对象 */
	private ResultSet rs;  /*查询结果集对象*/

	/*新增医生*/
	public int add(Doctor doctor) {
		int result = 0; /* sql执行結果 */
		String name = doctor.getName();
		String password = doctor.getPassword();
		int level = doctor.getLevel();
		int sex = doctor.getSex();
		int departmentId = doctor.getDepartmentId();
		String introduce = doctor.getIntroduce();
		String time = doctor.getTime();
		String pic = doctor.getPic();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String addSqlStr = "insert into doctor(name, password, sex, level, departmentid, introduce, time, pic, num) values('"
				+ name + "', '" + password + "'," + sex + "," + level + "," + departmentId + ",'" + introduce+ "', '"+time+"', '"+pic+"', 0)";/* 插入doctor对象sql */
		result = jdbc.executeUpdate(addSqlStr); /* 执行sql语句 */
		jdbc.close();
		return result;
	}
	
	/*删除医生信息*/
	public int delete(Doctor doctor){
		int result = 0;
		int id = doctor.getId();
		String deleteSqlStr = "delete from doctor where id = "+id;
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		result = jdbc.executeUpdate(deleteSqlStr); /* 执行sql语句 */
		jdbc.close();
		return result;
	}
	
	/*修改个人信息*/
	public int update(Doctor doctor) throws Exception {
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		Doctor oldDoctor = new Doctor();    /*修改之前的doctor信息对象*/
		String selectSqlStr = "select * from doctor where id = "+doctor.getId();
		rs = jdbc.executeQuery(selectSqlStr);
		/*对修改之前的doctor对象赋值*/
		while(rs.next()){
			oldDoctor.setId(rs.getInt("id"));
			oldDoctor.setName(rs.getString("name"));
			oldDoctor.setSex(rs.getInt("sex"));
			oldDoctor.setLevel(rs.getInt("level"));
			oldDoctor.setDepartmentId(rs.getInt("departmentid"));
			oldDoctor.setIntroduce(rs.getString("introduce"));
			oldDoctor.setPassword(rs.getString("password"));
			oldDoctor.setTime(rs.getString("time"));
		}
		
		int result = 0; /* sql执行結果 */
		String name = doctor.getName();
		int departmentId = 0;
		departmentId = doctor.getDepartmentId();
		String password = doctor.getPassword();
		int level = 0;
		int sex = 0;
		level = doctor.getLevel();
		sex = doctor.getSex();
		String introduce = doctor.getIntroduce();
		String time = doctor.getTime();
		/*当页面传的对象的值为空时，将对应的参数值改为修改前对象的参数值，防止更新后值为空*/
		if(name.equals("") || name == null){
			name = oldDoctor.getName();
		}
		if(departmentId == 0){
			departmentId = oldDoctor.getDepartmentId();
		}
		if(password.equals("") || password == null){
			password = oldDoctor.getPassword();
		}
		if(introduce.equals("") || introduce == null){
			introduce = oldDoctor.getIntroduce();
		}
		if(time.equals("") || time == null){
			time = oldDoctor.getTime();
		}
		if(sex == 0){
			sex = oldDoctor.getSex();
		}
		if(level == 0){
			level = oldDoctor.getLevel();
		}
		String updateSqlStr = "update doctor set name = '"+name+"', departmentid = '"+departmentId+"', password = '"+password+"', level = "+level+", sex = "+sex+", introduce = '"+introduce+"', time = '"+time+"' where id = " + doctor.getId();/* 更新doctor对象sql */
		result = jdbc.executeUpdate(updateSqlStr); /* 执行sql语句 */
		jdbc.close();
		return result;
	}
	
	/*分页查询列表*/
	public Map<String, Object> selectList(Doctor doctor, int currentPage, int pageSize) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		List<Doctor> list = new ArrayList<Doctor>();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String countSqlStr = "select count(*) as count from doctor";
		int id = 0;
		id = doctor.getId();
		/*拼接通过名字查询医生sql*/
		if ((doctor.getName() != null && doctor.getName() != "") && id == 0){
			countSqlStr += " where name = "+doctor.getName();
		}
		/*拼接通过编号查询医生sql*/
		if((doctor.getName() == null || doctor.getName() == "") && id != 0){
			countSqlStr += " where id = "+doctor.getId();
		}
		/*拼接通过科室查询医生sql*/
		if(doctor.getDepartmentId() != 0){
			countSqlStr += " where id = "+doctor.getDepartmentId();
		}
		
		rs = jdbc.executeQuery(countSqlStr); /* 执行sql语句 */
		int count = 0;
		while (rs.next()) {
			count = rs.getInt("count");
		}
		int pageCount = count/pageSize;  /*查询结果的总条数除以煤业显示条数，求取当前页*/   
		int flag = count%pageSize;
		if(flag != 0){
			pageCount = pageCount + 1;    /*余数不为0则加1*/
		}
		int start = (currentPage-1) * pageSize; /*从第几条开始*/
		String selectSqlStr = "select * from doctor";
		
		/*拼接通过名字查询医生sql*/
		if ((doctor.getName() != null && doctor.getName() != "") && id == 0){
			selectSqlStr += " where name = "+doctor.getName();
		}
		/*拼接通过编号查询医生sql*/
		if((doctor.getName() == null || doctor.getName() == "") && id != 0){
			selectSqlStr += " where id = "+doctor.getId();
		}
		/*拼接通过科室查询医生sql*/
		if(doctor.getDepartmentId() != 0){
			selectSqlStr += " where departmentid = "+doctor.getDepartmentId();
		}
		
		selectSqlStr += " limit "+start+", "+pageSize+"";
		rs = jdbc.executeQuery(selectSqlStr);
		DepartmentDao departmentDao = new DepartmentDao();
		while(rs.next()){
			Doctor d = new Doctor();
			d.setId(rs.getInt("id"));
			d.setName(rs.getString("name"));
			d.setSex(rs.getInt("sex"));
			d.setLevel(rs.getInt("level"));
			d.setDepartmentId(rs.getInt("departmentid"));
			d.setIntroduce(rs.getString("introduce"));
			d.setPassword(rs.getString("password"));
			d.setTime(rs.getString("time"));
			Department department = new Department();
			department = departmentDao.select(rs.getInt("departmentid"));
			d.setDepartment(department);
			list.add(d);              /*将查询出来出来医生对象放到list数组*/
		}
		map.put("data", list);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		jdbc.close();
		return map;
	}
	
	/*查询列表*/
	public List<Doctor> select4List(Doctor doctor) throws Exception{
		List<Doctor> list = new ArrayList<Doctor>();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		int id = 0;
		id = doctor.getId();
		String selectSqlStr = "select * from doctor";
		
		/*拼接通过名字查询医生sql*/
		if ((doctor.getName() != null && doctor.getName() != "") && id == 0){
			selectSqlStr += " where name = "+doctor.getName();
		}
		/*拼接通过编号查询医生sql*/
		if((doctor.getName() == null || doctor.getName() == "") && id != 0){
			selectSqlStr += " where id = "+doctor.getId();
		}
		/*拼接通过科室查询医生sql*/
		if(doctor.getDepartmentId() != 0){
			selectSqlStr += " where departmentid = "+doctor.getDepartmentId();
		}
		rs = jdbc.executeQuery(selectSqlStr);
		while(rs.next()){
			Doctor d = new Doctor();
			d.setId(rs.getInt("id"));
			d.setName(rs.getString("name"));
			d.setSex(rs.getInt("sex"));
			d.setLevel(rs.getInt("level"));
			d.setDepartmentId(rs.getInt("departmentid"));
			d.setIntroduce(rs.getString("introduce"));
			d.setPassword(rs.getString("password"));
			d.setPic(rs.getString("pic"));
			d.setTime(rs.getString("time"));
			list.add(d);              /*将查询出来出来医生对象放到list数组*/
		}
		jdbc.close();
		return list;
	}
	
	/*修改密码*/
	public int updatePassword(Doctor doctor){
		int result = 0;
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String updateSqlStr = "update doctor set password = '"+doctor.getPassword()+"' where id ="+doctor.getId();/* 更新user对象sql */
		result = jdbc.executeUpdate(updateSqlStr); /* 执行sql语句 */
		jdbc.close();
		return result;
	}
	
	public int login(Doctor doctor) throws Exception{
		int result = 0;
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String loginSqlStr = "select * from doctor where id = '"+doctor.getId()+"' and password = "+doctor.getPassword();
		rs = jdbc.executeQuery(loginSqlStr);
		while(rs.next()){
			String name = rs.getString("name");
			if(name != null){
				result = rs.getInt("id");
			}
		}
		jdbc.close();
		return result;
	}
	
	public Doctor select(Doctor doctor) throws Exception{
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String loginSqlStr = "select * from doctor where id = "+doctor.getId();
		rs = jdbc.executeQuery(loginSqlStr);
		DepartmentDao departmentDao = new DepartmentDao();
		while(rs.next()){
			doctor.setName(rs.getString("name"));
			doctor.setId(rs.getInt("id"));
			Department department = new Department();
			department = departmentDao.select(rs.getInt("departmentid"));
			doctor.setDepartment(department);
			doctor.setIntroduce(rs.getString("introduce"));
			doctor.setTime(rs.getString("time"));
			doctor.setLevel(rs.getInt("level"));
			doctor.setSex(rs.getInt("sex"));
			doctor.setPassword(rs.getString("password"));
		}
		jdbc.close();
		return doctor;
	}
	
	public List<Doctor> selectall() throws Exception{
		List<Doctor> list = new ArrayList<Doctor>();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String loginSqlStr = "select * from doctor";
		rs = jdbc.executeQuery(loginSqlStr);
		DepartmentDao departmentDao = new DepartmentDao();
		while(rs.next()){
			Doctor doctor = new Doctor();
			doctor.setName(rs.getString("name"));
			doctor.setId(rs.getInt("id"));
			Department department = new Department();
			department = departmentDao.select(rs.getInt("departmentid"));
			doctor.setDepartment(department);
			doctor.setIntroduce(rs.getString("introduce"));
			doctor.setTime(rs.getString("time"));
			doctor.setLevel(rs.getInt("level"));
			doctor.setSex(rs.getInt("sex"));
			doctor.setPassword(rs.getString("password"));
			list.add(doctor);
		}
		jdbc.close();
		return list;
	}
	
	public List<Doctor> selectbydepart(int departmentid) throws Exception{
		List<Doctor> list = new ArrayList<Doctor>();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String loginSqlStr = "select * from doctor where departmentid = " + departmentid;
		rs = jdbc.executeQuery(loginSqlStr);
		DepartmentDao departmentDao = new DepartmentDao();
		while(rs.next()){
			Doctor doctor = new Doctor();
			doctor.setName(rs.getString("name"));
			doctor.setId(rs.getInt("id"));
			Department department = new Department();
			department = departmentDao.select(rs.getInt("departmentid"));
			doctor.setDepartment(department);
			doctor.setIntroduce(rs.getString("introduce"));
			doctor.setTime(rs.getString("time"));
			doctor.setLevel(rs.getInt("level"));
			doctor.setSex(rs.getInt("sex"));
			doctor.setPassword(rs.getString("password"));
			list.add(doctor);
		}
		jdbc.close();
		return list;
	}
}
