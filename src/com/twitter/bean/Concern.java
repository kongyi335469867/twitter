package com.twitter.bean;

public class Concern {
	private int cid;	//关注ID
	private int f_uid;	//关注者
	private int s_uid;	//被关注者
	private int cstate;	//1-相互关注/0未互相关注
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getF_uid() {
		return f_uid;
	}
	public void setF_uid(int f_uid) {
		this.f_uid = f_uid;
	}
	public int getS_uid() {
		return s_uid;
	}
	public void setS_uid(int s_uid) {
		this.s_uid = s_uid;
	}
	public int getCstate() {
		return cstate;
	}
	public void setCstate(int cstate) {
		this.cstate = cstate;
	}
	
	
}
