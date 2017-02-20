package com.user.manage.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "t_production")
public class productionModel extends PageModel{

	private int id;            //货物编号
	private String username;   //产品名称
	private int num;           //产品数量
	private Date productTime;       //产品生产日期
	private int expirationTime;       //产品保质期
	private String company;    //货物来源公司
	private Date inTime;       //货物接收时间
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Column
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Column
	public Date getProductTime() {
		return productTime;
	}
	public void setProductTime(Date productTime) {
		this.productTime = productTime;
	}
	@Column
	public int getExpirationTime() {
		return expirationTime;
	}
	public void setExpirationTime(int expirationTime) {
		this.expirationTime = expirationTime;
	}
	@Column
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	@Column
	public Date getInTime() {
		return inTime;
	}
	public void setInTime(Date inTime) {
		this.inTime = inTime;
	}
}
