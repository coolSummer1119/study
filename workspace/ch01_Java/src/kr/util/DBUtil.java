package kr.util;

import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

public class DBUtil {
	private static final String DB_DRIVER = "oracle.jdbc.OracleDriver";//드래그 후 ctrl shift x(대문자) or y(소문자)
	private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";	
	private static final String DB_ID = "user01";
	private static final String DB_PASSWORD = "1234";
	
	//Connection 객체를 생성해서 반환
	public static Connection getConnection()throws ClassNotFoundException, SQLException {
		//1단계 드라이버 로드
		Class.forName(DB_DRIVER);
		//2단꼐 커넥션 객체 작성
		return DriverManager.getConnection(DB_URL,DB_ID,DB_PASSWORD);
	}
	//자원정리
	public static void executeClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		if(rs!=null)try {rs.close();}catch(SQLException e) {}
		if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {}
		if(conn!=null)try {conn.close();}catch(SQLException e) {}
	}
	public static void executeClose (CallableStatement cstmt,Connection conn) {
		if(cstmt!=null)try {cstmt.close();}catch(SQLException e) {}
		if(conn!=null)try {conn.close();}catch(SQLException e) {}
	}
}

