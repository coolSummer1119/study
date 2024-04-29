package kr.s35.jdbc.transaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kr.util.DBUtil;

public class RightTransaction {
	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		String sql = null;
		try {
			//복수의 sql문을 실행할 경우 오토커밋을 해제하고 수작업으로 트랜잭션 처리함
			conn = DBUtil.getConnection();
			//오토커밋 해제
			conn.setAutoCommit(false);
			
			sql = "INSERT INTO test1 VALUES ('ANNIE',10)";
			pstmt1 = conn.prepareStatement(sql);
			pstmt1.executeUpdate();

			sql = "INSERT INTO test1 VALUES ('MARIA',20)";
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.executeUpdate();
			
			//테스트용으로 잘못된 SQL작성
			sql = "INSERT INTO test1 VALUES ('SUZAN',30";
			pstmt3 = conn.prepareStatement(sql);
			pstmt3.executeUpdate();
			//정상적으로 작업이 완료되면 commit
			conn.commit();
			
			System.out.println("작업완료");
			
		}catch (Exception e) {
			e.printStackTrace();
			//예외가 발생했을 경우
			try {
				conn.rollback();
			} catch (SQLException e2) {//위에 인자가e기 때문에 같으면 안됨.
				e2.printStackTrace();
			}
		}finally {
			DBUtil.executeClose(null, pstmt3, null);
			DBUtil.executeClose(null, pstmt2, null);
			DBUtil.executeClose(null, pstmt1, conn);
		}
	}
}
