package kr.employee.vo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.util.DBUtil;

public class EmployeeDAO {
	//싱글턴 패턴
	private static EmployeeDAO instance = new EmployeeDAO();
	
	public static EmployeeDAO getInstance() {
		return instance;
	}
	private  EmployeeDAO() {
		
	}
	//사원등록
	public void insertEmployee(EmployeeVO employee)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			sql = "INSERT INTO semployee (num,id,name,passwd,salary,job,reg_date) VALUES (semployee_seq.nextval,?,?,?,?,?,SYSDATE)";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, employee.getId());
			pstmt.setString(2, employee.getName());
			pstmt.setString(3, employee.getPasswd());
			pstmt.setInt(4, employee.getSalary());
			pstmt.setString(5, employee.getJob());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(null, pstmt, conn);
		}
	}
	
	//사원 상세정보
	public EmployeeVO getEmployee(int num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmployeeVO vo = null;
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM semployee WHERE num =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				vo = new EmployeeVO();
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setJob(rs.getString("job"));
				vo.setId(rs.getString("id"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setSalary(rs.getInt("salary"));
				vo.setReg_date(rs.getDate("reg_date"));
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(rs, pstmt, conn);
		}
		return vo;
	}
	
	//아이디 중복 체크, 로그인 체크
	public EmployeeVO checkEmployee(String id) throws Exception{
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EmployeeVO vo = null;
		String sql = null;
		try {
			conn=DBUtil.getConnection();
			sql = "SELECT * FROM semployee WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo =new EmployeeVO();
				vo.setId(rs.getString("id"));
				vo.setNum(rs.getInt("num"));
				vo.setPasswd(rs.getString("passwd"));
			}
			
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.excuteClose(rs, pstmt, conn);
		}
		
		return vo;
	}
	
	//사원정보 수정
	public void updateEmployee(EmployeeVO vo)throws Exception{
		
	}
	//사원정보 삭제
	public void deleteEmployee(int num)throws Exception{
		
	}
	
}
