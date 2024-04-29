package kr.s40.jdbc.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.util.DBUtil;

public class BookDAO {
	//관리자 도서 등록
	public void insertBook(String bk_name,String bk_category) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "INSERT INTO sbook VALUES (sbook_seq.nextval,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bk_name);
			pstmt.setString(2, bk_category);
			
			int count = pstmt.executeUpdate();
			System.out.println(count+"권의 책 정보가 등록되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	//관리자 도서 목록 보기
	public void selectListBook() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM sbook ORDER BY bk_num DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			System.out.println("----------------------------------------");
			if(rs.next()) {
				System.out.println("번호\t도서명\t\t카테고리\t등록일");
				System.out.println("----------------------------------------");
				do {
					System.out.print(rs.getInt("bk_num"));
					System.out.print("\t");
					System.out.print(rs.getString("bk_name"));
					System.out.print("\t");
					System.out.print(rs.getString("bk_category"));
					System.out.print("\t");
					System.out.println(rs.getDate("bk_regdate"));
				}while(rs.next());
			}else {
				System.out.println("저장된 도서가 없습니다.");
			}
			System.out.println("----------------------------------------");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
	}
	
	//관리자 회원목록 보기
	public void selectListMember() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM member ORDER BY me_name DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println("----------------------------------------");
			if(rs.next()) {
				System.out.println("ID\t비밀번호\t이름\t전화번호\t등록일");
				System.out.println("----------------------------------------");
				do {
					System.out.print(rs.getString("me_ID"));
					System.out.print("\t");
					System.out.print(rs.getString("me_passwd"));
					System.out.print("\t");
					System.out.print(rs.getString("me_name"));
					System.out.print("\t");
					System.out.print(rs.getString("me_phone"));
					System.out.print("\t");
					System.out.println(rs.getDate("me_regdate"));
				}while(rs.next());
			}else {
				System.out.println("저장된 도서가 없습니다.");
			}
			System.out.println("----------------------------------------");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
	}
	//관리자 대출 목록 보기(대출 및 반납의 모든 데이터 표시)
	public void selectListReservation() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM reservation ORDER BY re_num DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println("----------------------------------------");
			if(rs.next()) {
				System.out.println("번호\t반납여부\t책번호\t아이디\t대출일\t\t반납일");
				System.out.println("----------------------------------------");
				do {
					System.out.print(rs.getInt("re_num"));
					System.out.print("\t");
					if(rs.getInt("re_status")==1) {
						System.out.print("x");
					}else {
						System.out.print("o");
					}
					System.out.print("\t");
					System.out.print(rs.getInt("bk_num"));
					System.out.print("\t");
					System.out.print(rs.getString("me_id"));
					System.out.print("\t");
					System.out.print(rs.getDate("re_regdate"));
					System.out.print("\t");
					System.out.println(rs.getDate("re_modifydate"));
				}while(rs.next());
			}else {
				System.out.println("대출한 도서가 없습니다.");
			}
			System.out.println("----------------------------------------");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
	}
	//사용자 아이디 중복 체크(count가 0이면 미중복, count가 1이면 중복)
	public int checkId(String me_id) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT*FROM member WHERE me_id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,me_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count=1;
			}
			
		}catch(Exception e) {
			count = 2;//오류발생
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}
	//사용자 회원 가입
	public void insertMember(String me_id,String me_passwd,String me_name,String me_phone) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn=DBUtil.getConnection();
			sql="INSERT INTO member VALUES(?,?,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, me_id);
			pstmt.setString(2, me_passwd);
			pstmt.setString(3, me_name);
			pstmt.setString(4, me_phone);
			
			pstmt.executeUpdate();
			
			System.out.println("계정 생성이 완료되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	//사용자 로그인  체크
	public boolean loginCheck(String me_id, String me_passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT me_id FROM member WHERE me_id = ? AND me_passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, me_id);
			pstmt.setString(2, me_passwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				flag = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return flag;
	}
	//도서 대출 여부 체크
	//사용자 도서 대출/ 여부 확인(도서번호(bk_num)로 검색해서 re_status의 값이 0이면 대출가능 1이면 불가능
	public int getStatusReservation(int bk_num) {
		int count = -1;
		//sbook, reservation 사용
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM reservation JOIN sbook USING(bk_num) WHERE bk_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bk_num);
			rs = pstmt.executeQuery();
			
	        if(rs.next()) { 
	        	int re_status = rs.getInt("re_status");
	        	do {
	        		if(re_status == 0) {
	        			System.out.println("대출 가능");
	        			count = 0; 
	        		} else {
	        			System.out.println("대출 불가능");
	        			count = 1; 
	        		}
	        		
	        	}while(rs.next());
	        }else {
	        	System.out.println("대출 가능");
    			count = 0; 
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return count;
	}
	//사용자 도서 대출 등록
	public void insertReservation(int bk_num, String me_id) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    String sql = null;
	    
	    try {
	        conn = DBUtil.getConnection();
	        sql = "INSERT INTO reservation (re_num, re_status, bk_num, me_id, re_regdate) "
	                + "VALUES (reservation_seq.nextval, ?, ?, ?, SYSDATE)";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, 1); 
	        pstmt.setInt(2, bk_num);
	        pstmt.setString(3, me_id);
	        int count = pstmt.executeUpdate();
	        System.out.println(count + "개의 대출정보가 업데이트 되었습니다.");
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        DBUtil.executeClose(null, pstmt, conn);
	    }
	}

	//사용자 MY대출 목록 보기(현재 대출한 목록만 표시)
	public void selectMyList(String me_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM reservation JOIN sbook USING(bk_num) WHERE me_id = ?,re_status = 0";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, me_id);
			rs = pstmt.executeQuery();
			System.out.println("----------------------------------------");
			if(rs.next()) {
				System.out.println("대출번호\t책번호\t책이름\t카테고리\t대출일");
				System.out.println("----------------------------------------");
				do {
					System.out.print(rs.getInt("re_num"));
					System.out.print("\t");
					System.out.print(rs.getInt("bk_num"));
					System.out.print("\t");
					System.out.print(rs.getString("bk_name"));
					System.out.print("\t");
					System.out.print(rs.getString("bk_category"));
					System.out.print("\t");
					System.out.println(rs.getDate("re_regdate"));
				}while(rs.next());
			}else {
				
			}
			System.out.println("----------------------------------------");
			
		} catch (Exception e) {
			System.out.println("대출한 도서가 없습니다.");
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
	}
	//사용자 반납 가능 여부(대출번호(re_num)와 회원아이디(me_id)를 함께 초회해서 re_status가 1인것은 반납가능 0이면 불가능)
	public int getStatusBack(int re_num,String me_id) {
		int count = -1;
		//reservation 사용 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT re_status FROM reservation WHERE me_id =? AND re_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, me_id);
			pstmt.setInt(2, re_num);
			rs = pstmt.executeQuery();
			
	        if(rs.next()) { 
	        	int re_status = rs.getInt("re_status");
	        	do {
	        		if(re_status == 1) {
	        			System.out.println("반납 가능");
	        			count = 0; 
	        		} else {
	        			System.out.println("반납 불가능");
	        			count = 1; 
	        		}
	        		
	        	}while(rs.next());
	        }else {
	        	System.out.println("반납 불가능");
    			count = 1; 
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return count;
	}
	//반납처리
	public void updateReservation(int re_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "UPDATE reservation SET re_status = 0,re_modifydate = SYSDATE WHERE re_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, re_num);
			int count = pstmt.executeUpdate();
			System.out.println(count + "개의 도서가 반납되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	//도서 정리 전대출 내역 확인
	public int beforeClearBoook(int bk_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = -1;
		try {
			conn= DBUtil.getConnection();
			sql = "SELECT * FROM reservation WHERE bk_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bk_num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if(rs.getInt("re_status")==1) {
					System.out.println("책이 대출 상태 입니다.");
					count=0;
				}
			}else {
				System.out.println("도서의 대출 내역이 없습니다.");
				count=1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}
	//도서 정리
	public void deleteSbook(int bk_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "DELETE FROM sbook WHERE bk_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bk_num);
			int count = pstmt.executeUpdate();
			System.out.println(count + "권의 도서를 정리했습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	//예약
	public void insertWaiting(int re_num,int bk_num,String me_id) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn= DBUtil.getConnection();
			sql = "INSERT INTO waiting VALUES(?,?,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, re_num);
			pstmt.setInt(2, bk_num);
			pstmt.setString(3, me_id);
			pstmt.setInt(4, 1);
			int count = pstmt.executeUpdate();
			System.out.println(count + "개의 예약 정보가 추가되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
}
