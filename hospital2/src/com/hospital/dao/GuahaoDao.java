package com.hospital.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hospital.entity.Doctor;
import com.hospital.entity.Guahao;
import com.hospital.entity.User;
import com.hospital.util.JDBCUtil;

/*医生信息的增删改查*/

public class GuahaoDao {

	private JDBCUtil jdbc; /* 声明数据库类对象 */
	private ResultSet rs; /* 查询结果集对象 */

	/* 新增挂号信息 */
	public int add(Guahao guahao) throws Exception {
		int result = 0; /* sql执行結果 */
		String doctorname = guahao.getDoctorName();
		int doctorid = guahao.getDoctorId();
		int departmentId = guahao.getDepartmentId();
		String time = guahao.getTime();
		int userid = guahao.getUserid();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String addSqlStr = "insert into guahao(doctorid, departmentid, doctorname, time, userid, state) values("
				+ doctorid + ", " + departmentId + ",'" + doctorname + "', '" + time + "', " + userid
				+ ", 0)";/* 插入guahao对象sql */
		result = jdbc.executeUpdate(addSqlStr); /* 执行sql语句 */
		jdbc.close();
		return result;
	}

	/* 不带分页查询列表 */
	public List<Guahao> select4List(User user) throws Exception {
		List<Guahao> list = new ArrayList<Guahao>();
		String selectSqlStr = "select * from guahao where userid = " + user.getId();
		jdbc = new JDBCUtil();
		rs = jdbc.executeQuery(selectSqlStr);
		while (rs.next()) {
			Guahao g = new Guahao();
			g.setId(rs.getInt("id"));
			g.setDoctorName(rs.getString("doctorname"));
			g.setDoctorId(rs.getInt("doctorid"));
			g.setDepartmentId(rs.getInt("departmentid"));
			g.setUserid(rs.getInt("userid"));
			g.setTime(rs.getString("time"));
			g.setState(rs.getInt("state"));
			list.add(g);
		}
		jdbc.close();
		return list;
	}

	/* 查询列表 */
	public Map<String, Object> selectList(Guahao guahao, int currentPage, int pageSize) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Guahao> list = new ArrayList<Guahao>();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String countSqlStr = "select count(*) as count from guahao";
		int id = 0;
		id = guahao.getDoctorId();

		String selectSqlStr = "select * from guahao";

		/* 拼接通过名字查询department sql */
		if (id != 0) {
			selectSqlStr += " where doctorid = " + guahao.getDoctorId();
			countSqlStr += " where doctorid = " + guahao.getDoctorId();
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
		System.out.println(countSqlStr);
		System.out.println(selectSqlStr);
		rs = jdbc.executeQuery(selectSqlStr);
		while (rs.next()) {
			Guahao g = new Guahao();
			g.setId(rs.getInt("id"));
			g.setDoctorId(rs.getInt("doctorid"));
			g.setDepartmentId(rs.getInt("departmentid"));
			g.setDoctorName(rs.getString("doctorname"));
			g.setTime(rs.getString("time"));
			g.setUserid(rs.getInt("userid"));
			g.setState(rs.getInt("state"));
			list.add(g); /* 将查询出来出来医生对象放到list数组 */
		}
		map.put("data", list);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		jdbc.close();
		return map;
	}

	/* 修改挂号信息 */
	public int update(Guahao guahao) throws Exception {
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		Guahao oldGuahao = new Guahao(); /* 修改之前的guahao信息对象 */
		String selectSqlStr = "select * from guahao where id = " + guahao.getId();
		rs = jdbc.executeQuery(selectSqlStr);
		/* 对修改之前的guahao对象赋值 */
		while (rs.next()) {
			oldGuahao.setTime(rs.getString("time"));
			oldGuahao.setDepartmentId(rs.getInt("departmentid"));
			oldGuahao.setDoctorId(rs.getInt("doctorid"));
			Doctor doctor = new Doctor();
			doctor.setId(rs.getInt("doctorid"));
			DoctorDao doctorDao = new DoctorDao();
			doctor = doctorDao.select(doctor);
			oldGuahao.setDoctorName(doctor.getName());
			oldGuahao.setUserid(rs.getInt("userid"));
		}

		int result = 0; /* sql执行結果 */
		String time = guahao.getTime();
		int departmentId = 0;
		int doctorId = 0;
		int userid = 0;
		departmentId = guahao.getDepartmentId();
		doctorId = guahao.getDoctorId();
		userid = guahao.getUserid();
		if (time.equals("") || time == null) {
			time = oldGuahao.getTime();
		}
		if (departmentId == 0) {
			departmentId = oldGuahao.getDepartmentId();
		}
		if (doctorId == 0) {
			doctorId = oldGuahao.getDoctorId();
		}
		if (userid == 0) {
			userid = oldGuahao.getUserid();
		}
		Doctor doctor = new Doctor();
		doctor.setId(guahao.getDoctorId());
		DoctorDao doctorDao = new DoctorDao();
		doctor = doctorDao.select(doctor);
		String doctorname = doctor.getName();
		String updateSqlStr = "update guahao set doctorname = '" + doctorname + "', userid = " + userid + ", time = '"
				+ time + "', doctorId = " + doctorId + ", departmentId = " + departmentId + " where id = "
				+ guahao.getId();/* 更新guahao对象sql */
		result = jdbc.executeUpdate(updateSqlStr); /* 执行sql语句 */
		jdbc.close();
		return result;
	}

	/* 删除用户信息 */
	public int delete(Guahao guahao) {
		int result = 0;
		int id = guahao.getId();
		String deleteSqlStr = "delete from guahao where id = " + id;
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		result = jdbc.executeUpdate(deleteSqlStr); /* 执行sql语句 */
		jdbc.close();
		return result;
	}
}
