package kr.s37.jdbc.car;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.util.DBUtil;

public class CarDAO {
	//자동차 정보 등록
	public void insertCar(String name,String cnumber,String color,String maker,int price) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			
			sql = "INSERT INTO car VALUES (car_seq.nextval,?,?,?,?,?,SYSDATE)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, cnumber);
			pstmt.setString(3, color);
			pstmt.setString(4, maker);
			pstmt.setInt(5, price);
			
			int count = pstmt.executeUpdate();
			System.out.println(count+"개의 행이 삽입되었습니다.");
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//목록 보기
	public void selectCar() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = null;
		
		try {
			conn=DBUtil.getConnection();
			sql = "SELECT * FROM car ORDER BY num DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				System.out.println("번호\t자동차명\t제조사\t가격\t등록날짜");
				do {
					System.out.print(rs.getInt("num"));
					System.out.print("\t");
					System.out.print(rs.getString("name"));
					System.out.print("\t");
					System.out.print(rs.getString("maker"));
					System.out.print("\t");
					System.out.print(rs.getInt("price"));
					System.out.print("\t");
					System.out.println(rs.getDate("reg_date"));
				}while(rs.next());
			}else {
				System.out.println("표시할 데이터가 없습니다.");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
	}
	
	//자동차 상세보기
	public void selectDetailCar(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM car WHERE num = ?";
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {				
				System.out.println("번호\t자동차명\t차량번호\t색상\t제조사\t가격\t등록날짜");
				System.out.print(rs.getInt("num"));
				System.out.print("\t");
				System.out.print(rs.getString("name"));
				System.out.print("\t");
				System.out.print(rs.getString("cnumber"));
				System.out.print("\t");
				System.out.print(rs.getString("color"));
				System.out.print("\t");
				System.out.print(rs.getString("maker"));
				System.out.print("\t");
				System.out.print(rs.getInt("price"));
				System.out.print("\t");
				System.out.println(rs.getDate("reg_date"));
			}else {
				System.out.println("표시할 데이터가 없습니다.");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
	}
	
	//자동차 정보 수정
	public void updateCar(int num, String name, String cnumber,String color,String maker, int price) {
		Connection conn  = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn=DBUtil.getConnection();
			sql = "UPDATE car SET name = ?, cnumber = ?, color = ?, maker = ?, price = ? WHERE num = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, cnumber);
			pstmt.setString(3, color);
			pstmt.setString(4, maker);
			pstmt.setInt(5, price);
			pstmt.setInt(6, num);
			
			int count = pstmt.executeUpdate();
			System.out.println(count + "개의 행이 업데이트 되었습니다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//자동차 정보 삭제
	public void deleteCar(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			sql = "DELETE FROM car WHERE num = ?";
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
