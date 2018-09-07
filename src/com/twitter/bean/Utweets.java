package com.twitter.bean;

import java.sql.Timestamp;

public class Utweets {
	private int tid;	//推文ID
	private int uid;	//用户ID
	private String tcontent;	//推文内容
	private Timestamp ttime;	//推文时间
	private String tpic;		//推文图片
	private String tvideo;		//推文视频
	private int treply;			//回复推文
	private int tforward;		//转发推文数
	private int tlike;			//推文点赞数
	private String uname;		//e-mail
	private String upwd;		//用户密码
	private String urealname;	//用户真实姓名
	private String uaite;		//用户登录名
	private int uonline;		//用户在线状态
	private String uabout;		//用户简介
	private String ulogo;		//用户头像
	private String ubg;			//用户背景图
	private int ufans;			//用户关注者人数
	private int utweet;			//用户推文数
	private int ufollow;		//用户正关注的人数
	private String ucolor;		//用户背景色
	private String time;		//时间
	private Utweets utweets;
	private int tzhuan;
	private int zaned;
	private int zhuaned;

	public int getZaned() {
		return zaned;
	}

	public void setZaned(int zaned) {
		this.zaned = zaned;
	}

	public int getZhuaned() {
		return zhuaned;
	}

	public void setZhuaned(int zhuaned) {
		this.zhuaned = zhuaned;
	}

	public int getTzhuan() {
		return tzhuan;
	}

	public void setTzhuan(int tzhuan) {
		this.tzhuan = tzhuan;
	}

	public Utweets getUtweets() {
		return utweets;
	}

	public void setUtweets(Utweets utweets) {
		this.utweets = utweets;
	}

	public int getTid() {
		return tid;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getTcontent() {
		return tcontent;
	}

	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}

	public Timestamp getTtime() {
		return ttime;
	}

	public void setTtime(Timestamp ttime) {
		this.ttime = ttime;
	}

	public String getTpic() {
		return tpic;
	}

	public void setTpic(String tpic) {
		this.tpic = tpic;
	}

	public String getTvideo() {
		return tvideo;
	}

	public void setTvideo(String tvideo) {
		this.tvideo = tvideo;
	}

	public int getTreply() {
		return treply;
	}

	public void setTreply(int treply) {
		this.treply = treply;
	}

	public int getTforward() {
		return tforward;
	}

	public void setTforward(int tforward) {
		this.tforward = tforward;
	}

	public int getTlike() {
		return tlike;
	}

	public void setTlike(int tlike) {
		this.tlike = tlike;
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

	public int getUonline() {
		return uonline;
	}

	public void setUonline(int uonline) {
		this.uonline = uonline;
	}

	public String getUabout() {
		return uabout;
	}

	public void setUabout(String uabout) {
		this.uabout = uabout;
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
