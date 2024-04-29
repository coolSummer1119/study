package kr.s31.jdbc.statement;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;

public class InsertMain {
	public static void main(String[] args) {
		String db_driver = "oracle.jdbc.OracleDriver";//메모리에 올리고
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";	
		String db_id = "user01";
		String db_password = "1234";
		
		Connection conn = null;
		Statement stmt = null;
		String sql = null;
		
		try {
			//1단계 : 드라이버로드
			Class.forName(db_driver);
			//2단계 : 커넥션 객체 생성
			conn= DriverManager.getConnection(db_url,db_id,db_password);
			//sql문장 작성
			sql = "INSERT INTO test1(id,age) VALUES('she''e',50)";//작은따옴표를 두개 넣어야 하나 들어감
			//3단계 : statement 객체 생성
			stmt = conn.createStatement();//연결에 스테이트 먼트 생성
			//4단계 : sql을 실행해 하나의 행을 삽입/작업후 삽입한 행의 개수를 반환
			int count = stmt.executeUpdate(sql);
			
			System.out.println(count + "개의 행을 추가했습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			//자원정리
			if(stmt!=null)try {stmt.close();}catch (SQLException e2) {}
			if(conn!=null)try {conn.close();}catch (SQLException e2) {}
		}
	}
}
