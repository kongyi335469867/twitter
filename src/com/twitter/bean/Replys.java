package com.twitter.bean;

import java.sql.Timestamp;

public class Replys {
	private int rid;	//回复ID
	private int uid;	//用户ID
	private int tid;	//转发ID
	private String rcontent;	//回复内容
	private Timestamp rtime;	//回复时间
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public Timestamp getRtime() {
		return rtime;
	}
	public void setRtime(Timestamp rtime) {
		this.rtime = rtime;
	}
	
	
	
}
