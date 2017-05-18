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

public class JianliDao {

	private JDBCUtil jdbc; /* 声明数据库类对象 */
	private ResultSet rs; /* 查询结果集对象 */

	public int add(Jianli jl) throws SQLException {
		int result = 0;
		jdbc = new JDBCUtil();
		String countSql = "select count(*) as count from jianli where userid = "+jl.getUserId();
		rs = jdbc.executeQuery(countSql); /* 执行sql语句 */
		int count = 0;
		while (rs.next()) {
			count = rs.getInt("count");
		}
		if(count > 4){
			return -1;
		}
		String addSql = "insert into jianli (userid, name, sex, age, birthday, passport, address, telphone, school, xueli, zhuanye, hxueli, hzhuanye, language, job, gongzi, createtime, jiangli, shijian, pingjia) values ("
				+ jl.getUserId() + ", '" + jl.getName() + "', '" + jl.getSex() + "', " + jl.getAge() + ", '"
				+ jl.getBirthday() + "', '" + jl.getPassport() + "', '" + jl.getAddress() + "', " + jl.getTelphone()
				+ ", '" + jl.getSchool() + "', '" + jl.getXueli() + "', '" + jl.getZhuanye() + "', '" + jl.getHxueli()
				+ "', '" + jl.getHzhuanye() + "', '" + jl.getLanguage() + "' ,'" + jl.getJob() + "', " + jl.getGongzi()
				+ ", '" + jl.getCreateTime() + "', '"+jl.getJiangli()+"','"+jl.getShijian()+"','"+jl.getPingjia()+"')";
		jdbc = new JDBCUtil();
		result = jdbc.executeUpdate(addSql);
		return result;
	}

	public int delete(Jianli jl) {
		int result = 0;
		String delSql = "delete from jianli where id = " + jl.getId();
		jdbc = new JDBCUtil();
		result = jdbc.executeUpdate(delSql);
		return result;
	}

	public int update(Jianli jl) throws SQLException {
		int result = 0;
		Jianli ojl = new Jianli();
		ojl = select(jl);
		String name = jl.getName();
		if (jl.getName() == "" || jl.getName() == null) {
			name = ojl.getName();
		}
		String sex = jl.getSex();
		if (jl.getSex() == "" || jl.getSex() == null) {
			sex = ojl.getSex();
		}
		int age = -1;
		age = jl.getAge();
		if (age == -1) {
			age = ojl.getAge();
		}
		String birthday = jl.getBirthday();
		if (birthday == null) {
			birthday = ojl.getBirthday();
		}
		String passport = jl.getPassport();
		if (jl.getPassport() == "" || jl.getPassport() == null) {
			passport = ojl.getPassport();
		}
		String address = jl.getAddress();
		if (jl.getAddress() == "" || jl.getAddress() == null) {
			address = ojl.getAddress();
		}
		long telphone = -1;
		telphone = jl.getTelphone();
		if (telphone == -1) {
			telphone = ojl.getTelphone();
		}
		String school = jl.getSchool();
		if (jl.getSchool() == "" || jl.getSchool() == null) {
			school = ojl.getSchool();
		}
		String createTime = jl.getCreateTime();
		if (jl.getCreateTime() == "" || jl.getCreateTime() == null) {
			createTime = ojl.getCreateTime();
		}
		String xueli = jl.getXueli();
		if (jl.getXueli() == "" || jl.getXueli() == null) {
			xueli = ojl.getXueli();
		}
		String zhuanye = jl.getZhuanye();
		if (jl.getZhuanye() == "" || jl.getZhuanye() == null) {
			zhuanye = ojl.getZhuanye();
		}
		String hxueli = jl.getHxueli();
		if (jl.getHxueli() == "" || jl.getHxueli() == null) {
			hxueli = ojl.getHxueli();
		}
		String hzhuanye = jl.getHzhuanye();
		if (jl.getHzhuanye() == "" || jl.getHzhuanye() == null) {
			hzhuanye = ojl.getHzhuanye();
		}
		String job = jl.getJob();
		if (jl.getJob() == "" || jl.getJob() == null) {
			job = ojl.getJob();
		}
		String language = jl.getLanguage();
		if (jl.getLanguage() == "" || jl.getLanguage() == null) {
			language = ojl.getLanguage();
		}
		int gongzi = -1;
		gongzi = jl.getGongzi();
		if (gongzi == -1) {
			gongzi = ojl.getGongzi();
		}
		String jiangli = jl.getJiangli();
		if (jl.getJiangli() == "file/" || jl.getJiangli() == null) {
			jiangli = ojl.getJiangli();
		}
		String shijian = jl.getShijian();
		if (jl.getShijian() == "file/" || jl.getShijian() == null) {
			shijian = ojl.getShijian();
		}
		String pingjia = jl.getPingjia();
		if (jl.getPingjia() == "file/" || jl.getPingjia() == null) {
			pingjia = ojl.getPingjia();
		}
		String updateSql = "update jianli set address = '" + address + "', birthday = '" + birthday + "', userid = "
				+ ojl.getUserId() + ", name = '" + name + "', sex = '" + sex + "', age = " + age + ", passport = '"
				+ passport + "', telphone = " + telphone + ", school = '" + school + "', job = '" + job
				+ "', language = '" + language + "', gongzi = " + gongzi + ", xueli = '" + xueli + "', zhuanye = '"
				+ zhuanye + "', hxueli = '" + hxueli + "', hzhuanye = '" + hzhuanye + "',createtime = '" + createTime
				+ "', jiangli = '"+jiangli+"', shijian = '"+shijian+"', pingjia = '"+pingjia+"' where id = " + jl.getId();
		jdbc = new JDBCUtil();
		System.out.println(updateSql);
		result = jdbc.executeUpdate(updateSql);
		return result;
	}

