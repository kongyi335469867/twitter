package com.twitter.util;

import java.util.List;

public class Page {
	private int totalPage;  /*总页数*/
	private int totalCount; /*数据总条数*/
	private int pageSize;   /*页面大小*/
	private int currentPage; /*当前页码*/
	private List<Object> list; /*实体类集合*/
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		totalPage = this.totalCount%pageSize == 0 ? (this.totalCount / pageSize):(this.totalCount / pageSize + 1);
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public List<Object> getList() {
		return list;
	}
	public void setList(List<Object> list) {
		this.list = list;
	}
}
