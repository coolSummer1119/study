package kr.s30.jdbc;

public class DriverMain {
	public static void main(String[] args) {
		try {
			Class.forName("oracle.jdbc.OracleDriver");//메모리에 올리는 명령문
			System.out.println("오라클 드라이버가 정상적으로 로드되었습니다.");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
