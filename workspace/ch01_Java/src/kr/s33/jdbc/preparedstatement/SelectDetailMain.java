package kr.s33.jdbc.preparedstatement;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.util.DBUtil;

public class SelectDetailMain {
	public static void main(String[] args) {
		BufferedReader br = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
				
		try {
			br = new BufferedReader(new InputStreamReader(System.in));
			System.out.print("번호:");
			int num = Integer.parseInt(br.readLine());
			
			System.out.println("--------------------------");
			
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM test3 WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			//4: sql문을 테이블에 반영하고 결과집합을 rs에 담아서 반환
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("번호 : " + rs.getInt("num"));
				System.out.println("제목 : " + rs.getString("title"));
				System.out.println("작성자 : " + rs.getString("name"));
				System.out.println("내용 : " + rs.getString("memo"));
				
				String email = rs.getString("email");
				if(email == null)email="";
				
				System.out.println("이메일 : " + email);
				System.out.println("등록일 : " + rs.getDate("reg_date"));
			}else {
				System.out.println("검색된 데이터가 없습니다.");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
			if(br!=null)try {br.close();}catch (IOException e2) {}
		}
	}
	
}
