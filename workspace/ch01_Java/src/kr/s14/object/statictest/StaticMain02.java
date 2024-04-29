package kr.s14.object.statictest;

class StaticMethod {
	//인스턴스 변수 , 객체가 생성되어야 데이터가 올라감
	String s1 = "행복";
	//static(클래스) 변수 , 호출만하면 데이터가 올라감
	static String s2 = "행운";

	//static(클래스) 메서드
	public static String getString() {
		return s2;
	}
}

public class StaticMain02 {
	public static void main(String[] args) {
		//static 메서드는 객체 생성 없이 호출 할 수 있고
		//클래스 명. 메서드 명의 형태로 호출
		System.out.println(StaticMethod.getString());
		//static 변수는 클래스 명.변수명의 형태로 호출
		System.out.println(StaticMethod.s2);
		
		//인스턴스 변수를 호출할 떄는 먼저 객체 생성 후 참조변수.변수명의 형태로 호출
		StaticMethod sk = new StaticMethod();
		System.out.println(sk.s1);
	}
}
