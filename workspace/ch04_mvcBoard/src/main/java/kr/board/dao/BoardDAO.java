package kr.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.board.vo.BoardVO;
import kr.util.DBUtil;

public class BoardDAO {
	//싱글턴 패턴
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private BoardDAO() {};
	
	//글저장
	public void insert(BoardVO boardVO)throws Exception{
		Connection conn=null;
		PreparedStatement pstmt = null;
		String sql= null;
		try {
			//커넥션풀 
			conn = DBUtil.getConnection();
			//sql문 작성
			sql = "INSERT INTO svboard (num,title,name,passwd,email,content,ip) VALUES(svboard_seq.nextval,?,?,?,?,?,?)";
			//pstmt객체 생성
			pstmt = conn.prepareStatement(sql);
			//데이터 바인딩
			pstmt.setString(1, boardVO.getTitle());
			pstmt.setString(2, boardVO.getName());
			pstmt.setString(3, boardVO.getPasswd());
			pstmt.setString(4, boardVO.getEmail());
			pstmt.setString(5, boardVO.getContent());
			pstmt.setString(6, boardVO.getIp());
			//sql문실행
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(null, pstmt, conn);
		}
	}
	
	//글의 총 개수
	public int getCount()throws Exception{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql=null;
		int count=0;
		
		try {
			//커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//sql문 작성
			sql="SELECT COUNT(*) FROM svboard";
			//pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			//sql문 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//				컬럼인덱스
				count = rs.getInt(1);
			}
			
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(rs, pstmt, conn);
		}
		
		
		return count;
	}
	
	//글 목록
	public List<BoardVO> getList(int startRow,int endRow)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardVO> list = null;
		String sql = null;
		
		try {
			//커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//sql문 작성
			sql="SELECT * FROM (SELECT a.*, rownum rnum FROM (SELECT *FROM svboard ORDER BY num DESC)a)"
					+ " WHERE rnum >= ? AND rnum <= ?";
			//pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			//sql문 실행
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			list = new ArrayList<BoardVO>();
			while(rs.next()) {
				BoardVO boardVO = new BoardVO();
				boardVO.setNum(rs.getInt("num"));
				boardVO.setTitle(rs.getString("title"));
				boardVO.setName(rs.getString("name"));
				boardVO.setReg_date(rs.getDate("reg_date"));
				//자바빈을 ArrayList에 저장
				list.add(boardVO);
				
			}
			
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//글 상세
	public BoardVO getBoard(int num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO board = null;
		String sql = null;
		
		
		return board;
	}
	
	//글 수정
	public void update(BoardVO boardVO)throws Exception{
		
	}
	
	//글 삭제
	public void delete(int num)throws Exception{
		
	}
}