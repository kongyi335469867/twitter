package com.twitter.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/*后台使用的连接数据库，使用数据源和连接池的方式实现*/
public class BackstageDBUtil {
	private static Connection conn = null;
	private static Statement stmt = null;
	private static PreparedStatement pstmt = null;
	private static InitialContext ctx = null;
	private static DataSource ds = null;

	/*通用，获取数据源 DataSource 对象的方法*/
	public static DataSource getDataSource(){
		try {
			ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/twitter");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return ds;
	}
	/*通用，根据数据源获取statement对象的方法*/
	public static Statement createStatement(){
		try {
			conn = getDataSource().getConnection();
			stmt = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e){
			e.printStackTrace();
		}
		return stmt;
	}	
	/*通用，根据数据源获取preparedstatement对象的方法*/
	/*例子：
		String sql = "delete from student where stuNo = ?";
		Object[] os = {stuNo};
	 */
	public static PreparedStatement createPreparedSatement(String sql,Object[] os){
		try {
			conn = getDataSource().getConnection();
			pstmt = conn.prepareStatement(sql);
			if(os != null){
				//os[i]代表sql语句中的多个 ? 占位符
				for(int i = 0; i < os.length; i++){
					pstmt.setObject(i+1, os[i]);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e){
			e.printStackTrace();
		}
		return pstmt;
	}
	
	/*通用，关闭访问数据库相关对象的方法*/
	public static void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn){
		try {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/*通用，增加、删除、修改方法*/
	public static boolean executeAddOrUpdateOrDelete(String sql, Object[] os){
		boolean flag = true; /*flag标记是否增加成功*/
		try {
			pstmt = createPreparedSatement(sql, os);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			flag = false;
		} finally{
			closeAll(null, pstmt, conn);
		}
		return  flag;
	}
	
	/*通用，查询方法，返回查询的结果集ResultSet对象*/
	public static ResultSet executeQuery(String sql, Object[] os){
		ResultSet rs = null;
		try {
			pstmt = createPreparedSatement(sql, os);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			System.out.println("SQLException:" + e);
		} catch(Exception e){
			System.out.println("查询发生异常：" + e);
		}
		return rs;
	}
}
