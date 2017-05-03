package com.hospital.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hospital.entity.User;
import com.hospital.util.JDBCUtil;

/*用户注册实现*/

public class UserDao {

	private JDBCUtil jdbc; /* 声明数据库类对象 */
	private ResultSet rs;  /*查询结果集对象*/

	/*注册功能*/
	public int add(User user) {
		int result = 0; /* sql执行結果 */
		String realname = user.getRealname();
		String username = user.getUsername();
		String password = user.getPassword();
		int age = user.getAge();
		int sex = user.getSex();
		String telphone = user.getTelphone();
		String email = user.getEmail();
		String passport = user.getPassport();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String registerSqlStr = "insert into user(realname, username, password, sex, age, telphone, email, passport) values('"
				+ realname + "','" + username + "','" + password + "'," + sex + "," + age + ",'" + telphone + "','" + email
				+ "', '"+passport+"')";/* 插入user对象sql */
		System.out.println(registerSqlStr);
		result = jdbc.executeUpdate(registerSqlStr); /* 执行sql语句 */
		jdbc.close();
		return result;
	}
	
	/*修改个人信息*/
	public int update(User user) throws Exception {
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		User oldUser = new User();    /*修改之前的user信息对象*/
		String selectSqlStr = "select * from user where id = "+user.getId();
		rs = jdbc.executeQuery(selectSqlStr);
		/*对修改之前的user对象赋值*/
		while(rs.next()){
			oldUser.setAge(rs.getInt("age"));
			oldUser.setSex(rs.getInt("sex"));
			oldUser.setRealname(rs.getString("realname"));
			oldUser.setUsername(rs.getString("username"));
			oldUser.setPassword(rs.getString("password"));
			oldUser.setTelphone(rs.getString("telphone"));
			oldUser.setEmail(rs.getString("email"));
			oldUser.setPassport(rs.getString("passport"));
		}
		
		int result = 0; /* sql执行結果 */
		String realname = user.getRealname();
		String username = user.getUsername();
		int age = 0;
		int sex = 0;
		age = user.getAge();
		sex = user.getSex();
		String telphone = user.getTelphone();
		String email = user.getEmail();
		String passport = user.getPassport();
		if(realname.equals("") || realname == null){
			realname = oldUser.getRealname();
		}
		if(username.equals("") || username == null){
			username = oldUser.getUsername();
		}
		if(email.equals("") || email == null){
			email = oldUser.getEmail();
		}
		if(telphone.equals("") || telphone == null){
			telphone = oldUser.getTelphone();
		}
		if(sex == 0){
			sex = oldUser.getSex();
		}
		if(age == 0){
			age = oldUser.getAge();
		}
		if(passport.equals("") || passport == null){
			passport = oldUser.getPassport();
		}
		String updateSqlStr = "update user set realname = '"+realname+"', username = '"+username+"', password = '"+oldUser.getPassword()+"', age = "+age+", sex = "+sex+", email = '"+email+"', telphone = '"+telphone+"', passport = '"+passport+"' where id = "+user.getId();/* 更新user对象sql */
		result = jdbc.executeUpdate(updateSqlStr); /* 执行sql语句 */
		jdbc.close();
		return result;
	}
	
	/* 删除用户信息 */
	public int delete(User user) {
		int result = 0;
		int id = user.getId();
		String deleteSqlStr = "delete from user where id = " + id;
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		result = jdbc.executeUpdate(deleteSqlStr); /* 执行sql语句 */
		jdbc.close();
		return result;
	}
	
	/*查询分页列表*/
	public Map<String, Object> selectList(User user, int currentPage, int pageSize) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		List<User> list = new ArrayList<User>();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String countSqlStr = "select count(*) as count from user";
		String selectSqlStr = "select * from user";
		int id = 0;
		id = user.getId();
		if(id != 0){
			countSqlStr += " where id =" + id;
			selectSqlStr += " where id =" + id;
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
		
		countSqlStr += " limit "+start+", "+pageSize+"";
		rs = jdbc.executeQuery(selectSqlStr);
		while(rs.next()){
			User u = new User();
			u.setId(rs.getInt("id"));
			u.setRealname(rs.getString("realname"));
			u.setSex(rs.getInt("sex"));
			u.setAge(rs.getInt("age"));
			u.setUsername(rs.getString("username"));
			u.setTelphone(rs.getString("telphone"));
			u.setPassword(rs.getString("password"));
			u.setEmail(rs.getString("email"));
			u.setPassport(rs.getString("passport"));
			list.add(u);              /*将查询出来出来用户对象放到list数组*/
		}
		map.put("data", list);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		jdbc.close();
		return map;
	}
	
	/*修改密码*/
	public int updatePassword(User user){
		int result = 0;
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String updateSqlStr = "update user set password = '"+user.getPassword()+"' where id ="+user.getId();/* 更新user对象sql */
		result = jdbc.executeUpdate(updateSqlStr); /* 执行sql语句 */
		jdbc.close();
		return result;
	}
	
	/*登录*/
	public int login(User user) throws Exception{
		int result = 0;
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String loginSqlStr = "select * from user where username = '"+user.getUsername()+"' and password = "+user.getPassword();
		System.out.println(loginSqlStr);
		rs = jdbc.executeQuery(loginSqlStr);
		while(rs.next()){
			String username = rs.getString("username");
			if(username != null){
				result = rs.getInt("id");
			}
		}
		jdbc.close();
		return result;
	}
	
	/*根据id查询用户*/
	public User select(int id) throws Exception{
		User user = new User();
		String selectSqlStr = "select * from user where id = "+id;
		jdbc = new JDBCUtil();
		rs = jdbc.executeQuery(selectSqlStr);
		while(rs.next()){
			String realname = rs.getString("realname");
			user.setRealname(realname);
			user.setId(rs.getInt("id"));
			user.setAge(rs.getInt("age"));
			user.setSex(rs.getInt("sex"));
			user.setTelphone(rs.getString("telphone"));
			user.setEmail(rs.getString("email"));
			user.setPassport(rs.getString("passport"));
		}
		jdbc.close();
		return user;
	}
}
