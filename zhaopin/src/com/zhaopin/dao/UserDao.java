package com.zhaopin.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.zhaopin.entity.Jianli;
import com.zhaopin.entity.User;
import com.zhaopin.jdbc.JDBCUtil;

public class UserDao {

	private JDBCUtil jdbc; /* 声明数据库类对象 */
	private ResultSet rs; /* 查询结果集对象 */

	/* 修改密码 */
	public int add(User user) {
		int result = 0;
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String addSql = "insert into user (jianliid, password, realname, sex, telphone, email) values("
				+ user.getJianliId() + ", '" + user.getPassword() + "', '" + user.getRealName() + "', '" + user.getSex()
				+ "', '" + user.getTelphone() + "', '" + user.getEmail() + "')";
		result = jdbc.executeUpdate(addSql); /* 执行sql语句 */
		jdbc.close();
		return result;
	}

	public User select(User user) throws SQLException {
		User u = new User();
		String selectSql = "select * from user where realname = '" + user.getRealName() + "' and password = '"+user.getPassword()+"'";
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		System.out.println(selectSql);
		rs = jdbc.executeQuery(selectSql);
		while (rs.next()) {
			u.setId(rs.getInt("id"));
			u.setJianliId(rs.getInt("jianliid"));
			u.setEmail(rs.getString("email"));
			u.setPassword(rs.getString("password"));
			u.setRealName(rs.getString("realname"));
			u.setSex(rs.getString("sex"));
			u.setTelphone(rs.getLong("telphone"));
		}
		jdbc.close();
		return u;
	}
	
	public User selectbyid(User user) throws SQLException {
		User u = new User();
		String selectSql = "select * from user where id = " +user.getId();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		System.out.println(selectSql);
		rs = jdbc.executeQuery(selectSql);
		while (rs.next()) {
			u.setId(rs.getInt("id"));
			u.setJianliId(rs.getInt("jianliid"));
			u.setEmail(rs.getString("email"));
			u.setPassword(rs.getString("password"));
			u.setRealName(rs.getString("realname"));
			u.setSex(rs.getString("sex"));
			u.setTelphone(rs.getLong("telphone"));
		}
		jdbc.close();
		return u;
	}

	/* 删除用户信息 */
	public int delete(User user) {
		int result = 0;
		int id = user.getId();
		String deleteSql = "delete from user where id = " + id;
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		result = jdbc.executeUpdate(deleteSql); /* 执行sql语句 */
		jdbc.close();
		return result;
	}

	/* 修改个人信息 */
	public int update(User user) throws Exception {
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		User oldUser = new User(); /* 修改之前的user信息对象 */
		String selectSql = "select * from user where id = " + user.getId();
		rs = jdbc.executeQuery(selectSql);
		/* 对修改之前的user对象赋值 */
		while (rs.next()) {
			oldUser.setJianliId(rs.getInt("jianliid"));
			oldUser.setSex(rs.getString("sex"));
			oldUser.setRealName(rs.getString("realname"));
			oldUser.setPassword(rs.getString("password"));
			oldUser.setTelphone(rs.getLong("telphone"));
			oldUser.setEmail(rs.getString("email"));
		}

		int result = 0; /* sql执行結果 */
		String realname = user.getRealName();
		String email = user.getEmail();
		String sex = user.getSex();
		long telphone = 0;
		telphone = user.getTelphone();
		if (realname.equals("") || realname == null) {
			realname = oldUser.getRealName();
		}
		if (email.equals("") || email == null) {
			email = oldUser.getEmail();
		}
		if (telphone == 0) {
			telphone = oldUser.getTelphone();
		}
		if (sex.equals("") || sex == null) {
			sex = oldUser.getSex();
		}
		String updateSql = "update user set realname = '" + realname + "', password = '" + oldUser.getPassword()
				+ "', sex = " + sex + ", email = '" + email + "', telphone = " + telphone + ", where id = "
				+ user.getId();/* 更新user对象sql */
		result = jdbc.executeUpdate(updateSql); /* 执行sql语句 */
		jdbc.close();
		return result;
	}

	/* 查询分页列表 */
	public Map<String, Object> selectList(User user, int currentPage, int pageSize) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<User> list = new ArrayList<User>();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String countSqlStr = "select count(*) as count from user";
		String selectSqlStr = "select * from user";
		int id = 0;
		id = user.getId();
		if (id != 0) {
			countSqlStr += " where id =" + id;
			selectSqlStr += " where id =" + id;
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
		JianliDao jlDao = new JianliDao();
		while (rs.next()) {
			User u = new User();
			u.setId(rs.getInt("id"));
			u.setRealName(rs.getString("realname"));
			u.setSex(rs.getString("sex"));
			u.setJianliId(rs.getInt("jianliid"));
			u.setTelphone(rs.getLong("telphone"));
			u.setPassword(rs.getString("password"));
			u.setEmail(rs.getString("email"));
			Jianli jl = new Jianli();
			jl.setId(rs.getInt("jianliid"));
			jl = jlDao.select(jl);
			u.setJl(jl);
			list.add(u); /* 将查询出来出来用户对象放到list数组 */
		}
		map.put("data", list);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		jdbc.close();
		return map;
	}

	/* 修改密码 */
	public int updatePassword(User user) {
		int result = 0;
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String updateSql = "update user set password = '" + user.getPassword() + "' where id ="
				+ user.getId();/* 更新user对象sql */
		result = jdbc.executeUpdate(updateSql); /* 执行sql语句 */
		jdbc.close();
		return result;
	}
}
