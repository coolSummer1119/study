package kr.s01.basic;

public class VariableMain02 {
	public static void main(String[] args ) {
		/*
		 * [실습]
		 * 정수를 담을 수 있는 변수를 3개 지정한다
		 * 변수 명은 a,b,c라고 지정하고 원하는 정수로 초기화 한다.
		 * a+b 연산후 출력할 때
		 * 
		 * [출력예시]
		 * 결과 = 50형식으로 출력한다
		 * 
		 * c에 저장된 데이터를 80으로 변경해서 
		 * c = 80 형식으로 출력ㄷ한다
		 */
		
		
		int a=20, b=30, c=40; //변수 선언 및 초기화
		int result = a + b; // result에 결과 값 a+b로 설정
		
		System.out.printf("결과 = %d%n", result ); // a + b 결과 출력
		//System.out.printf("결과 = %d%n", a + b ); // 동일하게 50 출력
		
		c = 80;
		
		System.out.printf("c = %d%n", c); // c 결과 출력
	}

}