	public Jianli select(Jianli jl) throws SQLException {
		Jianli jianli = new Jianli();
		String selectSql = "select * from jianli where id = " + jl.getId();
		jdbc = new JDBCUtil();
		rs = jdbc.executeQuery(selectSql);
		UserDao userDao = new UserDao();
		while (rs.next()) {
			jianli.setUserId(rs.getInt("userid"));
			jianli.setName(rs.getString("name"));
			jianli.setSex(rs.getString("sex"));
			jianli.setAge(rs.getInt("age"));
			jianli.setBirthday(rs.getString("birthday"));
			jianli.setPassport(rs.getString("passport"));
			jianli.setAddress(rs.getString("address"));
			jianli.setTelphone(rs.getLong("telphone"));
			jianli.setSchool(rs.getString("school"));
			jianli.setXueli(rs.getString("xueli"));
			jianli.setZhuanye(rs.getString("zhuanye"));
			jianli.setId(rs.getInt("id"));
			jianli.setHxueli(rs.getString("hxueli"));
			jianli.setHzhuanye(rs.getString("hzhuanye"));
			jianli.setJob(rs.getString("job"));
			jianli.setLanguage(rs.getString("language"));
			jianli.setGongzi(rs.getInt("gongzi"));
			jianli.setCreateTime(rs.getString("createtime"));
			jianli.setJiangli(rs.getString("jiangli"));
			jianli.setShijian(rs.getString("shijian"));
			jianli.setPingjia(rs.getString("pingjia"));
			User user = new User();
			user.setId(rs.getInt("userid"));
			user = userDao.select(user);
			jianli.setUser(user);
		}
		jdbc.close();
		return jianli;
	}
	
	public List<Jianli> selectlist(Jianli jl) throws SQLException {
		List<Jianli> list = new ArrayList<Jianli>();
		String selectSql = "select * from jianli where id = " + jl.getId();
		System.out.println(selectSql);
		jdbc = new JDBCUtil();
		rs = jdbc.executeQuery(selectSql);
		UserDao userDao = new UserDao();
		while (rs.next()) {
			Jianli jianli = new Jianli();
			jianli.setUserId(rs.getInt("userid"));
			jianli.setName(rs.getString("name"));
			jianli.setSex(rs.getString("sex"));
			jianli.setAge(rs.getInt("age"));
			jianli.setBirthday(rs.getString("birthday"));
			jianli.setPassport(rs.getString("passport"));
			jianli.setAddress(rs.getString("address"));
			jianli.setTelphone(rs.getLong("telphone"));
			jianli.setSchool(rs.getString("school"));
			jianli.setXueli(rs.getString("xueli"));
			jianli.setZhuanye(rs.getString("zhuanye"));
			jianli.setId(rs.getInt("id"));
			jianli.setHxueli(rs.getString("hxueli"));
			jianli.setHzhuanye(rs.getString("hzhuanye"));
			jianli.setJob(rs.getString("job"));
			jianli.setLanguage(rs.getString("language"));
			jianli.setGongzi(rs.getInt("gongzi"));
			jianli.setCreateTime(rs.getString("createtime"));
			jianli.setJiangli(rs.getString("jiangli"));
			jianli.setShijian(rs.getString("shijian"));
			jianli.setPingjia(rs.getString("pingjia"));
			User user = new User();
			user.setId(rs.getInt("userid"));
			user = userDao.select(user);
			jianli.setUser(user);
			list.add(jianli);
		}
		jdbc.close();
		return list;
	}
	
