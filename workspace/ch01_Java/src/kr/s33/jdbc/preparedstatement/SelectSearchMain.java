package kr.s33.jdbc.preparedstatement;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.util.DBUtil;

public class SelectSearchMain {
	public static void main(String[] args) {
		BufferedReader br = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			br = new BufferedReader(new InputStreamReader(System.in));
			System.out.print("제목 검색어:");
			String keyword = br.readLine();
			
			System.out.println("-----------------");
			
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM test3 WHERE title LIKE '%' || ? || '%'";//가변문자 넣을떄는 이렇게 해야함.
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,keyword);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("번호\t작성자\t\t등록일\t제목");
				
				do{
					System.out.print(rs.getInt("num"));
					System.out.print("\t");
					System.out.print(rs.getString("name"));
					System.out.print("\t");
					System.out.print(rs.getDate("reg_date"));
					System.out.print("\t");
					System.out.println(rs.getString("title"));
				}while(rs.next());
			}else {
				System.out.println("검색된 데이터가 없습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
			if(br!=null)try{br.close();}catch(IOException e) {}
		}
		
	}
}
