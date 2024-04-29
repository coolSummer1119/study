package kr.s05.objectfield;

public class Police01 {
	//멤버 필드 (속성
	String name;
	int age;
	
	public static void main(String[] args) {
		//객체 선언 및 생성
		Police01 police = new Police01();
		//객체의 멤버 변수에 값 할당
		police.name ="크롱";
		police.age = 82;
		
		//객체의 멤버 변수에 저장된 값 읽기
		System.out.println("경찰의 이름 : " + police.name);
		System.out.println("경찰의 나이 : " + police.age);
		
		
	}
}
