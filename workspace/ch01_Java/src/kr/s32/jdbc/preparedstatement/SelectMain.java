package kr.s32.jdbc.preparedstatement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import kr.util.DBUtil;

public class SelectMain {
	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			//수행 1,2
			conn = DBUtil.getConnection();
			//sql문 작성
			sql = "SELECT * FROM test2 ORDER BY reg_date DESC";
			//수행 3
			pstmt = conn.prepareStatement(sql);
			//수행 4 : sql문을 실행해서 테이블에 반영하고 결과 집합을 resultset에 담아서 반환
			rs = pstmt.executeQuery();//이미sql이 올라가 있기때문에 넣을 필요x
			System.out.println("ID\t이름\t나이\t등록일");
			while(rs.next()) {
				System.out.print(rs.getString("id"));
				System.out.print("\t");
				System.out.print(rs.getString("name")); 
				System.out.print("\t");
				System.out.print(rs.getInt("age"));
				System.out.print("\t");
				System.out.println(rs.getDate("reg_date"));//getDate는 연월일 getString은 시분초 포함
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
	}
}
