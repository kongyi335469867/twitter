package com.twitter.bean;

import java.sql.Timestamp;

public class Signin {
	private int sid;	//登录状态ID
	private int uid;	//用户ID
	private Timestamp stime;	//登录时间
	private Timestamp sdtime;	//退出时间
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public Timestamp getStime() {
		return stime;
	}
	public void setStime(Timestamp stime) {
		this.stime = stime;
	}
	public Timestamp getSdtime() {
		return sdtime;
	}
	public void setSdtime(Timestamp sdtime) {
		this.sdtime = sdtime;
	}
	
	
}
