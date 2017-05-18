package com.zhaopin.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.zhaopin.entity.Company;
import com.zhaopin.jdbc.JDBCUtil;

public class CompanyDao {

	private JDBCUtil jdbc; /* 声明数据库类对象 */
	private ResultSet rs; /* 查询结果集对象 */

	public int add(Company company) {
		int result = 0;
		jdbc = new JDBCUtil();
		String addSql = "insert into company (password, name, address, telphone, fanwei, jigou, shuiwu, starttime, yyzz, xy, username, userpassport, state, introduce, pic) values('"
				+ company.getPassword() + "', '" + company.getName() + "', '" + company.getAddress() + "', "
				+ company.getTelphone() + ", '" + company.getRange() + "', '" + company.getCode() + "', "
				+ company.getShuiwu() + ", '" + company.getTime() + "', '" + company.getYyzz() + "', '"
				+ company.getXy() + "', '" + company.getUserName() + "', '" + company.getUserPassport() + "', 0, '"
				+ company.getIntroduce() + "', '"+company.getPic()+"')";
		System.out.println(addSql);
		result = jdbc.executeUpdate(addSql);
		jdbc.close();
		return result;
	}

	public Company select(Company company) throws SQLException {
		Company c = new Company();
		jdbc = new JDBCUtil();
		String selectSql = "select * from company where name = '" + company.getName()+"' and password = '"+company.getPassword()+"'";
		rs = jdbc.executeQuery(selectSql);
		while (rs.next()) {
			c.setName(rs.getString("name"));
			c.setAddress(rs.getString("address"));
			c.setPassword(rs.getString("password"));
			c.setTelphone(rs.getLong("telphone"));
			c.setRange(rs.getString("fanwei"));
			c.setCode(rs.getString("jigou"));
			c.setShuiwu(rs.getLong("shuiwu"));
			c.setTime(rs.getString("starttime"));
			c.setYyzz(rs.getString("yyzz"));
			c.setXy(rs.getString("xy"));
			c.setId(rs.getInt("id"));
			c.setUserPassport(rs.getString("userpassport"));
			c.setUserName(rs.getString("username"));
			c.setState(rs.getInt("state"));
			c.setIntroduce(rs.getString("introduce"));
			c.setPic(rs.getString("pic"));
		}
		jdbc.close();
		return c;
	}
	
	public List<Company> select4list() throws SQLException {
		jdbc = new JDBCUtil();
		String selectSql = "select * from company order by id desc limit 0,6";
		rs = jdbc.executeQuery(selectSql);
		List<Company> list = new ArrayList<Company>();
		while (rs.next()) {
			Company c = new Company();
			c.setName(rs.getString("name"));
			c.setAddress(rs.getString("address"));
			c.setPassword(rs.getString("password"));
			c.setTelphone(rs.getLong("telphone"));
			c.setRange(rs.getString("fanwei"));
			c.setCode(rs.getString("jigou"));
			c.setShuiwu(rs.getLong("shuiwu"));
			c.setTime(rs.getString("starttime"));
			c.setYyzz(rs.getString("yyzz"));
			c.setXy(rs.getString("xy"));
			c.setId(rs.getInt("id"));
			c.setUserPassport(rs.getString("userpassport"));
			c.setUserName(rs.getString("username"));
			c.setState(rs.getInt("state"));
			c.setIntroduce(rs.getString("introduce"));
			c.setPic(rs.getString("pic"));
			list.add(c);
		}
		jdbc.close();
		return list;
	}
	
	public Company selectwithid(Company company) throws SQLException {
		Company c = new Company();
		jdbc = new JDBCUtil();
		String selectSql = "select * from company where id = "+company.getId();
		rs = jdbc.executeQuery(selectSql);
		while (rs.next()) {
			c.setName(rs.getString("name"));
			c.setAddress(rs.getString("address"));
			c.setPassword(rs.getString("password"));
			c.setTelphone(rs.getLong("telphone"));
			c.setRange(rs.getString("fanwei"));
			c.setCode(rs.getString("jigou"));
			c.setShuiwu(rs.getLong("shuiwu"));
			c.setTime(rs.getString("starttime"));
			c.setYyzz(rs.getString("yyzz"));
			c.setXy(rs.getString("xy"));
			c.setId(rs.getInt("id"));
			c.setUserPassport(rs.getString("userpassport"));
			c.setUserName(rs.getString("username"));
			c.setState(rs.getInt("state"));
			c.setIntroduce(rs.getString("introduce"));
			c.setPic(rs.getString("pic"));
		}
		jdbc.close();
		return c;
	}
	
	public Company selectwithname(Company company) throws SQLException {
		Company c = new Company();
		jdbc = new JDBCUtil();
		String selectSql = "select * from company where name = '"+company.getName()+"'";
		System.out.println(selectSql);
		rs = jdbc.executeQuery(selectSql);
		while (rs.next()) {
			c.setName(rs.getString("name"));
			c.setAddress(rs.getString("address"));
			c.setPassword(rs.getString("password"));
			c.setTelphone(rs.getLong("telphone"));
			c.setRange(rs.getString("fanwei"));
			c.setCode(rs.getString("jigou"));
			c.setShuiwu(rs.getLong("shuiwu"));
			c.setTime(rs.getString("starttime"));
			c.setYyzz(rs.getString("yyzz"));
			c.setXy(rs.getString("xy"));
			c.setId(rs.getInt("id"));
			c.setUserPassport(rs.getString("userpassport"));
			c.setUserName(rs.getString("username"));
			c.setState(rs.getInt("state"));
			c.setIntroduce(rs.getString("introduce"));
			c.setPic(rs.getString("pic"));
		}
		jdbc.close();
		return c;
	}

