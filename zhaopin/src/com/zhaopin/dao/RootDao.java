package com.zhaopin.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.zhaopin.entity.Root;
import com.zhaopin.jdbc.JDBCUtil;

public class RootDao {

	private JDBCUtil jdbc; /* 声明数据库类对象 */
	private ResultSet rs; /* 查询结果集对象 */
	
	public int update(Root root) throws SQLException{
		int result = 0;
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String updateSql = "update root set name = '"+root.getName()+"', password = '"+root.getPassword()+"', sex = '"+root.getSex()+"', telphone = "+root.getTelphone()+" where id = "+root.getId();/* 更新user对象sql */
		result = jdbc.executeUpdate(updateSql); /* 执行sql语句 */
		jdbc.close();
		return result;
	}
	
	public Root select() throws SQLException {
		Root r = new Root();
		jdbc = new JDBCUtil();
		String selectSql = "select * from root";
		rs = jdbc.executeQuery(selectSql);
		while (rs.next()) {
			r.setId(rs.getInt("id"));
			r.setName(rs.getString("name"));
			r.setPassword(rs.getString("password"));
			r.setSex(rs.getString("sex"));
			r.setTelphone(rs.getLong("telphone"));
		}
		jdbc.close();
		return r;
	}
	
	public Root login(Root root) throws SQLException {
		Root r = new Root();
		jdbc = new JDBCUtil();
		String selectSql = "select * from root where name = '" + root.getName() + "' and password = '"+root.getPassword()+"'";
		System.out.println(selectSql);
		rs = jdbc.executeQuery(selectSql);
		while (rs.next()) {
			r.setId(rs.getInt("id"));
			r.setName(rs.getString("name"));
			r.setPassword(rs.getString("password"));
			r.setSex(rs.getString("sex"));
			r.setTelphone(rs.getLong("telphone"));
		}
		jdbc.close();
		return r;
	}
}
