package com.twitter.bean;

import java.sql.Timestamp;

public class Admins {
	private int aid;  /* 管理员id */
	private String aname;  /* 管理员登录名  */
	private String apwd;  /* 管理员密码 */
	private Timestamp atime; /* 管理员注册时间：Timestamp:时间格式为 类似 2018-08-11 12:22:00 ,默认值为当前时间  */
	private int astate;  /* 管理员状态，默认为1 */
	private int apower;  /* 管理员权限，默认为1，暂保留 */

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getApwd() {
		return apwd;
	}

	public void setApwd(String apwd) {
		this.apwd = apwd;
	}

	public Timestamp getAtime() {
		return atime;
	}

	public void setAtime(Timestamp atime) {
		this.atime = atime;
	}

	public int getApower() {
		return apower;
	}

	public void setApower(int apower) {
		this.apower = apower;
	}

	public int getAstate() {
		return astate;
	}

	public void setAstate(int astate) {
		this.astate = astate;
	}

}