	public List<Jianli> selectlistu(Jianli jl) throws SQLException {
		List<Jianli> list = new ArrayList<Jianli>();
		String selectSql = "select * from jianli where userid = " + jl.getUserId();
		System.out.println(selectSql);
		jdbc = new JDBCUtil();
		rs = jdbc.executeQuery(selectSql);
		if(rs == null){
			return null;
		}
		UserDao userDao = new UserDao();
		while (rs.next()) {
			Jianli jianli = new Jianli();
			jianli.setUserId(rs.getInt("userid"));
			jianli.setName(rs.getString("name"));
			jianli.setSex(rs.getString("sex"));
			jianli.setAge(rs.getInt("age"));
			jianli.setBirthday(rs.getString("birthday"));
			jianli.setPassport(rs.getString("passport"));
			jianli.setAddress(rs.getString("address"));
			jianli.setTelphone(rs.getLong("telphone"));
			jianli.setSchool(rs.getString("school"));
			jianli.setXueli(rs.getString("xueli"));
			jianli.setZhuanye(rs.getString("zhuanye"));
			jianli.setId(rs.getInt("id"));
			jianli.setHxueli(rs.getString("hxueli"));
			jianli.setHzhuanye(rs.getString("hzhuanye"));
			jianli.setJob(rs.getString("job"));
			jianli.setLanguage(rs.getString("language"));
			jianli.setGongzi(rs.getInt("gongzi"));
			jianli.setCreateTime(rs.getString("createtime"));
			jianli.setJiangli(rs.getString("jiangli"));
			jianli.setShijian(rs.getString("shijian"));
			jianli.setPingjia(rs.getString("pingjia"));
			User user = new User();
			user.setId(rs.getInt("userid"));
			user = userDao.select(user);
			jianli.setUser(user);
			list.add(jianli);
		}
		jdbc.close();
		return list;
	}

