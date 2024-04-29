package kr.s24.object.enumtest;

enum Gender{
	MALE,FEMAIL;//열거형 상수만 있다면,세미콜론 생략 가능
	
	//메서드 재정의
	@Override
	public String toString() {//오브젝트에 있던 toString을 재정의
		switch(this) { //열거형 상수를 객체로 인식
		case MALE:
			return "남자";
		default :
			return "여자";
		}
	}
}

public class EnumMain03 {
	public static void main(String[] args) {
		System.out.println(Gender.MALE);
		System.out.println(Gender.FEMAIL);
		System.out.println("------------------");
		
		System.out.println(Gender.MALE.toString());
		System.out.println(Gender.FEMAIL.toString());
	}
}