	public int update(Company company) throws SQLException {
		int result = 0;
		Company oc = new Company();
		oc = select(company);
		String name = company.getName();
		String address = company.getAddress();
		String password = company.getPassword();
		long telphone = -1;
		String range = company.getRange();
		String code = company.getCode();
		long shuiwu = -1;
		String time = company.getTime();
		String yyzz = company.getYyzz();
		String xy = company.getXy();
		String username = company.getUserName();
		String userpassport = company.getUserPassport();
		String introduce = company.getIntroduce();
		int state = -1;
		if (company.getName() == "" || company.getName() == null) {
			name = oc.getName();
		}
		if (company.getAddress() == "" || company.getAddress() == null) {
			address = oc.getAddress();
		}
		if (company.getPassword() == "" || company.getPassword() == null) {
			password = oc.getPassword();
		}
		telphone = company.getTelphone();
		if (telphone == -1) {
			telphone = oc.getTelphone();
		}
		if (company.getRange() == "" || company.getRange() == null) {
			range = oc.getRange();
		}
		if (company.getCode() == "" || company.getCode() == null) {
			code = oc.getCode();
		}
		shuiwu = company.getShuiwu();
		if (shuiwu == -1) {
			shuiwu = oc.getShuiwu();
		}
		state = company.getState();
		if (state == -1) {
			state = oc.getState();
		}
		if (time == null || time == "") {
			time = oc.getTime();
		}
		if (company.getYyzz() == "" || company.getYyzz() == null) {
			yyzz = oc.getYyzz();
		}
		if (company.getXy() == "" || company.getXy() == null) {
			xy = oc.getXy();
		}
		if (company.getUserName() == "" || company.getUserName() == null) {
			username = oc.getUserName();
		}
		if (company.getUserPassport() == "" || company.getUserPassport() == null) {
			userpassport = oc.getUserPassport();
		}
		if (company.getIntroduce() == "" || company.getIntroduce() == null) {
			introduce = oc.getIntroduce();
		}
		jdbc = new JDBCUtil();
		String updateSql = "update company set address = '" + address + "', jigou = '" + code + "', name = '" + name
				+ "', fanwei = '" + range + "', password = '" + password + "', username = '" + username
				+ "', telphone = " + telphone + ", userpassport = '" + userpassport + "', shuiwu = " + shuiwu
				+ ", starttime = '" + time + "', yyzz = '" + yyzz + "', xy = '" + xy + "', state = " + state
				+ ", introduce = '" + introduce + "', pic = '"+oc.getPic()+"' where id = " + company.getId();
		System.out.println(updateSql);
		result = jdbc.executeUpdate(updateSql);
		jdbc.close();
		return result;
	}

	public Map<String, Object> select4Page(Company company, int currentPage, int pageSize) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Company> list = new ArrayList<Company>();
		String countSql = "select count(*) as count from company";
		String selectSql = "select * from company";
		jdbc = new JDBCUtil(); /* 初始化数据库类对象 */
		int state = -1;
		state = company.getId();
		if (state > 0) {
			countSql += " where state =" + state;
			selectSql += " where state =" + state;
		}
		rs = jdbc.executeQuery(countSql); /* 执行sql语句 */
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
		selectSql += " limit " + start + ", " + pageSize + "";
		System.out.println(selectSql);
		rs = jdbc.executeQuery(selectSql);
		while (rs.next()) {
			Company c = new Company();
			c.setName(rs.getString("name"));
			c.setAddress(rs.getString("address"));
			c.setPassword(rs.getString("password"));
			c.setTelphone(rs.getLong("telphone"));
			c.setRange(rs.getString("fanwei"));
			c.setCode(rs.getString("jigou"));
			c.setShuiwu(rs.getLong("shuiwu"));
			c.setTime(rs.getString("starttime"));
			c.setYyzz(rs.getString("yyzz"));
			c.setXy(rs.getString("xy"));
			c.setId(rs.getInt("id"));
			c.setUserPassport(rs.getString("userpassport"));
			c.setUserName(rs.getString("username"));
			c.setState(rs.getInt("state"));
			c.setIntroduce(rs.getString("introduce"));
			c.setPic(rs.getString("pic"));
			list.add(c); /* 将查询出来出来对象放到list数组 */
		}
		map.put("data", list);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);
		map.put("pageSize", pageSize);
		jdbc.close();
		return map;
	}

	public int check(Company company) throws SQLException {
		int result = 0;
		jdbc = new JDBCUtil();
		String updateSql = "update company set state = " + company.getState() + " where id = " + company.getId();
		System.out.println(updateSql);
		result = jdbc.executeUpdate(updateSql);
		jdbc.close();
		return result;
	}
}
