package com.zhaopin.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.zhaopin.entity.Company;
import com.zhaopin.entity.Zhaopin;
import com.zhaopin.jdbc.JDBCUtil;

public class ZhaopinDao {

	private JDBCUtil jdbc; /* 声明数据库类对象 */
	private ResultSet rs; /* 查询结果集对象 */
	
	public Zhaopin add(Zhaopin zp) throws SQLException{
		String addSql = "insert into zhaopin (companyid, telphone, endtime, starttime) values ("+zp.getCompanyId()+", "+zp.getTelphone()+", '"+zp.getEndTime()+"', '"+zp.getStartTime()+"')";
		jdbc = new JDBCUtil();
		jdbc.executeUpdate(addSql);
		jdbc.close();
		String selectSql = "select * from zhaopin where companyid = "+zp.getCompanyId()+" and telphone = "+zp.getTelphone()+" and starttime = '"+zp.getStartTime()+"' and endtime = '"+zp.getEndTime()+"'";
		jdbc = new JDBCUtil();
		rs = jdbc.executeQuery(selectSql);
		while(rs.next()){
			int id = rs.getInt("id");
			zp.setId(id);
		}
		jdbc.close();
		return zp;
	}
	
	public Zhaopin select(Zhaopin zp) throws SQLException{
		Zhaopin zhaopin = new Zhaopin();
		jdbc = new JDBCUtil();
		String selectSql = "select * from zhaopin where id = "+ zp.getId();
		rs = jdbc.executeQuery(selectSql);
		CompanyDao cDao = new CompanyDao();
		while(rs.next()){
			zhaopin.setId(rs.getInt("id"));
			zhaopin.setCompanyId(rs.getInt("companyid"));
			zhaopin.setEndTime(rs.getString("endtime"));
			zhaopin.setStartTime(rs.getString("starttime"));
			zhaopin.setTelphone(rs.getLong("telphone"));
			Company c = new Company();
			c.setId(rs.getInt("companyid"));
			c = cDao.selectwithid(c);
			zhaopin.setCopmpany(c);
		}
		return zhaopin;
	}
	
	public Map<String, Object> select4Page(Zhaopin zhaopin, int currentPage, int pageSize) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		List<Zhaopin> list = new ArrayList<Zhaopin>();
		String countSql = "select count(*) as count from zhaopin where 1 = 1";
		String selectSql = "select * from zhaopin where 1 = 1";
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		String endtime = zhaopin.getEndTime();
		if (endtime != null && endtime != "") {
			countSql += " and endtime <'"+endtime+"'";
			selectSql += " and endtime <'"+endtime+"'";
		}
		int companyid = 0;
		companyid = zhaopin.getCompanyId();
		if(companyid != 0){
			countSql += " and companyid = "+companyid;
			selectSql += " and companyid = "+companyid;
		}
		System.out.println(selectSql);
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
		selectSql += " limit " + start + ", " + pageSize + "";
		rs = jdbc.executeQuery(selectSql);
		CompanyDao cDao = new CompanyDao();
		while(rs.next()){
			Zhaopin z = new Zhaopin();
			z.setId(rs.getInt("id"));
			z.setCompanyId(rs.getInt("companyid"));
			z.setEndTime(rs.getString("endtime"));
			z.setStartTime(rs.getString("starttime"));
			z.setTelphone(rs.getLong("telphone"));
			Company c = new Company();
			c.setId(rs.getInt("companyid"));
			c = cDao.selectwithid(c);
			z.setCopmpany(c);
			list.add(z);              /*将查询出来出来对象放到list数组*/
		}
		map.put("data", list);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		jdbc.close();
		return map;
	}
	
	public int delete(Zhaopin zhaopin){
		int result = 0;
		String deleteSql = "delete from zhaopin where id = "+zhaopin.getId();
		jdbc = new JDBCUtil();
		result = jdbc.executeUpdate(deleteSql);
		return result;
	}
	
	public List<Zhaopin> selectList(Zhaopin zp) throws SQLException{
		List<Zhaopin> list = new ArrayList<Zhaopin>();
		jdbc = new JDBCUtil();
		String selectSql = "select * from zhaopin where companyid = "+ zp.getCompanyId();
		System.out.println("---------"+selectSql);
		rs = jdbc.executeQuery(selectSql);
		CompanyDao cDao = new CompanyDao();
		if(rs == null){
			return null;
		}
		while(rs.next()){
			Zhaopin zhaopin = new Zhaopin();
			zhaopin.setId(rs.getInt("id"));
			zhaopin.setCompanyId(rs.getInt("companyid"));
			zhaopin.setEndTime(rs.getString("endtime"));
			zhaopin.setStartTime(rs.getString("starttime"));
			zhaopin.setTelphone(rs.getLong("telphone"));
			Company c = new Company();
			c.setId(rs.getInt("companyid"));
			c = cDao.select(c);
			zhaopin.setCopmpany(c);
			list.add(zhaopin);
		}
		return list;
	}
	
	public int update(Zhaopin zhaopin) throws SQLException {
		Zhaopin oz = new Zhaopin();
		oz = select(zhaopin);
		String starttime = zhaopin.getStartTime() ;
		String endtime = zhaopin.getEndTime();
		long telphone = 0;
		telphone = zhaopin.getTelphone();
		if (telphone == 0) {
			telphone = oz.getTelphone();
		}
		if (zhaopin.getStartTime() == "" || zhaopin.getStartTime() == null) {
			starttime = oz.getStartTime();
		}
		System.out.println(endtime);
		if (zhaopin.getEndTime() == "" || zhaopin.getEndTime() == null) {
			endtime = oz.getEndTime();
		}

		int result = 0;
		jdbc = new JDBCUtil();
		String updateSql = "update zhaopin set telphone = "+telphone+", starttime = '"+starttime+"', endtime = '"+endtime+"' where id = "
				+ zhaopin.getId();
		result = jdbc.executeUpdate(updateSql);
		jdbc.close();
		return result;
	}
}
