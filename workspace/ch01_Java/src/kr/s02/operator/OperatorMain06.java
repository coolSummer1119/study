package kr.s02.operator;

public class OperatorMain06 {
	public static void main(String[] args) {
		System.out.println("===비교(관계)연산자===");
		boolean result;
		int a = 10;
		double b = 10.5;
		
		result = a < b ; // a의 10.0으로 자동적인 형변환
		System.out.println("a < b : " + result);
		
		result = a > b ;
		System.out.println("a > b : " + result);
		
		result = a >= b ;
		System.out.println("a >= b : " + result);
		
		result = a <= b ;
		System.out.println("a <= b : " + result);
		
		result = a == b ; //첫번째 이퀄은 대입 두개짜리는 비교
		System.out.println("a == b : " + result);
		
		result = a != b ; //같지 않다
		System.out.println("a != b : " + result);
		
	}
}
