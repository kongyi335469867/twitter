package com.twitter.bean;

import com.sun.jmx.snmp.Timestamp;

public class Notification {
	private int nid;	//通知id
	private int nuid;	//通知用户id
	private int ntype;	//通知类型
	private int nlikeuid;	//非本人点赞用户id
	private int nliketid;	//点赞推文id
	private int nreuid;		//非本人转发推文用户id
	private int nretid;		//转发推文id
	private int nuided;		//非本人关注用户id
	private int nhuiuid;	//非本人回复推文用户id
	private String nrcontent;	//通知内容
	private Timestamp ntime;	//通知内容
	private int state;			//非本人通知读取状态 0未读/1已读
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public int getNuid() {
		return nuid;
	}
	public void setNuid(int nuid) {
		this.nuid = nuid;
	}
	public int getNtype() {
		return ntype;
	}
	public void setNtype(int ntype) {
		this.ntype = ntype;
	}
	public int getNlikeuid() {
		return nlikeuid;
	}
	public void setNlikeuid(int nlikeuid) {
		this.nlikeuid = nlikeuid;
	}
	public int getNliketid() {
		return nliketid;
	}
	public void setNliketid(int nliketid) {
		this.nliketid = nliketid;
	}
	public int getNreuid() {
		return nreuid;
	}
	public void setNreuid(int nreuid) {
		this.nreuid = nreuid;
	}
	public int getNretid() {
		return nretid;
	}
	public void setNretid(int nretid) {
		this.nretid = nretid;
	}
	public int getNuided() {
		return nuided;
	}
	public void setNuided(int nuided) {
		this.nuided = nuided;
	}
	public int getNhuiuid() {
		return nhuiuid;
	}
	public void setNhuiuid(int nhuiuid) {
		this.nhuiuid = nhuiuid;
	}
	public String getNrcontent() {
		return nrcontent;
	}
	public void setNrcontent(String nrcontent) {
		this.nrcontent = nrcontent;
	}
	public Timestamp getNtime() {
		return ntime;
	}
	public void setNtime(Timestamp ntime) {
		this.ntime = ntime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
}	
