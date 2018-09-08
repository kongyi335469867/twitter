package com.twitter.bean;

import java.sql.Timestamp;

public class Usersinfo {
	private int id;	//用户信息ID
	private int uid;	//用户ID
	private String uaddress;	//用户地址
	private String uabout;		//用户简介
	private Timestamp udate;	//用户出生日期
	private String ulogo;		//用户头像
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUaddress() {
		return uaddress;
	}
	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
	public String getUabout() {
		return uabout;
	}
	public void setUabout(String uabout) {
		this.uabout = uabout;
	}
	public Timestamp getUdate() {
		return udate;
	}
	public void setUdate(Timestamp udate) {
		this.udate = udate;
	}
	public String getUlogo() {
		return ulogo;
	}
	public void setUlogo(String ulogo) {
		this.ulogo = ulogo;
	}
	
	
}
