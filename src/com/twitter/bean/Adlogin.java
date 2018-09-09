package com.twitter.bean;

import java.sql.Timestamp;

public class Adlogin {
	private int adid;  /* 管理员登录状况id */
	private int aid;   /* 管理员id */
	private Timestamp aditime;  /* 管理员最近登录时间 */
	private Timestamp adotime;  /* 管理员最近离开时间 */

	public int getAdid() {
		return adid;
	}

	public void setAdid(int adid) {
		this.adid = adid;
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public Timestamp getAditime() {
		return aditime;
	}

	public void setAditime(Timestamp aditime) {
		this.aditime = aditime;
	}

	public Timestamp getAdotime() {
		return adotime;
	}

	public void setAdotime(Timestamp adotime) {
		this.adotime = adotime;
	}
}
