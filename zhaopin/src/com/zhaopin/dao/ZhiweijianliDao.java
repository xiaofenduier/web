package com.zhaopin.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.zhaopin.entity.Jianli;
import com.zhaopin.entity.User;
import com.zhaopin.entity.Zhiweijianli;
import com.zhaopin.jdbc.JDBCUtil;

public class ZhiweijianliDao {

	private JDBCUtil jdbc; /* 声明数据库类对象 */
	private ResultSet rs; /* 查询结果集对象 */

	public int add(Zhiweijianli zj) {
		int result = 0;
		String addSql = "insert into zhiweijianli (zhiweiid, jianliid, state) values (" + zj.getZhiweiid() + ", "
				+ zj.getJianliid() + ", 0)";
		jdbc = new JDBCUtil();
		result = jdbc.executeUpdate(addSql);
		jdbc.close();
		return result;
	}

	public int delete(Zhiweijianli zj) {
		int result = 0;
		String addSql = "delete from zhiweijianli where id = " + zj.getId();
		jdbc = new JDBCUtil();
		result = jdbc.executeUpdate(addSql);
		jdbc.close();
		return result;
	}

	public int update(Zhiweijianli zj) {
		int result = 0;
		String addSql = "update zhiweijianli set state = " + zj.getState() + " where id =" + zj.getId();
		jdbc = new JDBCUtil();
		result = jdbc.executeUpdate(addSql);
		jdbc.close();
		return result;
	}

	public List<Zhiweijianli> selectList(Zhiweijianli zwjl) throws SQLException {
		List<Zhiweijianli> list = new ArrayList<Zhiweijianli>();
		String selectSql = "select * from zhiweijianli where zhiweiid=" + zwjl.getZhiweiid();
		System.out.println(selectSql);
		jdbc = new JDBCUtil();
		rs = jdbc.executeQuery(selectSql);
		if (rs != null) {
			Zhiweijianli z = new Zhiweijianli();
			z.setId(rs.getInt("id"));
			z.setZhiweiid(rs.getInt("zhiweiid"));
			z.setJianliid(rs.getInt("jianliid"));
			z.setState(rs.getInt("state"));
			list.add(z);
		}
		jdbc.close();
		return list;
	}

	public List<Zhiweijianli> selectListj(Zhiweijianli zwjl) throws SQLException {
		List<Zhiweijianli> list = new ArrayList<Zhiweijianli>();
		String selectSql = "select * from zhiweijianli where jianliid=" + zwjl.getJianliid();
		System.out.println(selectSql);
		jdbc = new JDBCUtil();
		rs = jdbc.executeQuery(selectSql);
		if (rs != null) {
			Zhiweijianli z = new Zhiweijianli();
			z.setId(rs.getInt("id"));
			z.setZhiweiid(rs.getInt("zhiweiid"));
			z.setJianliid(rs.getInt("jianliid"));
			z.setState(rs.getInt("state"));
			list.add(z);
		}
		jdbc.close();
		return list;
	}

	public Zhiweijianli select(Zhiweijianli zwjl) throws SQLException {
		String selectSql = "select * from zhiweijianli where zhiweiid = " + zwjl.getZhiweiid();
		System.out.println(selectSql);
		jdbc = new JDBCUtil();
		rs = jdbc.executeQuery(selectSql);
		Zhiweijianli z = new Zhiweijianli();
		if (rs != null) {
			while (rs.next()) {
				z.setId(rs.getInt("id"));
				z.setZhiweiid(rs.getInt("zhiweiid"));
				z.setJianliid(rs.getInt("jianliid"));
				z.setState(rs.getInt("state"));
			}
		}
		jdbc.close();
		return z;
	}

