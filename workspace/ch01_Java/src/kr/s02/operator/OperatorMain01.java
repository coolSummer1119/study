package kr.s02.operator;

public class OperatorMain01 {
	public static void main(String[] args) {
		System.out.println("===증감 연산자==="); // 우선순위 1순위
		//증가 연산자
		int i = 5;
		//증가연산자를 변수 앞에 명시하면 변수 값을 1 증가시킨 후 증가된 값을 읽어옴
		System.out.println(++i);//6 출력
		System.out.println("----------");
		
		//증가연산자를 변수 뒤에 명시하면 변수 값을 먼저 출력하고 그 후 1을 증가 * 소스를 두개 써야함.
		System.out.println(i++); // 7을 기대하지만 6 출력, i의 값을 더하기 전에 먼저 부른 상황
		System.out.println(i); //7출력
		
		System.out.println("----------");
		//감소연산자
		int j = 10;
		//감소연산자를 변수 앞에 명시하면 변수 값을 1 감소시킨 후 감소된 값을 읽어옴
		System.out.println(--j);
		System.out.println("----------");
		
		//증가연산자를 변수 뒤에 명시하면 변수 값을 먼저 출력하고 그 후 1을 감소 * 소스를 두개 써야함.
		System.out.println(j--);
		System.out.println(i);
		
		
		
	}

}
