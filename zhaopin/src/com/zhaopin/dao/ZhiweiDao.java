package com.zhaopin.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.zhaopin.entity.Jianli;
import com.zhaopin.entity.Zhaopin;
import com.zhaopin.entity.Zhiwei;
import com.zhaopin.jdbc.JDBCUtil;

public class ZhiweiDao {

	private JDBCUtil jdbc; /* 声明数据库类对象 */
	private ResultSet rs; /* 查询结果集对象 */

	public int add(Zhiwei zhiwei) {
		int result = 0;
		jdbc = new JDBCUtil();
		String addSql = "insert into zhiwei (zhaopinid, zhiweiname, gongzi, zuidixueli, sex, age, zhuanye, renshu, zige, zhize) values ("
				+ zhiwei.getZhaopinId() + ", '" + zhiwei.getZhiweiName() + "', " + zhiwei.getGongzi() + ", '"
				+ zhiwei.getZuidixueli() + "', '" + zhiwei.getSex() + "', " + zhiwei.getAge() + ", '"
				+ zhiwei.getZhuanye() + "', " + zhiwei.getRenshu() + ", '" + zhiwei.getZige() + "','"
				+ zhiwei.getZhize() + "')";
		System.out.println(addSql);
		result = jdbc.executeUpdate(addSql);
		jdbc.close();
		return result;
	}

	public int delete(Zhiwei zhiwei) {
		int result = 0;
		jdbc = new JDBCUtil();
		String deleteSql = "delete from zhiwei where id = " + zhiwei.getId();
		result = jdbc.executeUpdate(deleteSql);
		jdbc.close();
		return result;
	}

	public Zhiwei select(Zhiwei zhiwei) throws SQLException {
		Zhiwei j = new Zhiwei();
		jdbc = new JDBCUtil();
		String selectSql = "select * from zhiwei where id = "+zhiwei.getId();
		rs = jdbc.executeQuery(selectSql);
		ZhaopinDao zpDao = new ZhaopinDao();
		while (rs.next()) {
			j.setId(rs.getInt("id"));
			j.setZhaopinId(rs.getInt("zhaopinid"));
			j.setGongzi(rs.getInt("gongzi"));
			j.setZhiweiName(rs.getString("zhiweiname"));
			j.setZuidixueli(rs.getString("zuidixueli"));
			j.setSex(rs.getString("sex"));
			j.setAge(rs.getInt("Age"));
			j.setZhuanye(rs.getString("zhuanye"));
			j.setRenshu(rs.getInt("renshu"));
			j.setZhize(rs.getString("zhize"));
			j.setZige(rs.getString("zige"));
			Zhaopin zp = new Zhaopin();
			zp.setId(rs.getInt("zhaopinid"));
			zp = zpDao.select(zp);
			j.setZp(zp);
		}
		jdbc.close();
		return j;
	}
	
	public Zhiwei selectwithzhaopinid(Zhiwei zhiwei) throws SQLException {
		Zhiwei j = new Zhiwei();
		jdbc = new JDBCUtil();
		String selectSql = "select * from zhiwei where zhaopinid = "+zhiwei.getZhaopinId();
		rs = jdbc.executeQuery(selectSql);
		ZhaopinDao zpDao = new ZhaopinDao();
		while (rs.next()) {
			j.setId(rs.getInt("id"));
			j.setZhaopinId(rs.getInt("zhaopinid"));
			j.setGongzi(rs.getInt("gongzi"));
			j.setZhiweiName(rs.getString("zhiweiname"));
			j.setZuidixueli(rs.getString("zuidixueli"));
			j.setSex(rs.getString("sex"));
			j.setAge(rs.getInt("Age"));
			j.setZhuanye(rs.getString("zhuanye"));
			j.setRenshu(rs.getInt("renshu"));
			j.setZhize(rs.getString("zhize"));
			j.setZige(rs.getString("zige"));
			Zhaopin zp = new Zhaopin();
			zp.setId(rs.getInt("zhaopinid"));
			zp = zpDao.select(zp);
			j.setZp(zp);
		}
		jdbc.close();
		return j;
	}

