package com.twitter.bean;

import com.sun.jmx.snmp.Timestamp;

public class Tweets {
	private int tid;	//推文ID
	private int uid;	//用户ID
	private String tcontent;	//推文内容
	private Timestamp ttime;	//推文发布时间
	private String tpic;		//推文图片
	private String tvideo;		//推文视频
	private int treply;			//推文回复数量
	private int tforward;		//转发推文数量
	private int tlike;			//点赞数量
	private int tzhuan;			//是否删除推文 1-存在/0-删除
	public int getTid() {
		return tid;
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
	public int getTzhuan() {
		return tzhuan;
	}
	public void setTzhuan(int tzhuan) {
		this.tzhuan = tzhuan;
	}
	
	
}
