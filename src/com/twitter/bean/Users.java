package com.twitter.bean;

import java.sql.Timestamp;

public class Users {
	private int uid;	//用户ID
	private String uname;	//用户邮箱
	private String upwd;	//用户密码
	private String urealname;	//用户真实姓名
	private String uaite;		//用户登录名
	private int ustate;			//用户状态
	private Timestamp utime;	//注册时间
	private int uonline;		//在线状态״̬
	public int getUonline() {
		return uonline;
	}

	public void setUonline(int uonline) {
		this.uonline = uonline;
	}

	public int getUstate() {
		return ustate;
	}

	public void setUstate(int ustate) {
		this.ustate = ustate;
	}

	public Timestamp getUtime() {
		return utime;
	}

	public void setUtime(Timestamp utime) {
		this.utime = utime;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUrealname() {
		return urealname;
	}
	public void setUrealname(String urealname) {
		this.urealname = urealname;
	}
	public String getUaite() {
		return uaite;
	}
	public void setUaite(String uaite) {
		this.uaite = uaite;
	}

	
	
	
	
}
