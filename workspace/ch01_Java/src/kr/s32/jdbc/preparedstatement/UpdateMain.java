package kr.s32.jdbc.preparedstatement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import kr.util.DBUtil;

public class UpdateMain {
	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			//수행 1,2
			conn = DBUtil.getConnection();
			sql = "UPDATE test2 SET name = ? , age = ? WHERE id = ?";
			
			//수행 3
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "강호동");
			pstmt.setInt(2, 40);
			pstmt.setString(3,"Star");
			//수행 4 : sql문을 실행해서 테이블의 데이터 수정
			int count = pstmt.executeUpdate();//sql이 이미 전달이 되어 넣으면 에
			System.out.println(count + "개 행의 정보를 수정했습니다.");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			//자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
}