	public Map<String, Object> select4page(Zhiweijianli zhiweijianli, int currentPage, int pageSize)
			throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Zhiweijianli> list = new ArrayList<Zhiweijianli>();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String countSqlStr = "select count(*) as count from zhiweijianli where 1 = 1";
		String selectSqlStr = "select * from zhiweijianli where 1 = 1";
		int id = 0;
		id = zhiweijianli.getId();
		if (id != 0) {
			countSqlStr += " and id =" + id;
			selectSqlStr += " and id =" + id;
		}
		int jianliid = 0;
		jianliid = zhiweijianli.getJianliid();
		if (jianliid != 0) {
			countSqlStr += " and jianliid =" + jianliid;
			selectSqlStr += " and jianliid =" + jianliid;
		}
		int zhiweiid = 0;
		if (zhiweiid != 0) {
			countSqlStr += " and zhiweiid =" + zhiweiid;
			selectSqlStr += " and zhiweiid =" + zhiweiid;
		}
		rs = jdbc.executeQuery(countSqlStr); /* 执行sql语句 */
		int count = 0;
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
			System.out.println(selectSqlStr);
			rs = jdbc.executeQuery(selectSqlStr);
			while (rs.next()) {
				Zhiweijianli z = new Zhiweijianli();
				z.setId(rs.getInt("id"));
				z.setZhiweiid(rs.getInt("zhiweiid"));
				z.setJianliid(rs.getInt("jianliid"));
				z.setState(rs.getInt("state"));
				list.add(z);
			}
			map.put("data", list);
			map.put("pageCount", pageCount);
			map.put("currentPage", currentPage);
			map.put("pageSize", pageSize);
		}
		jdbc.close();
		return map;
	}

	public List<Zhiweijianli> listall() throws SQLException {
		List<Zhiweijianli> list = new ArrayList<Zhiweijianli>();
		String selectSql = "select * from zhiweijianli";
		jdbc = new JDBCUtil();
		rs = jdbc.executeQuery(selectSql);
		while (rs.next()) {
			Zhiweijianli z = new Zhiweijianli();
			z.setId(rs.getInt("id"));
			z.setZhiweiid(rs.getInt("zhiweiid"));
			z.setJianliid(rs.getInt("jianliid"));
			z.setState(rs.getInt("state"));
			list.add(z);
		}
		jdbc.close();
		return list;
	}
	
	public Map<String, Object> selectwithList4page(List<Integer> zwjlidlist, int currentPage, int pageSize) throws SQLException {
		String zwjlidStr = "";
		for(int zwjlid : zwjlidlist){
			if(zwjlidStr.equals("")){
				zwjlidStr = zwjlid + "";
			}else{
				zwjlidStr += "," + zwjlid;
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		List<Zhiweijianli> list = new ArrayList<Zhiweijianli>();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String countSqlStr = "select count(*) as count from zhiweijianli where zhiweiid in ("+zwjlidStr+")";
		String selectSqlStr = "select * from zhiweijianli where zhiweiid in ("+zwjlidStr+")";
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
		while (rs.next()) {
			Zhiweijianli z = new Zhiweijianli();
			z.setId(rs.getInt("id"));
			z.setZhiweiid(rs.getInt("zhiweiid"));
			z.setJianliid(rs.getInt("jianliid"));
			z.setState(rs.getInt("state"));
			list.add(z);
		}
		map.put("data", list);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		jdbc.close();
		return map;
	}
	
	public Map<String, Object> selectwithjlid4page(List<Jianli> jllist, int currentPage, int pageSize) throws SQLException {
		String jlidStr = "";
		for(Jianli jl : jllist){
			if(jlidStr.equals("")){
				jlidStr = jl.getId() + "";
			}else{
				jlidStr += "," + jl.getId();
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		List<Zhiweijianli> list = new ArrayList<Zhiweijianli>();
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String countSqlStr = "select count(*) as count from zhiweijianli where jianliid in ("+jlidStr+")";
		String selectSqlStr = "select * from zhiweijianli where jianliid in ("+jlidStr+")";
		System.out.println(countSqlStr);
		System.out.println(selectSqlStr);
		rs = jdbc.executeQuery(countSqlStr); /* 执行sql语句 */
		int count = 0;
		if(rs == null){
			return null;
		}
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
		while (rs.next()) {
			Zhiweijianli z = new Zhiweijianli();
			z.setId(rs.getInt("id"));
			z.setZhiweiid(rs.getInt("zhiweiid"));
			z.setJianliid(rs.getInt("jianliid"));
			z.setState(rs.getInt("state"));
			list.add(z);
		}
		map.put("data", list);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		jdbc.close();
		return map;
	}
}
