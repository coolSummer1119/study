package kr.s25.object.inner;

class Outer{
	//Outer 의 멤버 변수
	int x = 100;
	
	//내부클래스 (멤버 내부 클래스) // 명시적으로 객체 생성을 해야함
	class Inner{
		//Inner의 멤버 변수
		int y = 200;
	}
}

public class MemberMain01 {
	public static void main(String[] args) {
		Outer ot = new Outer();
		//Outer 내부클래스인 Inner클래스를 객체 생성
		//자료형     객체이름 아우터객체참조 생성자
		Outer.Inner oi = ot.new Inner();
		
		//Outer의 멤버변수 호출
		System.out.println(ot.x);
		System.out.println(oi.y);
	}
}