	public int update(Zhiwei zhiwei) throws SQLException {
		Zhiwei oj = new Zhiwei();
		oj = select(zhiwei);
		int zhaopinid = -1;
		String zhiweiname = zhiwei.getZhiweiName();
		int gongzi = -1;
		String zuidixueli = zhiwei.getZuidixueli();
		int age = -1;
		String sex = zhiwei.getSex();
		String zhuanye = zhiwei.getZhuanye();
		String zige = zhiwei.getZige();
		String zhize = zhiwei.getZhize();
		int renshu = -1;
		System.out.println();
		if (zhiwei.getZhiweiName() == "" || zhiwei.getZhiweiName() == null) {
			zhiweiname = oj.getZhiweiName();
		}
		if (zhiwei.getZige() == "" || zhiwei.getZige() == null) {
			zige = oj.getZige();
		}
		if (zhiwei.getZhize() == "" || zhiwei.getZhize() == null) {
			zhize = oj.getZhize();
		}
		age = oj.getAge();
		if (age == -1) {
			age = oj.getAge();
		}
		renshu = oj.getRenshu();
		if (renshu == -1) {
			renshu = oj.getRenshu();
		}
		gongzi = oj.getGongzi();
		if (gongzi == -1) {
			gongzi = oj.getGongzi();
		}
		zhaopinid = oj.getZhaopinId();
		if (zhaopinid == -1) {
			zhaopinid = oj.getZhaopinId();
		}
		if (zhiwei.getZhiweiName() == "" || zhiwei.getZhiweiName() == null) {
			zhiweiname = oj.getZhiweiName();
		}
		if (zhiwei.getZuidixueli() == "" || zhiwei.getZuidixueli() == null) {
			zuidixueli = oj.getZuidixueli();
		}
		if (zhiwei.getSex() == "" || zhiwei.getSex() == null) {
			sex = oj.getSex();
		}
		if (zhiwei.getZhuanye() == "" || zhiwei.getZhuanye() == null) {
			zhuanye = oj.getZhuanye();
		}

		int result = 0;
		jdbc = new JDBCUtil();
		String updateSql = "update zhiwei set zhaopinid = " + zhaopinid + ", zhiweiname = '" + zhiweiname + "', gongzi = "
				+ gongzi + ", zuidixueli = '" + zuidixueli + "', sex = '" + sex + "', age = " + age + ", zhuanye = '"
				+ zhuanye + "',renshu = " + renshu + ", zige = '" + zige + "', zhize = '" + zhize + "' where id = "
				+ zhiwei.getId();
		result = jdbc.executeUpdate(updateSql);
		jdbc.close();
		return result;
	}

