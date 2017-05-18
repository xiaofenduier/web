package com.zhaopin.entity;

public class User {

	private int id;
	private String realName;
	private String password;
	private long telphone;
	private String email;
	private String sex;
	private int jianliId;
	private Jianli jl;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public long getTelphone() {
		return telphone;
	}
	public void setTelphone(long telphone) {
		this.telphone = telphone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getJianliId() {
		return jianliId;
	}
	public void setJianliId(int jianliId) {
		this.jianliId = jianliId;
	}
	public Jianli getJl() {
		return jl;
	}
	public void setJl(Jianli jl) {
		this.jl = jl;
	}
}
