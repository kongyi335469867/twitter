package com.twitter.dao;

import java.sql.Timestamp;
import java.util.List;

import com.twitter.pojo.Notification;
import com.twitter.util.DBUtil;

public class NotificationDao {
	//添加通知内容
	public int addNotify(int nuid, int ntype, int nlikeuid, int nliketid, int nreduid, int nretid, int nuided,
			int nhuiuid, int nhuitid, String nrcontent, Timestamp ntime, int nstate) {
		String sql = "insert into  notification(nuid,ntype,nlikeuid,nliketid,nreuid,nretid,nuided,nhuiuid,nhuitid,nrcontent,ntime,nstate) values(?,?,?,?,?,?,?,?,?,?,?,?)";
		int n = DBUtil.update(sql, nuid, ntype, nlikeuid, nliketid, nreduid, nretid, nuided, nhuiuid, nhuitid,
				nrcontent, ntime, nstate);
		return n;
	}
//获取所有的通知内容
	public List<Notification> getAll(int uid, int page) {
		String sql = "select nid,nuid,ntype,nlikeuid,nliketid,nreuid,nretid,nuided,nhuiuid,nhuitid,nrcontent,ntime,nstate from notification where nlikeuid=? or nreuid = ? or nuided = ? or nhuiuid = ? order by ntime desc limit ? , 10";
		List<Notification> list = DBUtil.query(Notification.class, sql, uid, uid, uid, uid, page);
		if (list.size() > 0) {
			return list;
		}
		return null;
	}
 //获取通知状态，1已读，0未读
	public int setState(int uid) {
		String sql = "update notification set nstate=1 where nstate=0 and (nlikeuid=? or nreuid = ? or nuided = ? or nhuiuid = ?)";
		int n = DBUtil.update(sql, uid, uid, uid, uid);
		return n;
	}
//获取未读的通知
	public int getNoRead(int uid) {
		String sql = "select nid,nuid,ntype,nlikeuid,nliketid,nreuid,nretid,nuided,nhuiuid,nhuitid,nrcontent,ntime,nstate from notification where nstate = 0 and (nlikeuid=? or nreuid = ? or nuided = ? or nhuiuid = ?)";
		List<Notification> list = DBUtil.query(Notification.class, sql, uid, uid, uid, uid);
		if (list.size() > 0) {
			return list.size();
		}
		return 0;
	}

}
