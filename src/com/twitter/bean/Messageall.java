package com.twitter.bean;

import java.sql.Timestamp;

public class Messageall {
	private int mid;	//私信id
	private int fuid;	//发信用户id	
	private int suid;	//收信用户id	
	private String mcontent;	//发信内容	
	private Timestamp mtime;	//发信时间	
	private int mread;		//读信状态	
	private String uname;	//e-mail	
	private String urealname;	//用户真实姓名	
	private String ulogo;		//用户头像	
	private String uname2;
	private String urealname2;
	private String ulogo2;
	private int uid2;

	public int getUid2() {
		return uid2;
	}

	public void setUid2(int uid2) {
		this.uid2 = uid2;
	}

	private String time;

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}


	@Override
	public String toString() {
		return "Messageall [mid=" + mid + ", fuid=" + fuid + ", mcontent=" + mcontent + ", urealname=" + urealname
				+ ", urealname2=" + urealname2 + "]";
	}

	public int getFuid() {
		return fuid;
	}

	public void setFuid(int fuid) {
		this.fuid = fuid;
	}

	public int getSuid() {
		return suid;
	}

	public void setSuid(int suid) {
		this.suid = suid;
	}

	public String getMcontent() {
		return mcontent;
	}

	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}

	public Timestamp getMtime() {
		return mtime;
	}

	public void setMtime(Timestamp mtime) {
		this.mtime = mtime;
	}

	public int getMread() {
		return mread;
	}

	public void setMread(int mread) {
		this.mread = mread;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUrealname() {
		return urealname;
	}

	public void setUrealname(String urealname) {
		this.urealname = urealname;
	}

	public String getUlogo() {
		return ulogo;
	}

	public void setUlogo(String ulogo) {
		this.ulogo = ulogo;
	}

	public String getUname2() {
		return uname2;
	}

	public void setUname2(String uname2) {
		this.uname2 = uname2;
	}

	public String getUrealname2() {
		return urealname2;
	}

	public void setUrealname2(String urealname2) {
		this.urealname2 = urealname2;
	}

	public String getUlogo2() {
		return ulogo2;
	}

	public void setUlogo2(String ulogo2) {
		this.ulogo2 = ulogo2;
	}
}
