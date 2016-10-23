package myproject.db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionPoolMgr {
	/*private DataSource ds;
	
	public ConnectionPoolMgr() {
		try{
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracledb");
			System.out.println("dbcp -DataSource 생성됨~!~!");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws SQLException{
		return ds.getConnection();
	}*/
	
	
	public ConnectionPoolMgr() {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 로딩 성공~!~!");
			
		} catch(ClassNotFoundException e){
			System.out.println("드라이버 로딩 실패~~");
			e.printStackTrace();
		}
	}
	
	public Connection getConnection(){
		String url = "jdbc:oracle:thin:@DESKTOP-BFS410D:1521:xe";
		String uid = "taekung" , pwd = "taekung";
		Connection conn = null;
		try {
			 conn = DriverManager.getConnection(url,uid,pwd);
			System.out.println("db연결 성공~~");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("db연결 실패~~");
		}
		return conn;
	} 
	
	
	
	
	public void dbClose(ResultSet rs, PreparedStatement ps, Connection conn){
		
			try {
				if (rs!=null) rs.close();
				if (ps!=null) ps.close();
				if (conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}
	public void dbClose(ResultSet rs, CallableStatement cs, Connection conn){
		
		try {
			if (rs!=null) rs.close();
			if (cs!=null) cs.close();
			if (conn!=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
}
}
