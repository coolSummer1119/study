package kr.story.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.story.vo.StoryVO;
import kr.util.DBUtil;

public class StoryDAO {
	//싱글턴 패턴
	private static StoryDAO instance = new StoryDAO();
	
	public static StoryDAO getInstance() {
		return instance;
	}
	private StoryDAO() {};
	//글 저장
	public void insert(StoryVO vo)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs= null;
		String sql = null;
		try {
			conn= DBUtil.getConnection();
			sql = "INSERT INTO story (snum,title,content,ip,num) VALUES "
					+ "(story_seq.nextval,?,?,?,?)";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getIp());
			pstmt.setInt(4, vo.getNum());
			//sql문 실행
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(rs, pstmt, conn);
		}
	}
	//글의 총 개수
	public int getCount() throws Exception{
		Connection conn=null;
		PreparedStatement pstmt =null;
		ResultSet rs= null;
		String sql = null;
		int count = 0;
		try {
			conn= DBUtil.getConnection();
			sql = "SELECT COUNT(*) FROM story";
			pstmt =conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);//Story 갯수
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(rs, pstmt, conn);
		}
		
		
		return count;
	}
	//글 목록
	public List<StoryVO> getList(int startRow, int endRow)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		List<StoryVO> list = null;
		String sql=null;
		try {
			conn=DBUtil.getConnection();
			sql="SELECT * FROM (SELECT a.*, rownum rnum FROM "
					+ "(SELECT * FROM story JOIN semployee USING(num) ORDER BY num DESC)a) WHERE rnum>=? AND rnum<=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			list = new ArrayList<StoryVO>();
			while(rs.next()) {
				StoryVO storyVO = new StoryVO();
				storyVO.setSnum(rs.getInt("snum"));
				storyVO.setTitle(rs.getString("title"));
				storyVO.setId(rs.getString("id"));
				storyVO.setReg_date(rs.getDate("reg_date"));
				//자바빈을 ArrayList에 저장
				list.add(storyVO);
			
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(rs, pstmt, conn);
		}
		
		return list;
	}
	//글 상세
	public StoryVO getStory(int snum) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		StoryVO vo = null;
		String sql = null;
		try {
			conn= DBUtil.getConnection();
			sql = "SELECT * FROM story JOIN semployee USING(num) WHERE snum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, snum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new StoryVO();
				vo.setSnum(rs.getInt("snum"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setIp(rs.getString("ip"));
				vo.setNum(rs.getInt("num"));
				vo.setReg_date(rs.getDate("reg_date"));
				vo.setId(rs.getString("id"));
			}	
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(rs, pstmt, conn);
		}
		return vo;
	}
	
	//글 수정
	public void update(StoryVO vo) throws Exception{
		Connection conn=null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn= DBUtil.getConnection();
			sql = "UPDATE story SET title=?,content=? WHERE snum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getSnum());
			
			pstmt.executeQuery();
			
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(null, pstmt, conn);
		}
		
	}
	//글 삭제
	public void delete(int snum)throws Exception{
		Connection conn=null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn= DBUtil.getConnection();
			sql = "DELETE FROM story WHERE snum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, snum);
			
			pstmt.executeQuery();
			
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(null, pstmt, conn);
		}
		
		
	}
	
}
