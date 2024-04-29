package kr.s35.jdbc.transaction;

import java.sql.Connection;
import java.sql.PreparedStatement;


import kr.util.DBUtil;

public class WrongTransaction {
	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		String sql = null;
		try {
			//기본 트랜잭션 처리가 오토 커밋으로 설정되어있기 떄문에 복수의 SQL문을 실행할경우 정상적으로 트랜잭션 처리가 되지 않을 수 있다,
			conn = DBUtil.getConnection();
			sql = "INSERT INTO test1 VALUES ('SMITH',10)";
			pstmt1 = conn.prepareStatement(sql);
			pstmt1.executeUpdate();

			sql = "INSERT INTO test1 VALUES ('PETER',20)";
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.executeUpdate();
			
			//테스트용으로 잘못된 SQL작성
			sql = "INSERT INTO test1 VALUES ('JOHN',30";
			pstmt3 = conn.prepareStatement(sql);
			pstmt3.executeUpdate();
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(null, pstmt3, null);
			DBUtil.executeClose(null, pstmt2, null);
			DBUtil.executeClose(null, pstmt1, conn);
		}
	}
}