package com.twitter.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.twitter.bean.Admins;
import com.twitter.util.BackstageDBUtil;

public class BackstageDaoImpl {
	public int usersRowCount;  /*用户数据总条数*/
	public int usersPageCount;  /*用户总页面*/
	public int tweetsRowCount;  /*推文数据总条数*/
	public int tweetsPageCount; /*推文总页面*/
	
	/*单例模式*/
	private static BackstageDaoImpl backstageDaoImpl;
	private BackstageDaoImpl(){
		
	}
	public static BackstageDaoImpl getBackstageDaoImpl(){
		if(backstageDaoImpl == null){
			backstageDaoImpl = new BackstageDaoImpl();
		}
		return backstageDaoImpl;
	}
	
	/*Dao层实现查询管理员登录名和密码是否匹配*/
	public boolean adminLogin(String adminname, String adminpw) {
		boolean loginResult = false;
		try {
			String sql = "select astate from admins where aname = ? and apwd = ?";
			Object[] os = { adminname, adminpw };
			ResultSet rs = BackstageDBUtil.executeQuery(sql, os);
			if(rs.next()){
				if(rs.getInt(1) == 1){  //管理员账号状态为1，允许登录
					loginResult = true;
				}else{     //管理员账号状态为0，允许登录
					loginResult = false;
				}
			}else{    //管理员账号密码不匹配，不允许登录
				loginResult = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return loginResult;
	}
	
	/* Dao层实现查询管理员信息 */
	public Admins queryAdminDB(String adminname){
		Admins adminDB = new Admins();
		try {
			String sql = "select * from admins where aname = ?";
			Object[] os = { adminname };
			ResultSet rs = BackstageDBUtil.executeQuery(sql, os);
			if(rs.next()){
				adminDB.setAid(rs.getInt("aid"));
				adminDB.setAname(rs.getString("aname"));
				adminDB.setApwd(rs.getString("apwd"));
				adminDB.setAtime(rs.getTimestamp("atime"));
				adminDB.setAstate(rs.getInt("astate"));
				adminDB.setApower(rs.getInt("apower"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return adminDB;
	}
	
	/* Dao层实现管理员登入、登出时间戳的记录  */
	public void addAdminTime(int aid, java.sql.Timestamp aditime, java.sql.Timestamp adotime){
		String sql = "insert into adlogin(adid, aid, aditime, adotime) value(null, ?, ?, ?)";
		Object[] os = { aid, aditime, adotime };
		BackstageDBUtil.executeAddOrUpdateOrDelete(sql, os);
	}
	
	/*Dao层实现*查询在线人数*/
	public int queryOnline(){
		int onlineNum = 0;
		String sql = "select count(uid) from users where uonline = 1";
		Object[] os = null;
		ResultSet rs = BackstageDBUtil.executeQuery(sql, os);
		try {
			if(rs.next()){
				onlineNum = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return onlineNum;
	}
	/*Dao层实现*查询今日访问量*/
	public int queryVisits(){
		int visitsNum = 0;
		String sql = "select count(uid) from signin where DATE(stime) = CURDATE() ";
		Object[] os = null;
		ResultSet rs = BackstageDBUtil.executeQuery(sql, os);
		try {
			if(rs.next()){
				visitsNum = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return visitsNum;
	}
	/*Dao层实现查询推文数*/
	public int queryTweets(){
		int tweetsNum = 0;
		String sql = "select count(tid) from tweets";
		Object[] os = null;
		ResultSet rs = BackstageDBUtil.executeQuery(sql, os);
		try {
			if(rs.next()){
				tweetsNum = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tweetsNum;
	}
	/*Dao层实现查询总人数*/
	public int queryOverAll(){
		int overAllNum = 0;
		String sql = "select count(uid) from users";
		Object[] os = null;
		ResultSet rs = BackstageDBUtil.executeQuery(sql, os);
		try {
			if(rs.next()){
				overAllNum = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return overAllNum;
	} 
	
	/*Dao层实现根据用户id查询后台页面“用户中心”所需的 每个 用户信息(users表、usersinfo表;建造usersall视图)
	 * (包括用户真实名urealname，用户登录名uatie，用户状态ustate；用户头像ulogo)
	 */
	public String[] queryUserall(int uid){
		String sql = "select urealname, uaite, ustate, ulogo from usersall where uid = ?";
		Object[] os = { uid };
		String[] userall = null;
		try {
			ResultSet rs = BackstageDBUtil.executeQuery(sql, os);
			if(rs.next()){
				String urealname = rs.getString("urealname");
				String uaite = rs.getString("uaite");
				String ustate = String.valueOf(rs.getInt("ustate"));
				String ulogo = rs.getString("ulogo");
				userall = new String[]{urealname, uaite, ustate, ulogo};
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return userall;
	}
	/*Dao层实现查询用户最近登录时间*/
	public Timestamp getLastSignin(int uid){
		String sql = "select stime from signin where uid = ? order by stime desc limit 1";
		Object[] os = { uid };
		Timestamp lastSignin = null;
		ResultSet rs = BackstageDBUtil.executeQuery(sql, os);
		try {
			if(rs.next()){
				lastSignin = rs.getTimestamp(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lastSignin;
	}
	
	/*Dao层实现打包后台页面“用户中心”所需的 所有 用户个人信息（集合形式返回上层）*/
	public List<String[]> queryUsersall(){
		List<String[]> usersall = new ArrayList<String[]>();
		String[] userall = null;
		String sql = "select uid, urealname, uaite, ustate, ulogo from usersall";
		Object[] os = null;
		try {
			ResultSet rs = BackstageDBUtil.executeQuery(sql, os);
			if(rs.next()){
				int uidInt = rs.getInt("uid");
				String uid = String.valueOf(uidInt);
				String lastSignin = getLastSignin(uidInt).toString();
				String urealname = rs.getString("urealname");
				String uaite = rs.getString("uaite");
				String ustate = String.valueOf(rs.getInt("ustate"));
				String ulogo = rs.getString("ulogo");
				userall = new String[]{uid, urealname, uaite, ustate, ulogo, lastSignin};
				usersall.add(userall);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usersall;
	}
	
	/*Dao层实现“用户中心”分页效果实现*/
	public List<String[]> getUsersallListForCurrentPage(int currentPage, int pageSize){
		List<String[]> usersallList = new ArrayList<String[]>();
		try {
			usersRowCount = queryOverAll();
			if((usersRowCount%pageSize) == 0){
				usersPageCount = usersRowCount/pageSize;
			}else{
				usersPageCount = usersRowCount/pageSize + 1;
			}
			String sqlPage = "select uid, urealname, uaite, ustate, ulogo from usersall limit " + pageSize*(currentPage-1) + "," + (pageSize+1) + "";
			Object[] osPage = null;
			ResultSet rsPage = BackstageDBUtil.executeQuery(sqlPage, osPage);
			while(rsPage.next()){
				String[] str = new String[]{null,null,null,null,null,null,null};
				str[0] = String.valueOf(rsPage.getInt("uid"));  //用户id
				str[1] = rsPage.getString("urealname");  //用户真实姓名
				str[2] = rsPage.getString("uaite");  //用户登录名
				str[3] = String.valueOf(rsPage.getInt("ustate"));  //用户账户状态
				str[4] = rsPage.getString("ulogo");  //用户头像
				str[5] = getLastSignin(rsPage.getInt("uid")).toString();  //用户最近登录时间
				str[6] = null;  //预留空间，解封按钮背景颜色
				usersallList.add(str);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usersallList;
	}
	
	/* Dao层实现“用户中心”按用户最近登录时间进行排序 */
	public List<String[]> queryUserSort(int currentPage, int pageSize){
		List<String[]> userallList = new ArrayList<String[]>();
		try {
			usersRowCount = queryOverAll();
			if((usersRowCount%pageSize) == 0){
				usersPageCount = usersRowCount/pageSize;
			}else{
				usersPageCount = usersRowCount/pageSize + 1;
			}
			String sql = "select usersall.uid, urealname, uaite, ustate, ulogo, stime from usersall, signin "
					+ "where usersall.uid = signin.uid GROUP BY usersall.uid order by stime desc "
					+ "limit " + pageSize*(currentPage-1) + "," + (pageSize+1) + "";
			Object[] os = null;
			ResultSet rs = BackstageDBUtil.executeQuery(sql, os);
			while(rs.next()){
				String[] str = {null, null, null, null, null, null, null};
				str[0] = String.valueOf(rs.getInt("usersall.uid"));  //用户id
				str[1] = rs.getString("urealname");  //用户真实姓名
				str[2] = rs.getString("uaite");  //用户登录名
				str[3] = String.valueOf(rs.getInt("ustate"));  //用户账户状态
				str[4] = rs.getString("ulogo");  //用户头像
				str[5] = rs.getTimestamp("stime").toString();  //用户最近登录时间
				str[6] = null;  //预留空间，解封按钮背景颜色
				userallList.add(str);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userallList;
	}
	
	/*Dao层实现根据用户名查询后台页面“用户中心”所需的 用户信息 */
	public List<String[]> queryUserall(String urealname){
		List<String[]> userInfoList = new ArrayList<String[]>();
		//String sql = "select uid, urealname, uaite, ustate, ulogo from usersall where urealname = ?";
		//模糊搜索方式1：
		String fuzzySearchSQL = "select uid, urealname, uaite, ustate, ulogo from usersall where urealname like '%" + urealname + "%'";
		//模糊搜索方式2：
		//String fuzzySearchSQL = "select uid, urealname, uaite, ustate, ulogo from usersall where urealname >= '"+urealname+"' and urealname < CONCAT('"+urealname+"', x'EFBFBF')"; 
		Object[] os = null;
		try {
			ResultSet rs = BackstageDBUtil.executeQuery(fuzzySearchSQL, os);
			while(rs.next()){
				String[] str = {null, null, null, null, null, null, null};
				str[0] = String.valueOf(rs.getInt("uid"));   //用户id
				str[1] = rs.getString("urealname");   //用户真实姓名
				str[2] = rs.getString("uaite");   //用户登录名
				str[3] = String.valueOf(rs.getInt("ustate"));    //用户账户状态
				str[4] = rs.getString("ulogo");   //用户头像
				str[5] = getLastSignin(rs.getInt("uid")).toString(); //用户最近登录时间
				str[6] = null;  //预留空间，解封按钮背景颜色
				userInfoList.add(str);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userInfoList;
	}
	
	/* Dao层实现“用户中心”页面修改用户账号的解封状态 */
	public boolean updateUstate(String Ustate, String Uid){
		int ustate = Integer.parseInt(Ustate);
		int uid = Integer.parseInt(Uid);
		String sql = "update users set ustate = ? where uid = ?";
		Object[] os = {ustate, uid};
		boolean updateResult = BackstageDBUtil.executeAddOrUpdateOrDelete(sql, os);
		return updateResult;
	}
	
	
	/*Dao层实现打包后台页面“推文中心”所需的 所有推文相关信息(users表、tweets表;建造utweets视图)
	 * （包括用户真实名urealname，用户登录名uatie，用户头像ulogo，推文表内容tcontent，推文发布时间ttime）
	 * */
	public List<String[]> queryUTweets(){
		List<String[]> utweetsList = new ArrayList<String[]>(); /*集合，所有推文内容*/
		String[] tweets = null;  /*一条推文内容*/
		String sql = "select uid, urealname, uaite, ulogo, tid, tcontent, ttime from utweets";
		Object[] os = null;
		try {
			ResultSet rs = BackstageDBUtil.executeQuery(sql, os);
			while(rs.next()){
				String uid = String.valueOf(rs.getInt("uid"));
				String urealname = rs.getString("urealname");
				String uatie = rs.getString("uaite");
				String ulogo = rs.getString("ulogo");
				String tid = String.valueOf(rs.getInt("tid"));
				String tcontent = rs.getString("tcontent");
				String ttime = rs.getTimestamp("ttime").toString();
				tweets = new String[]{uid,urealname, uatie, ulogo, tid, tcontent, ttime};
				utweetsList.add(tweets);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return utweetsList;
	}
	
	/*Dao层实现“推文中心”分页效果实现*/
	public List<String[]> getUTweetsListForCurrentPage(int currentPage, int pageSize){
		List<String[]> utweetsList = new ArrayList<String[]>();
		try {
			tweetsRowCount = queryTweets();
			if((tweetsRowCount%pageSize) == 0){
				tweetsPageCount = tweetsRowCount/pageSize;
			}else{
				tweetsPageCount = tweetsRowCount/pageSize + 1;
			}
			String sqlPage = "select uid, urealname, uaite, ulogo, tid, tcontent, ttime from utweets limit " + pageSize*(currentPage-1) + "," + pageSize + "";
			Object[] osPage = null;
			ResultSet rsPage = BackstageDBUtil.executeQuery(sqlPage, osPage);
			while(rsPage.next()){
				String[] str = new String[]{null,null,null,null,null,null,null};
				str[0] = String.valueOf(rsPage.getInt("uid"));  //用户id
				str[1] = rsPage.getString("urealname");   //用户真实姓名
				str[2] = rsPage.getString("uaite");   //用户登录名
				str[3] = rsPage.getString("ulogo");   //用户头像
				str[4] = String.valueOf(rsPage.getInt("tid"));  //推文id
				str[5] = rsPage.getString("tcontent");  //推文内容
				str[6] = rsPage.getTimestamp("ttime").toString();  //推文发布时间
				utweetsList.add(str);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return utweetsList;
	}
	
	/* Dao层实现“推文中心”页面的删除推文 */
	public boolean deleteTweet(String Tid) {
		int tid = Integer.parseInt(Tid);
		String sql = "delete from tweets where tid = ?";
		Object[] os = { tid };
		boolean result = BackstageDBUtil.executeAddOrUpdateOrDelete(sql, os);
		return result;
	}
	
	/*Dao层实现“推文中心” 按照界面搜索字段查询且分页 */
	public List<String[]> getUTweetsListForCurrentPage(int currentPage, int pageSize, String urealname){
		List<String[]> userTweetsList = new ArrayList<String[]>();
		try {
			tweetsRowCount = queryTweets();
			if((tweetsRowCount%pageSize) == 0){
				tweetsPageCount = tweetsRowCount/pageSize;
			}else{
				tweetsPageCount = tweetsRowCount/pageSize + 1;
			}
			String sqlPage = "select uid, uaite, ulogo, tid, tcontent, ttime from utweets where urealname like '%" + urealname + "%' limit " + pageSize*(currentPage-1) + "," + pageSize + "";
			Object[] osPage = null;
			ResultSet rsPage = BackstageDBUtil.executeQuery(sqlPage, osPage);
			while(rsPage.next()){
				String[] str = new String[]{null,null,null,null,null,null,null};
				str[0] = String.valueOf(rsPage.getInt("uid"));  //用户id
				str[1] = urealname;   //用户真实姓名
				str[2] = rsPage.getString("uaite");   //用户登录名
				str[3] = rsPage.getString("ulogo");   //用户头像
				str[4] = String.valueOf(rsPage.getInt("tid"));  //推文id
				str[5] = rsPage.getString("tcontent");  //推文内容
				str[6] = rsPage.getTimestamp("ttime").toString();  //推文发布时间
				userTweetsList.add(str);
			}
			for(String[] tweet : userTweetsList){
				System.out.println(tweet[0] + "  "+tweet[1] + "  "+tweet[2] + "  "+tweet[3] + "  "+tweet[4] + "  "+tweet[5] + "  "+tweet[6] + "  ");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userTweetsList;
	}
	
	/* Dao层实现“关于”页面的修改管理员信息 */
	/* 查询所修改的管理员名是否已经存在 */
	public boolean queryAdminName(String uAdminName){
		boolean result = false;
		try {
			int astate;
			String sql = "select astate from admins where aname = ?";
			Object[] os = { uAdminName };
			ResultSet rs = BackstageDBUtil.executeQuery(sql, os);
			if(rs.next()){
				astate = rs.getInt(1);
				if("1".equals(astate)){    /*查询到了且返回管理员账号状态为1时，不支持此次修改，返回false*/
					result = false;
				}else if("0".equals(astate)){    /*查询到了但返回管理员账号状态为0时，支持此次修改，返回true*/
					result = true;
				}
			}else{     /*查询为空时符合修改标准，返回true*/
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	/* 查询管理员密码是否匹配 */
	public boolean queryAdminPW(int aid, String apwd){
		boolean result = false;
		try {
			String sql = "select apwd from admins where aid = ?";
			Object[] os = { aid };
			ResultSet rs = BackstageDBUtil.executeQuery(sql, os);
			String apwdDB;
			if(rs.next()){
				apwdDB = rs.getString(1);
				if(apwd.equals(apwdDB)){
					result = true;
				}else{
					result = false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	/*修改管理员名和密码*/
	public boolean updateAdmin(int aid, String aname,String apwd){
		String sql = "update admins set aname = ?, apwd = ? where aid = ?";
		Object[] os = { aname, apwd, aid};
		boolean updateResult = BackstageDBUtil.executeAddOrUpdateOrDelete(sql, os);
		return updateResult;
	}
}
