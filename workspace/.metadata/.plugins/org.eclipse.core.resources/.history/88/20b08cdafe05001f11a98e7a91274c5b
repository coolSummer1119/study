package kr.member.vo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.member.vo.MemberVO;
import kr.util.DBUtil;

public class MemberDAO {
	/*
	싱글턴 패턴은 생성자를 private으로 지정해서 외부에서 호출할 수 없도록 처리하고 static
	메서드를 호출해서 객체가 한 번반 생성되고 생성된 객체를 공유할 수 있도록 처리하는 방식을 의미함
	*/
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	//싱글턴 패턴
	private MemberDAO() {
		
	}
	
	//회원가입
	public void insertMember(MemberVO member)throws Exception{
		Connection conn =null;
		PreparedStatement pstmt =null;
		String sql = null;
		try {
			//커넥션 풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			//sql문 작성
			sql = "INSERT INTO smember (num,id,name,passwd,email,phone) VALUES (smember_seq.nextval,?,?,?,?,?)";
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.excuteClose(null, pstmt, conn);
		}
	}
	//회원 상세 정보
	public MemberVO getMember(int num)throws Exception{
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs= null;
		MemberVO member=null;
		String sql =null;
 		
		
		
		
		return member;
	}
	//아이디 중복 체크, 로그인 체크
	public MemberVO checkMember(String id)throws Exception{
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs= null;
		MemberVO member=null;
		String sql =null;
		

	
		return member;
	}
	//회원정보 수정
	public void updateMember(MemberVO member)throws Exception{
		
	}
	
	//회원 탈퇴(회원 정보 삭제)
	public void deleteMember(int num)throws Exception{
		
	}
}
