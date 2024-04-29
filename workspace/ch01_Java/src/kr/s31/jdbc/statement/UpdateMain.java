package kr.s31.jdbc.statement;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;


public class UpdateMain {
	public static void main(String[] args) {
		String db_driver = "oracle.jdbc.OracleDriver";//메모리에 올리고
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";	
		String db_id = "user01";
		String db_password = "1234";
		
		Connection conn = null;
		Statement stmt = null;
		String sql = null;
		
	
		try {
			Class.forName(db_driver);
			conn = DriverManager.getConnection(db_url,db_id,db_password);
			sql = "UPDATE test1 SET age=90 WHERE id='KOREA'";//없다면 행 변경 x / where절을 안쓰면 모두 변경
			stmt = conn.createStatement();
			int count = stmt.executeUpdate(sql);//sql문을 실행해서 테이블의 행을 수정하고 수정한 행의 개수를 반환
			System.out.println(count + "개의 행의 정보를 수정했습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(stmt!=null)try {stmt.close();}catch(SQLException e) {}
			if(conn!=null)try {conn.close();}catch(SQLException e) {}
		}
	}
}
