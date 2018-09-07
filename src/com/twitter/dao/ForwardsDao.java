package com.twitter.dao;

import java.sql.Timestamp;
import java.util.List;

<<<<<<< HEAD
import com.twitter.pojo.Forwards;
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
=======
import com.twitter.bean.Forwards;
import com.twitter.util.DBUtil;
@SuppressWarnings("unchecked")
public class ForwardsDao {
	
	//通过转发用户id和用户id查询关注信息，从第二条开始
	public Forwards getForward(int tid, int uid) {
		String sql = "select fid,tid, stid  from forwards where stid=? and uid=? limit 1";		
		List<Forwards> list = DBUtil.query(Forwards.class, sql, tid, uid);
		if (list.size() > 0)
			return list.get(0);

		return null;
	}

	//通过推文id和关注时间查询关注信息，从第二条开始
	public Forwards getForward(int tid, Timestamp ftime) {
		String sql = "select fid,tid, stid  from forwards where tid=? and ftime=? limit 1";
		List<Forwards> list = DBUtil.query(Forwards.class, sql, tid, ftime);
		if (list.size() > 0)
			return list.get(0);

		return null;
	}

	//判断是否有关注信息，如果有则输出true，没有则输出false
	public boolean selForward(int uid, int stid) {
		String sql = "select fid,tid, stid,uid  from forwards where uid=? and stid=? limit 1";
		List<Forwards> list = DBUtil.query(Forwards.class, sql, uid, stid);

		if (list.size() > 0) {
			return true;
		}

		return false;
	}
	//添加数据
	public int addForward(int tid, int stid, int uid, Timestamp ftime) {	
>>>>>>> branch 'master' of https://git.coding.net/JIMMY_MIN/twitter.git
		String sql = "insert into forwards(tid, stid, uid,ftime) values(?,?,?,?)";
		int n = DBUtil.update(sql, tid, stid, uid, ftime);
		return n;
	}
}
