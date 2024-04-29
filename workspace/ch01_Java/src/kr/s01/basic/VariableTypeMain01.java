package kr.s01.basic;

public class VariableTypeMain01 {
	public static void main(String[] args) {
		System.out.println ("===논리형===");
		
		//논리형 (true, false)
		boolean b = true;
		System.out.println("b = " + b);
		
		System.out.println("===문자형===");
		//문자형, 크기 : 2byte, 16bit / 숫자 표현 범위 : 0~ 65535
		//다국어 처리를 위한 유니코드(unicode) 방식
		
		char c1 = 'A';// 내부적으로 아스키 코드값 65가 2byte로 변수 c1에 담김
		System.out.println("c1 = " + c1);
		
		char c2 = 65; //문자를 표현하는 char에 A에 해당되는 아스키코드값을 직접 대입 
		System.out.println("c2 = " + c2); //아스키 코드 65가 > A로 변환
		
		char c3 = '\u0041'; // A를 의미하는 유니코드 - \ u는 유니코드를 의미 뒤에 4개 숫자는 16진수
		System.out.println("c3 = " +c3); 
		
		char c4 = '자';
		System.out.println("c4 = " + c4);
		
		char c5 = '\uc790'; // 자를 의미하는 유니코드
		System.out.println("c5 = " + c4);
		
		System.out.println("===정수형===");
		//byte, 크기 : 1byte, 표현범위 : -128 ~ 127 까지만 표현 가능
		//연산할 때 거의 사용 x, 입출력시 활용 
		byte b1 = 127;
		System.out.println("b1 = " + b1);
		
		//short, 크기 : 2byte, 표현범위 : -32,768 ~ 32, 767까지
		short s1 = 32767;
		System.out.printf("s1 = %,d%n", s1); // 쉼표 넣기 위해서 printf 사용
		
		//int, 크기 : 4byte, 표현범위 : -2,147,483,648 ~ 2,147,483,647
		int in = 1234;
		System.out.println("in = " + in);
		
		//long, 크기 : 8byte
		long lg = 1234L; //처음 인식은 int로 인식하고 그다음 long으로 전환 , L은 long형 데이터를 의미
		System.out.println("lg = " + lg);
		
		System.out.println("===실수형===");
		
		//float, 크키 : 4byte
		float f1 = 9.1F; //F 를 안 넣으면 double로 인식
		System.out.println("f1 = " + f1);
		
		//double, 크키 : 8byte
		double du = 9.8;
		System.out.println("du = " + du);
		
		System.out.println("===문자열 표시===");
		
		//문자열 표시 (기본자료형이 아님, 참조자료형)
		String str = "Hello World";//String에서 앞글자 꼭 대문자
		System.out.println("str = " + str); 
		
		
	}

}
