package kr.s02.operator;

public class OperatorMain10 {
	public static void main(String[] args) {
		System.out.println("===조건(삼항)연산자===");
		
		int a=5, b=10;
		int max; // 최댓값을 저장할 변수 선언
		int min; // 최솟값을 저장할 변수 선언
		
		//최댓값 구하기
		max = a > b ? a : b; // a가 b보다 크면 a 출력 작으면 b 출력
		System.out.println("max = " + max);
		
		min = a < b ? a : b;
		System.out.println("min = " + min);
	}
}
