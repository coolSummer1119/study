package kr.s38.jdbc.score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.util.DBUtil;

public class ScoreDAO {
	//성적입력
	public void insertScore(String name,int korean, int english, int math, int sum, int avg, String grade) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		String sql =null;
		

		try {
			conn= DBUtil.getConnection();
			sql = "INSERT INTO score VALUES (score_seq.nextval,?,?,?,?,?,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, korean);
			pstmt.setInt(3, english);
			pstmt.setInt(4, math);
			pstmt.setInt(5, sum);
			pstmt.setInt(6, avg);
			pstmt.setString(7, grade);
			
			int count = pstmt.executeUpdate();
			System.out.println(count+"개의 성적 정보가 추가되었습니다.");
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//목록 보기
	public void selectScore() {
		//번호,이름,총점,평균,등급
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql =null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM score ORDER BY num DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			System.out.println("-----------------");
			System.out.println("번호\t이름\t총점\t평균\t등급");
			
			if(rs.next()) {
				
				do {
					System.out.print(rs.getString("num"));
					System.out.print("\t");				
					System.out.print(rs.getString("name"));
					System.out.print("\t");				
					System.out.print(rs.getInt("sum"));
					System.out.print("\t");				
					System.out.print(rs.getInt("avg"));
					System.out.print("\t");				
					System.out.println(rs.getString("grade"));
					
				}while(rs.next());
				System.out.println("-----------------");
			}else {
				System.out.println("불러올 데이터가 없습니다");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
	}
	
	//성적 상세 정보 보기
	public void selectDetailScore (int num) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			conn =DBUtil.getConnection();
			sql = "SELECT * FROM score WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("이름 : " + rs.getString("name"));
				System.out.println("국어 : " + rs.getInt("korean"));
				System.out.println("수학 : " + rs.getInt("english"));
				System.out.println("영어 : " + rs.getInt("math"));
				System.out.println("총합 : " + rs.getInt("sum"));
				System.out.println("평균 : " + rs.getInt("avg"));
				System.out.println("등급 : " + rs.getString("grade"));
			}else {
				System.out.println("표시할 데이터가 없습니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
	}
	
	//성적 수정
	public void updateScore(int num,String name,int korean, int english, int math, int sum, int avg, String grade) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql= "UPDATE score SET name=?,korean=?,english=?,math=?,sum=?,avg=?,grade=? WHERE num =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, korean);
			pstmt.setInt(3, english);
			pstmt.setInt(4, math);
			pstmt.setInt(5, sum);
			pstmt.setInt(6, avg);
			pstmt.setString(7, grade);
			pstmt.setInt(8, num);
			
			int count = pstmt.executeUpdate();
			System.out.println(count+"개의 성적 정보가 수정되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//성적 삭제
	public void deleteScore(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			sql = "DELETE FROM note WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			int count = pstmt.executeUpdate();
			System.out.println(count + "개의 성적정보가 삭제되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
}
