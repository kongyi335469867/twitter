package com.twitter.dao;

import java.sql.Timestamp;
import java.util.List;

import com.twitter.bean.Forwards;
import com.twitter.util.DBUtil;

public class ForwardsDao {
	public Forwards getForward(int tid, int uid) {
		String sql = "select fid,tid, stid  from forwards where stid=? and uid=? limit 1";
		List<Forwards> list = DBUtil.query(Forwards.class, sql, tid, uid);
		if (list.size() > 0)
			return list.get(0);

		return null;
	}
//获取转发数
	public Forwards getForward(int tid, Timestamp ftime) {
		String sql = "select fid,tid, stid  from forwards where tid=? and ftime=? limit 1";
		List<Forwards> list = DBUtil.query(Forwards.class, sql, tid, ftime);
		if (list.size() > 0)
			return list.get(0);

		return null;
	}

	public boolean selForward(int uid, int stid) {
		String sql = "select fid,tid, stid,uid  from forwards where uid=? and stid=? limit 1";
		List<Forwards> list = DBUtil.query(Forwards.class, sql, uid, stid);

		if (list.size() > 0) {
			return true;
		}

		return false;
	}
//转发
	public int addForward(int tid, int stid, int uid, Timestamp ftime) {
		String sql = "insert into forwards(tid, stid, uid,ftime) values(?,?,?,?)";
		int n = DBUtil.update(sql, tid, stid, uid, ftime);
		return n;
	}
}
