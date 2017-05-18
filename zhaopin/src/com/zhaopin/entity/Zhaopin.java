package com.zhaopin.entity;

public class Zhaopin {

	private int id;
	private int companyId;
	private long telphone;
	private String endTime;
	private String startTime;
	private Company copmpany;
	public Company getCopmpany() {
		return copmpany;
	}
	public void setCopmpany(Company copmpany) {
		this.copmpany = copmpany;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public long getTelphone() {
		return telphone;
	}
	public void setTelphone(long telphone) {
		this.telphone = telphone;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
}
