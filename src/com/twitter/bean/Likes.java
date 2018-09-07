package com.twitter.bean;



import com.sun.jmx.snmp.Timestamp;

public class Likes {
	private int lid;	//点赞ID
	private int uid;	//用户ID
	private int tid;	//转发ID
	private Timestamp ltime;	//点赞时间
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
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
	public Timestamp getLtime() {
		return ltime;
	}
	public void setLtime(Timestamp ltime) {
		this.ltime = ltime;
	}
	
	
	
}
