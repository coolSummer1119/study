package kr.s31.jdbc.statement;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager; 
/*
 * CRUD 작업
 * C Create (생성) ->INSERT문
 * R Read (읽기) -> SELECT문
 * U Update (갱신) -> UPDATE문
 * D Delete (삭제) -> DELETE문
 */
public class DeleteMain {
	public static void main(String[] args) {
		String db_driver = "oracle.jdbc.OracleDriver";//메모리에 올리고
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";	
		String db_id = "user01";
		String db_password = "1234";

		Connection conn = null;
		Statement stmt = null;
		String sql = null;


		try {
			//JDBC 수행 1단계 : 드라이버로드
			Class.forName(db_driver);
			//JDBC 수행 2단계 : Connection 객체 생성 (오라클에 접속하기 위한 인증)
			conn = DriverManager.getConnection(db_url,db_id,db_password);
			//SQL문 작성
			sql="DELETE FROM test1 WHERE id='SKY'";
			//JDBC 수행 3단계 : Statement 객체 생성
			stmt = conn.createStatement();

			//JDBC 수행 4단계 : SQL문을 사용해서 테이블을 삭제
			stmt.executeUpdate(sql);
			int count = stmt.executeUpdate(sql);
			
			System.out.println(count + "개의 행을 삭제했습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			//자원정리
			if(stmt!=null)try {stmt.close();}catch(SQLException e) {}
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
	}
}
