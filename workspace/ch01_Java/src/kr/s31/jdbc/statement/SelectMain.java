package kr.s31.jdbc.statement;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;//결과집합
import java.sql.Statement;

public class SelectMain {
	public static void main(String[] args) {
		String db_driver = "oracle.jdbc.OracleDriver";//메모리에 올리고
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";	
		String db_id = "user01";
		String db_password = "1234";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs  = null;
		String sql = null;
		
		try {
			//1단계 : 드라이버 로드
			Class.forName(db_driver);
			//2단계 : 커넥션 객체 생성
			conn = DriverManager.getConnection(db_url,db_id,db_password);
			//sql 문장 작성
			sql = "SELECT * FROM test1";
			//3단게 : STATEMENT 객체 생성
			stmt = conn.createStatement();
			//4단계 : sql 실행후 테이블로 부터 레코드(행)을 전달받아서 결과집합을 만들고 resultset객체에 담아서 반환
			rs = stmt.executeQuery(sql);
			
			System.out.println("ID\t나이");
			//resultset에 보관된 결과집합에 접근해서 행단위로 데이터를 추출
			while(rs.next()) {
				//컬럼명을 통해서 데이터를 반환
//				System.out.print(rs.getString("id"));
//				System.out.print("\t");
//				System.out.println("age");
				//컬럼 인덱스를 통해서 데이터를 반환
				System.out.print(rs.getString(1));
				System.out.print("\t");
				System.out.println(rs.getInt(2));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if (rs!=null)try {rs.close();}catch(SQLException e) {}
			if (stmt!=null)try {stmt.close();}catch(SQLException e) {}
			if (conn!=null)try {conn.close();}catch(SQLException e) {}
		}
	}
}