	public Map<String, Object> select4page(Zhiwei zhiwei, int currentPage, int pageSize) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Zhiwei> list = new ArrayList<Zhiwei>();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String countSqlStr = "select count(*) as count from zhiwei where 1 = 1";
		String selectSqlStr = "select * from zhiwei where 1 = 1";
		int id = 0;
		id = zhiwei.getId();
		if (id != 0) {
			countSqlStr += " and id =" + id;
			selectSqlStr += " and id =" + id;
		}
		int gongzi = 0;
		gongzi = zhiwei.getGongzi();
		if (gongzi != 0) {
			countSqlStr += " and gongzi =" + gongzi;
			selectSqlStr += " and gongzi =" + gongzi;
		}
		String zhiweiname = zhiwei.getZhiweiName();
		if (zhiweiname != null && zhiweiname != "") {
			countSqlStr += " and zhiweiname like '%" + zhiweiname + "%'";
			selectSqlStr += " and zhiweiname like '%" + zhiweiname + "%'";
		}
		System.out.println(countSqlStr);
		rs = jdbc.executeQuery(countSqlStr); /* 执行sql语句 */
		int count = 0;
		if(rs == null){
			return null;
		}
		while (rs.next()) {
			count = rs.getInt("count");
		}
		if (count > 0) {
			int pageCount = count / pageSize; /* 查询结果的总条数除以煤业显示条数，求取当前页 */
			int flag = count % pageSize;
			if (flag != 0) {
				pageCount = pageCount + 1; /* 余数不为0则加1 */
			}
			int start = (currentPage - 1) * pageSize; /* 从第几条开始 */

			selectSqlStr += " limit " + start + ", " + pageSize + "";
			rs = jdbc.executeQuery(selectSqlStr);
			ZhaopinDao zpDao = new ZhaopinDao();
			while (rs.next()) {
				Zhiwei j = new Zhiwei();
				j.setId(rs.getInt("id"));
				j.setZhaopinId(rs.getInt("zhaopinid"));
				j.setGongzi(rs.getInt("gongzi"));
				j.setZhiweiName(rs.getString("zhiweiname"));
				j.setZuidixueli(rs.getString("zuidixueli"));
				j.setSex(rs.getString("sex"));
				j.setAge(rs.getInt("Age"));
				j.setZhuanye(rs.getString("zhuanye"));
				j.setRenshu(rs.getInt("renshu"));
				j.setZhize(rs.getString("zhize"));
				j.setZige(rs.getString("zige"));
				Zhaopin zp = new Zhaopin();
				zp.setId(rs.getInt("zhaopinid"));
				zp = zpDao.select(zp);
				j.setZp(zp);
				list.add(j);
			}
			map.put("data", list);
			map.put("pageCount", pageCount);
			map.put("currentPage", currentPage);
			map.put("pageSize", pageSize);
		}
		jdbc.close();
		return map;
	}
	
	public Map<String, Object> select4pageandlist(List<Integer> idlist, Zhiwei zhiwei, int currentPage, int pageSize) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Zhiwei> list = new ArrayList<Zhiwei>();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String countSqlStr = "select count(*) as count from zhiwei where 1 = 1";
		String selectSqlStr = "select * from zhiwei where 1 = 1";
		int id = 0;
		id = zhiwei.getId();
		if (id != 0) {
			countSqlStr += " and id =" + id;
			selectSqlStr += " and id =" + id;
		}
		int gongzi = 0;
		gongzi = zhiwei.getGongzi();
		if (gongzi != 0) {
			countSqlStr += " and gongzi =" + gongzi;
			selectSqlStr += " and gongzi =" + gongzi;
		}
		String zhiweiname = zhiwei.getZhiweiName();
		if (zhiweiname != null && zhiweiname != "") {
			countSqlStr += " and zhiweiname like '%" + zhiweiname + "%'";
			selectSqlStr += " and zhiweiname like '%" + zhiweiname + "%'";
		}
		if(idlist.size() > 0){
			String idStr = "";
			for(Integer id2 : idlist){
				if(idStr.equals("")){
					idStr = id2 + "";
				}else{
					idStr += "," + id2;
				}
			}
			countSqlStr += " and zhaopinid in (" + idStr + ")";
			selectSqlStr += " and zhaopinid in (" + idStr + ")";
		}
		System.out.println("000000000"+selectSqlStr);
		rs = jdbc.executeQuery(countSqlStr); /* 执行sql语句 */
		int count = 0;
		if(rs == null){
			return null;
		}
		while (rs.next()) {
			count = rs.getInt("count");
		}
		if (count > 0) {
			int pageCount = count / pageSize; /* 查询结果的总条数除以煤业显示条数，求取当前页 */
			int flag = count % pageSize;
			if (flag != 0) {
				pageCount = pageCount + 1; /* 余数不为0则加1 */
			}
			int start = (currentPage - 1) * pageSize; /* 从第几条开始 */

			selectSqlStr += " limit " + start + ", " + pageSize + "";
			rs = jdbc.executeQuery(selectSqlStr);
			ZhaopinDao zpDao = new ZhaopinDao();
			while (rs.next()) {
				Zhiwei j = new Zhiwei();
				j.setId(rs.getInt("id"));
				j.setZhaopinId(rs.getInt("zhaopinid"));
				j.setGongzi(rs.getInt("gongzi"));
				j.setZhiweiName(rs.getString("zhiweiname"));
				j.setZuidixueli(rs.getString("zuidixueli"));
				j.setSex(rs.getString("sex"));
				j.setAge(rs.getInt("Age"));
				j.setZhuanye(rs.getString("zhuanye"));
				j.setRenshu(rs.getInt("renshu"));
				j.setZhize(rs.getString("zhize"));
				j.setZige(rs.getString("zige"));
				Zhaopin zp = new Zhaopin();
				zp.setId(rs.getInt("zhaopinid"));
				zp = zpDao.select(zp);
				j.setZp(zp);
				list.add(j);
			}
			map.put("data", list);
			map.put("pageCount", pageCount);
			map.put("currentPage", currentPage);
			map.put("pageSize", pageSize);
		}
		jdbc.close();
		return map;
	}
	
	public List<Zhiwei> list() throws SQLException{
		List<Zhiwei> list = new ArrayList<Zhiwei>();
		String selectSql = "select * from zhiwei order by id desc limit 0,6";
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		rs = jdbc.executeQuery(selectSql);
		ZhaopinDao zpDao = new ZhaopinDao();
		while (rs.next()) {
			Zhiwei j = new Zhiwei();
			j.setId(rs.getInt("id"));
			j.setZhaopinId(rs.getInt("zhaopinid"));
			j.setGongzi(rs.getInt("gongzi"));
			j.setZhiweiName(rs.getString("zhiweiname"));
			j.setZuidixueli(rs.getString("zuidixueli"));
			j.setSex(rs.getString("sex"));
			j.setAge(rs.getInt("Age"));
			j.setZhuanye(rs.getString("zhuanye"));
			j.setRenshu(rs.getInt("renshu"));
			j.setZhize(rs.getString("zhize"));
			j.setZige(rs.getString("zige"));
			Zhaopin zp = new Zhaopin();
			zp.setId(rs.getInt("zhaopinid"));
			zp = zpDao.select(zp);
			j.setZp(zp);
			list.add(j);
		}
		jdbc.close();
		return list;
	}
}
