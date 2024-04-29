package kr.s32.jdbc.preparedstatement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import kr.util.DBUtil;

public class InsertMain {
	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			//수행 1,2단계
			conn = DBUtil.getConnection();
			//sql문 작성				   1   2   3      4      		1 2 3    4
			sql = "INSERT INTO test2 (id,name,age,reg_date) VALUES (?,?,?,SYSDATE)";
			//PreparedStatement는 데이터를 바로 넣지 않고 물음표를 넣어 자리값만 잡음.
			//수행 3단계
			pstmt = conn.prepareStatement(sql);//메서드 명은 동사형
			//?에 데이터를 바인딩
			pstmt.setString(1, "Cool'43");//1번 ?에 데이터 전달, 문자열이어서 작은 따옴표가 그냥 들어가게됨
			pstmt.setString(2, "박문치");//2번 ?에 데이터 전달
			pstmt.setInt(3, 26);//3번 ?에 데이터 전달
			
			//수행 4단계 : sql문을 실행해서 테이블에 행을 추가
			int count = pstmt.executeUpdate();//이미 전달이 되어있기 떄문에 여기에 sql넣으면 오류
			System.out.println(count + "개의 행이 추가되었습니다.");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			//자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
}