	public Map<String, Object> select4List(Jianli jianli, int currentPage, int pageSize) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Jianli> list = new ArrayList<Jianli>();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String countSqlStr = "select count(*) as count from jianli where 1 = 1";
		String selectSqlStr = "select * from jianli where 1 = 1";
		int userid = 0;
		userid = jianli.getUserId();
		if (userid != 0) {
			countSqlStr += " and userid =" + userid;
			selectSqlStr += " and userid =" + userid;
		}
		int id = 0;
		id = jianli.getId();
		if (id != 0) {
			countSqlStr += " and id =" + id;
			selectSqlStr += " and id =" + id;
		}
		String job = jianli.getJob();
		if (job != null && job != "") {
			countSqlStr += " and job like '%" + job + "%'";
			selectSqlStr += " and job like '%" + job + "%'";
		}
		String hxueli = jianli.getHxueli();
		if (hxueli != null && hxueli != "") {
			countSqlStr += " and hxueli like '%" + hxueli + "%'";
			selectSqlStr += " and hxueli like '%" + hxueli + "%'";
		}
		String hzhuanye = jianli.getHzhuanye();
		if (hzhuanye != null && hzhuanye != "") {
			countSqlStr += " and hzhuanye like '%" + hzhuanye + "%'";
			selectSqlStr += " and hzhuanye like '%" + hzhuanye + "%'";
		}
		System.out.println(countSqlStr);
		System.out.println(selectSqlStr);
		rs = jdbc.executeQuery(countSqlStr); /* 执行sql语句 */
		if(rs == null){
			return null;
		}
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
		if(rs == null){
			return null;
		}
		UserDao userDao = new UserDao();
		while (rs.next()) {
			Jianli j = new Jianli();
			j.setId(rs.getInt("id"));
			j.setUserId(rs.getInt("userid"));
			j.setName(rs.getString("name"));
			j.setSex(rs.getString("sex"));
			j.setAge(rs.getInt("age"));
			j.setBirthday(rs.getString("birthday"));
			j.setPassport(rs.getString("passport"));
			j.setAddress(rs.getString("address"));
			j.setTelphone(rs.getLong("telphone"));
			j.setSchool(rs.getString("school"));
			j.setXueli(rs.getString("xueli"));
			j.setZhuanye(rs.getString("zhuanye"));
			j.setHxueli(rs.getString("hxueli"));
			j.setHzhuanye(rs.getString("hzhuanye"));
			j.setLanguage(rs.getString("language"));
			j.setJob(rs.getString("job"));
			j.setGongzi(rs.getInt("gongzi"));
			User user = new User();
			user.setId(rs.getInt("userid"));
			user = userDao.select(user);
			j.setCreateTime(rs.getString("createtime"));
			j.setJiangli(rs.getString("jiangli"));
			j.setShijian(rs.getString("shijian"));
			j.setPingjia(rs.getString("pingjia"));
			j.setUser(user);
			list.add(j);
		}
		map.put("data", list);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		jdbc.close();
		System.out.println(map);
		return map;
	}
	
	public Map<String, Object> selectwithList4page(List<Integer> jlidlist, Jianli jianli, int currentPage, int pageSize) throws SQLException {
		String jlidStr = "";
		for(int jlid : jlidlist){
			if(jlidStr.equals("")){
				jlidStr = jlid + "";
			}else{
				jlidStr += "," + jlid;
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		List<Jianli> list = new ArrayList<Jianli>();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String countSqlStr = "select count(*) as count from jianli where id in ("+jlidStr+")";
		String selectSqlStr = "select * from jianli where id in ("+jlidStr+")";
		int userid = 0;
		userid = jianli.getUserId();
		if (userid != 0) {
			countSqlStr += " and userid =" + userid;
			selectSqlStr += " and userid =" + userid;
		}
		int id = 0;
		id = jianli.getId();
		if (id != 0) {
			countSqlStr += " and id =" + id;
			selectSqlStr += " and id =" + id;
		}
		String job = jianli.getJob();
		if (job != null && job != "") {
			countSqlStr += " and job like '%" + job + "%'";
			selectSqlStr += " and job like '%" + job + "%'";
		}
		String hxueli = jianli.getHxueli();
		if (hxueli != null && hxueli != "") {
			countSqlStr += " and hxueli like '%" + hxueli + "%'";
			selectSqlStr += " and hxueli like '%" + hxueli + "%'";
		}
		String hzhuanye = jianli.getHzhuanye();
		if (hzhuanye != null && hzhuanye != "") {
			countSqlStr += " and hzhuanye like '%" + hzhuanye + "%'";
			selectSqlStr += " and hzhuanye like '%" + hzhuanye + "%'";
		}
		System.out.println(countSqlStr);
		System.out.println(selectSqlStr);
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
		UserDao userDao = new UserDao();
		while (rs.next()) {
			Jianli j = new Jianli();
			j.setId(rs.getInt("id"));
			j.setUserId(rs.getInt("userid"));
			j.setName(rs.getString("name"));
			j.setSex(rs.getString("sex"));
			j.setAge(rs.getInt("age"));
			j.setBirthday(rs.getString("birthday"));
			j.setPassport(rs.getString("passport"));
			j.setAddress(rs.getString("address"));
			j.setTelphone(rs.getLong("telphone"));
			j.setSchool(rs.getString("school"));
			j.setXueli(rs.getString("xueli"));
			j.setZhuanye(rs.getString("zhuanye"));
			j.setHxueli(rs.getString("hxueli"));
			j.setHzhuanye(rs.getString("hzhuanye"));
			j.setLanguage(rs.getString("language"));
			j.setJob(rs.getString("job"));
			j.setGongzi(rs.getInt("gongzi"));
			User user = new User();
			user.setId(rs.getInt("userid"));
			user = userDao.select(user);
			j.setCreateTime(rs.getString("createtime"));
			j.setJiangli(rs.getString("jiangli"));
			j.setShijian(rs.getString("shijian"));
			j.setPingjia(rs.getString("pingjia"));
			j.setUser(user);
			list.add(j);
		}
		map.put("data", list);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		jdbc.close();
		return map;
	}
}
