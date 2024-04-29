package kr.s18.object.poly;
//부모클래스
class Parent{
	int a=100;
}
//자식클래스
class Child extends Parent{
	int b =200;
}


public class PolyMain01 {
	public static void main(String[] args) {
		//↓참조자료형
		Child ch = new Child();
		System.out.println(ch.a);
		System.out.println(ch.b);
		//ch의 주소를 복사해서 p로 들어가 같은 객체만 들어감 (type만 바뀜)
		Parent p = ch;//자식클래스 타입 > 부모클래스타입 형변환
					  //업캐스팅, 자동적으로 형변환
		System.out.println(p.a);
		//호출범위를 벗어나서 호출 불가능
		//System.out.println(p.b); Parant 클래스의 소스들만 호출가능
		
		
		Child ch2=(Child)p; // 부모클래스 타입 - > 자식클래스타입 형변환
							// 다운캐스팅, 명시적(()사용)으로 형변환
		System.out.println(ch2.a);
		System.out.println(ch2.b);
	}
}
