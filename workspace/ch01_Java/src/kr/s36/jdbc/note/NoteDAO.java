package kr.s36.jdbc.note;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.util.DBUtil;

/*
 * DAO : Data Access Object / 데이터베이스의 데이터를 전문적으로 호출하고 제어하는 객체
 */

public class NoteDAO {
	//글쓰기
	public void insertInfo(String name,String passwd, String subject, String content, String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql=null;
		try {
			//1,2단계
			conn = DBUtil.getConnection();
			//sql문 작성
			sql = "INSERT INTO note VALUES (note_seq.nextval,?,?,?,?,?,SYSDATE)";
			//3단계 preparedstatement 객체생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setString(1, name);
			pstmt.setString(2, passwd);
			pstmt.setString(3, subject);
			pstmt.setString(4, content);
			pstmt.setString(5, email);
			
			//4단계 sql문을 실행하고 1건의 레코드를 생성
			int count = pstmt.executeUpdate();
			System.out.println(count+"개의 행을 삽입했습니다.");
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		
		
	}
	
	//목록 보기
	public void selectInfo() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			sql="SELECT * FROM note ORDER BY num DESC";
			pstmt = conn.prepareStatement(sql);
			//4 sql문을 실행서 테이블로부터 결과집합을 받고 ResultSet 에 담아서 반환
			rs = pstmt.executeQuery();
			
			System.out.println("------------------");
			if(rs.next()) {
				System.out.println("번호\t이름\t작성일\t\t제목");
				do {
					System.out.print(rs.getInt("num"));
					System.out.print("\t");
					System.out.print(rs.getString("name"));
					System.out.print("\t");
					System.out.print(rs.getString("passwd"));
					System.out.print("\t");
					System.out.println(rs.getString("subject"));
					
				}while(rs.next());
			}else {
				System.out.println("표시할 데이터가 없습니다.");
			}
			System.out.println("------------------");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
	}
	
	//상세 글 보기
	public void selectDetailInfo(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			sql="SELECT*FROM note WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("글번호 : "+rs.getInt("num"));
				System.out.println("이름 : "+rs.getString("name"));
				System.out.println("비밀번호 : "+rs.getString("passwd"));
				System.out.println("제목 : "+rs.getString("subject"));
				System.out.println("내용 : "+rs.getString("content"));
				
				String email = rs.getString("email");
				if(email==null) {
					email = "";
				}
				System.out.println("이메일 : " + email);
				System.out.println("작성일 : " + rs.getDate("reg_date"));
			}else {
				System.out.println("표시할 데이터가 없습니다.");
			}
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
	}
	
	//글수정
	public void updateInfo(int num,String name,String passwd,String subject,String content,String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "UPDATE note set name=?,passwd=?,subject=?,content=?,email=? WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name );
			pstmt.setString(2,passwd );
			pstmt.setString(3,subject );
			pstmt.setString(4,content );
			pstmt.setString(5,email );
			pstmt.setInt(6,num);
			
			int count = pstmt.executeUpdate();
			System.out.println(count + "개의 행을 수정했습니다.");
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//글삭제
	public void deleteInfo(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			sql = "DELETE FROM note WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			int count = pstmt.executeUpdate();
			System.out.println(count + "개의 행이 삭제되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
}
