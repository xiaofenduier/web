package com.hospital.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hospital.entity.Department;
import com.hospital.entity.Doctor;
import com.hospital.util.JDBCUtil;

/*科室信息的增删改查*/

public class DepartmentDao {

	private JDBCUtil jdbc; /* 声明数据库类对象 */
	private ResultSet rs; /* 查询结果集对象 */

	/* 新增科室 */
	public int add(Department department) {
		int result = 0; /* sql执行結果 */
		String name = department.getName();
		String telphone = department.getTelphone();
		String introduce = department.getIntroduce();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String addSqlStr = "insert into department(name, telphone, introduce) values('" + name + "','" + telphone + "', '"
				+ introduce + "')";/* 插入department对象sql */
		result = jdbc.executeUpdate(addSqlStr); /* 执行sql语句 */
		jdbc.close();
		return result;
	}

	/* 删除科室信息 */
	public int delete(Department department) {
		int result = 0;
		int id = department.getId();
		String deleteSqlStr = "delete from department where id = " + id;
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		result = jdbc.executeUpdate(deleteSqlStr); /* 执行sql语句 */
		jdbc.close();
		return result;
	}

	/* 修改科室信息 */
	public int update(Department department) throws Exception {
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		Department oldDepartment = new Department(); /* 修改之前的科室信息对象 */
		String selectSqlStr = "select * from department where id = " + department.getId();
		rs = jdbc.executeQuery(selectSqlStr);
		/* 对修改之前的科室r对象赋值 */
		while (rs.next()) {
			oldDepartment.setId(rs.getInt("id"));
			oldDepartment.setName(rs.getString("name"));
			oldDepartment.setIntroduce(rs.getString("introduce"));
			oldDepartment.setTelphone(rs.getString("telphone"));
		}

		int result = 0; /* sql执行結果 */
		String name = department.getName();
		String introduce = department.getIntroduce();
		String telphone = department.getTelphone();
		if (name.equals("") || name == null) {
			name = oldDepartment.getName();
		}
		if (introduce.equals("") || introduce == null) {
			introduce = oldDepartment.getIntroduce();
		}
		if (telphone.equals("") || telphone == null) {
			telphone = oldDepartment.getTelphone();
		}
		String updateSqlStr = "update department set name = '" + name + "',telphone = '" + telphone + "', introduce = '"
				+ introduce + "' where id = " + department.getId();/* 更新department对象sql */
		result = jdbc.executeUpdate(updateSqlStr); /* 执行sql语句 */
		jdbc.close();
		return result;
	}

	/* 查询列表 */
	public Map<String, Object> selectList(Department department, int currentPage, int pageSize) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Department> list = new ArrayList<Department>();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String countSqlStr = "select count(*) as count from department";
		int id = 0;
		id = department.getId();

		String selectSqlStr = "select * from department";

		/* 拼接通过名字查询department sql */
		if ((department.getName() != null && department.getName() != "") && id == 0) {
			selectSqlStr += " where name = " + department.getName();
			countSqlStr += " where name = " + department.getName();
		}
		rs = jdbc.executeQuery(countSqlStr); /* 执行sql语句 */
		int count = 0;
		while (rs.next()) {
			count = rs.getInt("count");
		}
		int pageCount = count / pageSize; /* 查询结果的总条数除以煤业显示条数，求取当前页 */
		int flag = count % pageSize;
		if (flag != 0) {
			pageCount = pageCount + 1; /* 余数不为0则加1 */
		}
		int start = (currentPage - 1) * pageSize; /* 从第几条开始 */
		selectSqlStr += " limit " + start + ", " + pageSize + "";
		rs = jdbc.executeQuery(selectSqlStr);
		DoctorDao doctorDao = new DoctorDao();
		while (rs.next()) {
			Department d = new Department();
			d.setId(rs.getInt("id"));
			d.setName(rs.getString("name"));
			d.setIntroduce(rs.getString("introduce"));
			d.setTelphone(rs.getString("telphone"));

			/* 根据科室id查询医生信息 */
			Doctor d2 = new Doctor();
			d2.setDepartmentId(rs.getInt("id"));
			List<Doctor> doctorList = new ArrayList<Doctor>();
			doctorList = doctorDao.select4List(d2);
			d.setDoctor(doctorList);/* 将所属这个科室的所有医生信息放进去 */
			list.add(d); /* 将查询出来出来医生对象放到list数组 */
		}
		map.put("data", list);
		map.put("pageCount", pageCount);   /*总页数*/
		map.put("currentPage", currentPage);   /*当前页*/
		map.put("pageSize", pageSize);    /*每页显示条数*/
		jdbc.close();
		return map;
	}
	
	/* 查询 */
	public Department select(int id) throws Exception {
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String selectSqlStr = "select * from department where id = " + id;
		rs = jdbc.executeQuery(selectSqlStr);
		Department d = new Department();
		while (rs.next()) {
			d.setId(rs.getInt("id"));
			d.setName(rs.getString("name"));
			d.setIntroduce(rs.getString("introduce"));
			d.setTelphone(rs.getString("telphone"));
		}
		jdbc.close();
		return d;
	}
	
	/* 查询 */
	public List<Department> selectall() throws Exception {
		List<Department> list = new ArrayList<Department>();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String selectSqlStr = "select * from department";
		rs = jdbc.executeQuery(selectSqlStr);
		while (rs.next()) {
			Department d = new Department();/*声明一个科室对象*/
			d.setId(rs.getInt("id"));
			d.setName(rs.getString("name"));
			d.setIntroduce(rs.getString("introduce"));
			d.setTelphone(rs.getString("telphone"));
			list.add(d);   /*将科室对象放到数组*/
		}
		jdbc.close();
		return list;
	}

}
