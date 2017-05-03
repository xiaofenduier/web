package com.hospital.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCUtil {

	/*数据库连接参数*/
	private String driverStr = "com.mysql.jdbc.Driver";
	private String connStr = "jdbc:mysql://localhost:3306/hospital?useUnicode=true&characterEncoding=utf-8";
	private String username = "root";   /*数据库用户名*/
	private String password = "123";    /*数据库密码*/
	private Connection conn = null;
	private Statement stmt = null;

	public JDBCUtil() {
		try {
			Class.forName(driverStr);
			conn = DriverManager.getConnection(connStr, username, password);
			stmt = conn.createStatement();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/*增删改*/
	public int executeUpdate(String s) {
		int result = 0;
		try {
			result = stmt.executeUpdate(s);

		} catch (Exception e) {
			System.out.println("执行更新错误！");
		}
		return result;
	}

	/*select查询方法*/
	public ResultSet executeQuery(String s) {
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery(s);
		} catch (Exception e) {
			System.out.println("执行查询错误！");
		}
		return rs;
	}

	public void close() {
		try {
			stmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("关闭错误！");
		}
	}
}
