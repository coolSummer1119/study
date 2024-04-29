package kr.s32.jdbc.preparedstatement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import kr.util.DBUtil;

public class DeleteMain {
	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "DELETE FROM test2 WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "Star");
			int count = pstmt.executeUpdate();
			System.out.println(count + "개의 행이 삭제되었습니다.");
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			//자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
}
