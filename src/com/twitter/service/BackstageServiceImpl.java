package com.twitter.service;

import java.util.ArrayList;
import java.util.List;

import com.twitter.dao.BackstageDaoImpl;

public class BackstageServiceImpl {
	
	/*单例模式*/
	private static BackstageServiceImpl backstageServiceImpl;
	private BackstageServiceImpl(){		
	}
	public static BackstageServiceImpl getBackstageServiceImpl(){
		if(backstageServiceImpl == null){
			backstageServiceImpl = new BackstageServiceImpl();
		}
		return backstageServiceImpl;
	}
	
	/*查询在线人数*/
	public int queryOnline(){
		int onlineNum = BackstageDaoImpl.getBackstageDaoImpl().queryOnline();
		return onlineNum;
	}
	
	/*查询今日访问量*/
	public int queryVisits(){
		int visitsNum = BackstageDaoImpl.getBackstageDaoImpl().queryVisits();
		return visitsNum;
	}
	
	/*查询推文数*/
	public int queryTweets(){
		int tweetsNum = BackstageDaoImpl.getBackstageDaoImpl().queryTweets();
		return tweetsNum;
	}
	
	/*查询总人数*/
	public int queryOverAll(){
		int overAllNum = BackstageDaoImpl.getBackstageDaoImpl().queryOverAll();
		return overAllNum;
	}
	
	/*查询后台页面"用户中心"所需的用户信息*/
	public List<String[]> queryUsersall(){
		List<String[]> usersallList = new ArrayList<String[]>();
		usersallList = BackstageDaoImpl.getBackstageDaoImpl().queryUsersall();
		return usersallList;
	}
	
	/*查询用户最近登录的时间*/
//	public String queryLastSignin(int uid){
//		String lastSignin = BackstageDaoImpl.getBackstageDaoImpl().getLastSignin(uid);
//		return lastSignin;
//	}
	
	/* “用户中心”页面的分页查询 */
	public List<String[]> getUsersallListForCurrentPage(int currentPage, int pageSize){
		List<String[]> usersList = new ArrayList<String[]>();
		usersList = BackstageDaoImpl.getBackstageDaoImpl().getUsersallListForCurrentPage(currentPage, pageSize);
    	for(String[] user: usersList){
    		if("0".equals(user[3])){
    			user[3] = "解封";
    		}else if("1".equals(user[3])){
    			user[3] = "停封";
    		}
    	}
		return usersList;
	}
	
	/* “用户中心”页面的修改用户账号解封状态 */
	public boolean updateUstate(String Ustate, String Uid){
		boolean updateResult = BackstageDaoImpl.getBackstageDaoImpl().updateUstate(Ustate, Uid);
		if(updateResult){   //账号本身停封状态，页面点击后将其修改为解封状态显示，故返回状态ustate要为0
			updateResult = true;
		}else {
			updateResult = false;
		}
		return updateResult;
	}
	
	/* 根据搜索用户名查询用户 */
	public List<String[]> queryUser(String urealname){
		List<String[]> userallList = BackstageDaoImpl.getBackstageDaoImpl().queryUserall(urealname);
		for(String[] user: userallList){
    		if("0".equals(user[3])){
    			user[3] = "解封";
    		}else if("1".equals(user[3])){
    			user[3] = "停封";
    		}
    	}
		return userallList;
	}
	
	/* “用户中心”按照最近时间进行排序 */
	public List<String[]> queryUserSort(int currentPage, int pageSize){
		List<String[]> userallList = BackstageDaoImpl.getBackstageDaoImpl().queryUserSort(currentPage, pageSize);
    	for(String[] user: userallList){
    		if("0".equals(user[3])){
    			user[3] = "解封";
    		}else if("1".equals(user[3])){
    			user[3] = "停封";
    		}
    	}
		return userallList;
	}
	
	/*查询后台页面“推文中心”所需的推文信息*/
	public List<String[]> queryUTweets(){
		List<String[]> utweetsList = new ArrayList<String[]>();
		utweetsList = BackstageDaoImpl.getBackstageDaoImpl().queryUTweets();
		return utweetsList;
	}
	
	/* “推文中心”页面的分页查询 */
	public List<String[]> getUTweetsListForCurrentPage(int currentPage, int pageSize){
		List<String[]> tweetsList = new ArrayList<String[]>();
		tweetsList = BackstageDaoImpl.getBackstageDaoImpl().getUTweetsListForCurrentPage(currentPage, pageSize);
		return tweetsList;
	}
	
	/* “推文中心”页面的删除推文 */
	public int deleteTweet(String Tid) {
		boolean result = BackstageDaoImpl.getBackstageDaoImpl().deleteTweet(Tid);
		int delete; 
		if(result){
			delete = 1;
		}else{
			delete = 0;
		}
		return delete;
	}
	
	/* 根据搜索用户名查询该用户下的所有推文，且分页查询 */
	public List<String[]> queryUserTweets(int currentPage, int pageSize, String urealname){
		List<String[]> tweetsList = new ArrayList<String[]>();
		tweetsList = BackstageDaoImpl.getBackstageDaoImpl().getUTweetsListForCurrentPage(currentPage, pageSize, urealname);
		return tweetsList;
	}
	
	/* 查找修改的管理员名是否重复 */
	public boolean queryAdminName(String uAdminName){
		boolean result = BackstageDaoImpl.getBackstageDaoImpl().queryAdminName(uAdminName);
		return result;
	}
	
	/* 查询管理员登录密码是否输入匹配 */
	public boolean queryAdminPW(String aid, String updateOldPW){
		int adminId = Integer.parseInt(aid);
		boolean result = BackstageDaoImpl.getBackstageDaoImpl().queryAdminPW(adminId, updateOldPW);
		return result;
	}
	
	/* 修改管理员信息 */
	public boolean updateAdmin(String aid, String uAdminName, String updateNewPW){
		int adminId = Integer.parseInt(aid);
		boolean result = BackstageDaoImpl.getBackstageDaoImpl().updateAdmin(adminId, uAdminName, updateNewPW);
		return result;
	}
}
