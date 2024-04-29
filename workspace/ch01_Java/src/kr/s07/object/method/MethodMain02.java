package kr.s07.object.method;

public class MethodMain02 {
	/*
	 * [실습]
	 * 입력한 int형 정수값이 음수이면 -1을, 0이면 0을, 양수면 1을 반환하는 signOf 메소드 작성
	 */
	public int signOf(int n) {
		//int n = 0; 이렇게 기본값을 선언함으로서 0일경우는 if문에 쓰지 않고 코드 절약
		if (n > 0) {
			n = 1;
		}else if (n == 0) {
			n = 0;
		}else {
			n = -1;
		}
		return n;
	}
	public static void main(String[] args) {
		java.util.Scanner input = new java.util.Scanner(System.in);
		System.out.println("정수 값 :");
		int x = input.nextInt();
		
		MethodMain02 m1 = new MethodMain02(); //객체 선언 및 생성
		int result = m1.signOf(x); // method 호출
		System.out.println("result : " + result);
		
		input.close();
		
		
	}
}
