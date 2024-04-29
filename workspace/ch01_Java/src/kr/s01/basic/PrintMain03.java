package kr.s01.basic;

public class PrintMain03 {
	public static void main(String[] args) {
		//문자 : 한 문자
		System.out.println('A');// '은 문자를 의미하는 특수문자 - 출력x, A는 일반 문자 
		System.out.println('강');
		//System.out.println('도시'); 두 글자라 에러, 문자열에 작은 따옴표 사용 불가능
		
		//문자열 : 한 문자 *이상*의 문자들
		System.out.println("강호");
		System.out.println("X");
		System.out.println("carry");
		
		//숫자 (정수)
		System.out.println(25); //숫자로 취급 (연산 가능)
		System.out.println("25"); //문자열로 취급***** (연산 불가능)
		
		//숫자 (실수)
		System.out.println(3.14);
		System.out.println("3.14"); //문자열로 취급 *****
	
		//논리값 (boolean)
		System.out.println(true); //참값
		System.out.println(false); //거짓값
		System.out.println("false"); //문자열

		
	}

}
