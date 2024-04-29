package kr.s01.basic;

public class VariableMain01 {
	public static void main(String[] args) {
		//변수 (variable)는 값을 저장할 수 있는 메모리의 공간
		//변수 선언 
		int num;
		
		//변수의 초기화
		num=10;
		
		//변수 출력
		System.out.println(num);
		
		System.out.println("-----------------");
		
		//변수 선언, 초기화
		int number = 20;
		
		//변수 출력
		System.out.println(number);
		
		//데이터 변경\
		number = 40;
		//출력
		System.out.println(number);
		
		//주의사황
		//동일한 변수명으로 변수를 선언하면 오류 발생
		System.out.println("-----------------");
		
		//동일한 자료형을 사용하기 때문에 두번째 변수명 명의 자료형은 생략
		
		int a = 10;
		int b = 20;
		int c = 30, d = 40;
		
		System.out.println(a+c);
		
		int result = c-d;
		
		System.out.printf("result = %d%n", result);
		
		//숫자 + 숫자 ->연산
		//숫자 + 문자열 -> 연결
		//문자열 + 문자열 -> 연결
		
		//주의사항
		System.out.println("결과 =" + a + b); // 결과 =1020으로 출력
		System.out.println("결과 =" + (a + b)); // 결과 =30으로 출력
		
		//면수 선언
		//int no;
		
		//변수 선언 후 출력 또는 연산하기 전에 반드시 초기화를 해야 함.
		//System.out.println(no);
	}

}
