package com.twitter.dao;

import java.sql.Timestamp;
import java.util.List;

import com.twitter.bean.Concern;
import com.twitter.util.DBUtil;

public class ConcernDao {
	//获取关注者
	public List<Concern> getSuid(int f_uid) {
		String sql = "select cid,f_uid,s_uid,cstate from concern where f_uid=? ";
		@SuppressWarnings("unchecked")
		//@SuppressWarnings()用于抑制编译器产生警告信息。
		List<Concern> list = DBUtil.query(Concern.class, sql, f_uid);
		if (list.size() > 0) {
			return list;
		}
		return null;
	}
//获取被关注者
	public List<Concern> getFuid(int s_uid) {
		String sql = "select cid,f_uid,s_uid,cstate from concern where s_uid=? ";
		@SuppressWarnings("unchecked")
		List<Concern> list = DBUtil.query(Concern.class, sql, s_uid);
		if (list.size() > 0) {
			return list;
		}
		return null;
	}
//当返回值为1的时候，
	public int hasFollow(int f_uid, int s_uid) {
		String sql = "select cid,f_uid,s_uid,cstate from concern where f_uid=? and s_uid=? limit 1";
		@SuppressWarnings("unchecked")
		List<Concern> list = DBUtil.query(Concern.class, sql, f_uid, s_uid);
		if (list.size() > 0) {
			return 1;
		}
		return 0;
	}
//关注
	public int addFollow(int f_uid, String s_uid, int mode, Timestamp ctime) {
		String sql = "insert into concern(f_uid,s_uid,cstate,ctime) values(?,?,?,?)";
		int n = DBUtil.update(sql, f_uid, s_uid, mode, ctime);
		return n;
	}
//取消关注
	public int delFollow(int f_uid, String s_uid) {
		String sql = "delete from concern where f_uid=? and s_uid=? limit 1";
		int n = DBUtil.update(sql, f_uid, s_uid);
		return n;
	}
//修改关注，
	public int updateFollow(String f_uid, int s_uid, int cstate) {
		String sql = "update concern set cstate=? where f_uid=? and s_uid=?";
		int n = DBUtil.update(sql, cstate, f_uid, s_uid);
		return n;
	}
}
