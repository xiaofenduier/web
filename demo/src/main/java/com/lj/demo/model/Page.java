package com.lj.demo.model;

/**
 * @author liujie
 * @version 创建时间：2017年8月28日 下午2:52:44 类说明
 */
public class Page {
	private Integer currentPage;
	private Integer pageSize;
	private Integer start;
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	
}
