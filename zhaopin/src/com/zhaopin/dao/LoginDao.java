package com.zhaopin.dao;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.zhaopin.entity.Login;
import com.zhaopin.jdbc.JDBCUtil;

public class LoginDao {

	private JDBCUtil jdbc; /* 声明数据库类对象 */
	private ResultSet rs;  /*查询结果集对象*/
	
	public Map<String, Object> select4Page(Login login, int currentPage, int pageSize) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		List<Login> list = new ArrayList<Login>();
		String countSql = "select count(*) as count from login";
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		rs = jdbc.executeQuery(countSql); /* 执行sql语句 */
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
		String selectSql = "select * from login limit "+start+","+pageSize+"";
		rs = jdbc.executeQuery(selectSql);
		while(rs.next()){
			Login l = new Login();
			l.setId(rs.getInt("id"));
			l.setUserName(rs.getString("username"));
			l.setLoginTime(rs.getString("logintime"));
			list.add(l);              /*将查询出来出来对象放到list数组*/
		}
		map.put("data", list);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		jdbc.close();
		return map;
	}
	
	public int add(Login login){
		int result = 0;
		String username = login.getUserName();
		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String loginTime = formatter.format(now);
		String addSql = "insert into login (username, logintime) values ('"+username+"', '"+ loginTime +"')";
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		result = jdbc.executeUpdate(addSql);
		jdbc.close();
		return result;
	}
	
}
