package kr.board.vo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.util.DBUtil;

public class BoardDAO {
	//싱글턴 패턴
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	private BoardDAO() {
		
	}
	//글저장
	public void insert(BoardVO boardVO)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt =null;
		String sql = null;
		try {
			//connection풀
			conn=DBUtil.getConnection();
			//sql문 작성
			sql="INSERT INTO mboard (num,title,name,passwd,content,ip) VALUES (mboard_seq.nextval,?,?,?,?,?)";
			//pstmt객체 생성
			pstmt=conn.prepareStatement(sql);
			//데이터 바인딩
			pstmt.setString(1, boardVO.getTitle());
			pstmt.setString(2, boardVO.getName());
			pstmt.setString(3, boardVO.getPasswd());
			pstmt.setString(4, boardVO.getContent());
			pstmt.setString(5, boardVO.getIp());
			//sql문 실행
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.excuteClose(null, pstmt, conn);
		}
	}
	
	//글의 총 개수
	public int getCount()throws Exception{
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		String sql = null;
		int count =0;
		try {
			//커넥션풀로부터 커넥션을 할당
			conn=DBUtil.getConnection();
			//SQL문 작성
			//        컬럼인덱스 1
			sql="SELECT COUNT(*) FROM mboard";
			
			//pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			//SQL문 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);//컬럼 인덱스 1
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(rs, pstmt, conn);
		}
		return count;
	}
	
	//글목록
	public List<BoardVO> getList(int startRow,int endRow)throws Exception{
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		List<BoardVO> list = null;
		String sql = null;
		
		try {
			conn=DBUtil.getConnection();
			sql="SELECT * FROM (SELECT a.*, rownum rnum FROM "
					+ "(SELECT * FROM mboard ORDER BY num DESC)a) WHERE rnum>=? AND rnum<=?";
			pstmt=conn.prepareStatement(sql);
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
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		BoardVO board = null;
		String sql = null;
		try {
			conn=DBUtil.getConnection();
			sql="SELECT * FROM mboard WHERE num=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board = new BoardVO();
				board.setNum(rs.getInt("num"));
				board.setTitle(rs.getString("title"));
				board.setName(rs.getString("name"));
				board.setPasswd(rs.getString("passwd"));
				board.setContent(rs.getString("content"));
				board.setIp(rs.getString("ip"));
				board.setReg_date(rs.getDate("reg_date"));
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(rs, pstmt, conn);
		}
		return board;
	}
	
	//글 수정
	public void update(BoardVO boardVO)throws Exception{
		Connection conn= null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			//커넥션 풀로부터 커넥션 할당
			conn=DBUtil.getConnection();
			//sql문 작성
			sql="UPDATE mboard SET title=?,name=?,content=?,ip=? WHERE num=?";
			//pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			//데이터 바인딩
			pstmt.setString(1,boardVO.getTitle());
			pstmt.setString(2,boardVO.getName());
			pstmt.setString(3,boardVO.getContent());
			pstmt.setString(4,boardVO.getIp());
			pstmt.setInt(5,boardVO.getNum());
			//sql문 실행
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(null, pstmt, conn);
		}
	}
	//글삭제 
	public void delete(int num)throws Exception{
		Connection conn= null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			//커넥션 풀로부터 커넥션 할당
			conn=DBUtil.getConnection();
			//sql문 작성
			sql="DELETE FROM mboard WHERE num=?";
			//pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			//데이터 바인딩
			pstmt.setInt(1,num);
			//sql문 실행
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(null, pstmt, conn);
		}
	}
}