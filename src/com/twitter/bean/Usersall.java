package com.twitter.bean;

import java.sql.Timestamp;

public class Usersall {
	private int uid;	//用户id
	private String uname;	//e-mail
	private String upwd;	//用户密码
	private String urealname;	//用户真实姓名
	private String uaite;		//用户登录名
	private int ustate;			//用户状态
	private Timestamp utime;	//注册时间
	private int uonline;		//在线状态
	private String uaddress;	//用户地址
	private String uabout;		//用户简介
	private Timestamp udate;	//用户出生日期
	private String ulogo;		//用户头像
	private String ubg;			//用户背景图
	private int ufans;			//用户关注者人数
	private int utweet;			//用户推文数
	private int ufollow;		//用户正在关注的人数
	private String ucolor;		//用户背景色
	private int guanzhu;		//关注ע
	private Timestamp lastTime;

	public Timestamp getLastTime() {
		return lastTime;
	}

	public void setLastTime(Timestamp lastTime) {
		this.lastTime = lastTime;
	}

	public int getGuanzhu() {
		return guanzhu;
	}

	public void setGuanzhu(int guanzhu) {
		this.guanzhu = guanzhu;
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

	public int getUonline() {
		return uonline;
	}

	public void setUonline(int uonline) {
		this.uonline = uonline;
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

	public String getUbg() {
		return ubg;
	}

	public void setUbg(String ubg) {
		this.ubg = ubg;
	}

	public int getUfans() {
		return ufans;
	}

	public void setUfans(int ufans) {
		this.ufans = ufans;
	}

	public int getUtweet() {
		return utweet;
	}

	public void setUtweet(int utweet) {
		this.utweet = utweet;
	}

	public int getUfollow() {
		return ufollow;
	}

	public void setUfollow(int ufollow) {
		this.ufollow = ufollow;
	}

	public String getUcolor() {
		return ucolor;
	}

	public void setUcolor(String ucolor) {
		this.ucolor = ucolor;
	}

}
