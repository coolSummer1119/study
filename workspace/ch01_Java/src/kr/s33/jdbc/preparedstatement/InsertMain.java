package kr.s33.jdbc.preparedstatement;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

import kr.util.DBUtil;

public class InsertMain {
	public static void main(String[] args) {
		BufferedReader br = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			br = new BufferedReader(new InputStreamReader(System.in));
			System.out.print("제목: ");
			String title = br.readLine();
			System.out.print("이름: ");
			String name = br.readLine();
			System.out.print("메모: ");
			String memo = br.readLine();
			System.out.print("이메일: ");
			String email = br.readLine();
			
			//수행 1,2단계
			conn = DBUtil.getConnection();
			sql = "INSERT INTO test3 (num,title,name,memo,email,reg_date)"
					+ "VALUES(test3_seq.nextval,?,?,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,title);
			pstmt.setString(2,name);
			pstmt.setString(3,memo);
			pstmt.setString(4,email);
			
			int count = pstmt.executeUpdate();
			System.out.println(count + "개의 행이 추가 되었습니다.");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
			if(br!=null)try {br.close();}catch(IOException e) {}
		}
	}
}
