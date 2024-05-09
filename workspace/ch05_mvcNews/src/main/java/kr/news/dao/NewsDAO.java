package kr.news.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.news.vo.NewsVO;
import kr.util.DBUtil; 

public class NewsDAO {
	//싱글턴 패턴
	private static NewsDAO instance = new NewsDAO();
	
	public static NewsDAO getInstance() {
		return instance;
	}
	private NewsDAO() {}
	
	//뉴스 등록
	public void registerNews(NewsVO vo)throws Exception{
		Connection conn= null;
		PreparedStatement pstmt=null;
		String sql =null;
		
		try {
			//커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//sql문 작성
			sql = "INSERT INTO dailynews (num,title,writer,passwd,email,article,filename) VALUES (dailynews_seq.nextval,"
					+ "?,?,?,?,?,?)";
			//pstmt객체 생성
			pstmt = conn.prepareStatement(sql);
			//데이터 바인딩
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getPasswd());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getArticle());
			pstmt.setString(6, vo.getFilename());
			//sql실행
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(null, pstmt, conn);
		}
		
	}
	
	//뉴스 총 개수
	public int getCount()throws Exception{
		Connection conn= null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql =null;
		int count = 0;
		try {
			//커넥션풀로부터 커넥션 할당
			conn=DBUtil.getConnection();
			//sql문 작성
			sql ="SELECT COUNT(*) FROM sboard";
			//pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			//sql문 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(rs, pstmt, conn);
		}
		
		
		return count;
	}
	
	//목록
	public List<NewsVO> getList(int startRow,int endRow) throws Exception{
		Connection conn= null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		List<NewsVO> list = null;
		String sql =null;
		
		try {
			//커넥션 풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//sql문 작성
			sql="SELECT * FROM (SELECT a.*, rownum rnum FROM (SELECT *FROM dailynews ORDER BY num DESC)a)"
					+ " WHERE rnum >= ? AND rnum <= ?";
			//pstmt 객체 생성
			pstmt = conn.prepareStatement(sql);
			//sql문 실행
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			list = new ArrayList<NewsVO>();
			while(rs.next()) {
				NewsVO NewsVO = new NewsVO();
				NewsVO.setNum(rs.getInt("num"));
				NewsVO.setTitle(rs.getString("title"));
				NewsVO.setWriter(rs.getString("writer"));
				NewsVO.setReg_date(rs.getDate("reg_date"));
				//자바빈을 ArrayList에 저장
				list.add(NewsVO);
				
			}
			
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(rs, pstmt, conn);
		}
		
		
		return list;
	}
	
	//뉴스 상세 정보
	public NewsVO getNews(int num)throws Exception{
		Connection conn= null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		NewsVO vo =null;
		String sql =null;
		
		try {
			//커넥션풀에서 커넥션 할당
			conn = DBUtil.getConnection();
			//sql문 작성
			sql="SELECT * FROM dailynews WHERE num=?";
			//pstmt문 객체 생성
			pstmt = conn.prepareStatement(sql);
			//데이터 바인딩
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new NewsVO();
				vo.setNum(rs.getInt("num"));
				vo.setTitle(rs.getString("title"));
				vo.setWriter(rs.getString("writer"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setEmail(rs.getString("email"));
				vo.setArticle(rs.getString("article"));
				vo.setFilename(rs.getString("filename"));
				vo.setReg_date(rs.getDate("reg_date"));
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(rs, pstmt, conn);
		}
		
		
		return vo;
	}
		
	//뉴스 수정
	public void updateNews(NewsVO vo)throws Exception{
		
	}
	
	//뉴스 삭제
	public void deleteNews(int num)throws Exception{
		
	}
	
		
}