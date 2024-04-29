package kr.s19.object.finaltest;

class A{
	//멤버 필드
	final int NUM = 10; //상수(변경할 수 없음) , 일반적으로 상수는 대문자로 함
	public static final int NUMBER = 20;// static이기 때문에 클래스 명만 달고 출력
}

public class FinalMain01 {
	public static void main(String[] args) {
		A a = new A();
		//a.NUM = 30;
		System.out.println(a.NUM);
		//static함수 호출
		System.out.println(A.NUMBER);
		
		final int NO = 30;
		System.out.println(NO);
	}
}
