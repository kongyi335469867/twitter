package com.twitter.bean;

import java.sql.Timestamp;

public class Forwards {
	private int fid;	//转发ID	
	private int tid;	//推文ID
	private int stid;	//转发推文ID
	private Timestamp ftime;	//转发时间
	private int uid;	//用户ID
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getStid() {
		return stid;
	}
	public void setStid(int stid) {
		this.stid = stid;
	}
	public Timestamp getFtime() {
		return ftime;
	}
	public void setFtime(Timestamp ftime) {
		this.ftime = ftime;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
	
}
