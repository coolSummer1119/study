package kr.s06.instance;

public class InstanceMain {
	//클래스의 기본 구조
	//멤버 필드 (속성)
	int var1; //멤버 변수
	String var2; // 멤버 변수
	
	//생성자, 생략 가능하며 생략하면 컴파일시 자동 생성 =>객체 생성시 호출
	public InstanceMain() {}
	
	//멤버 메소드 =>동작
	//             ↓()가 입구혁할을 함
	public int sum(int a, int b) { // 정수형 데이터가 전달 되어야함
		return a + b; //return이 있어야 데이터가 함수 밖으로 나갈 수 있음./return은 출구 역할.
	}
	public static void main(String[] args) {
		//객체 선언 및 생성
		InstanceMain im = new InstanceMain();
		//객체의 멤버 변수에 값을 할당
		im.var1 = 100;
		im.var2 = "서울";
		//객체의 멤버 변수 값 호출
		System.out.println(im.var1 + "," + im.var2);
		//객체의 멤버 메서드 호출
		int result = im.sum(10, 20);
		System.out.println("result : " + result);
	}
}
