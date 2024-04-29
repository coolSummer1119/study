package kr.s07.object.method;


class Tv{
	//멤버 필드 (속성)
	boolean power; //전원상태(on/off)
	int channel; //채널

	//멤버 메서드 (동작)
	public void isPower() { //TV를 켜거나 끄는 기능을 수행하는 메서드 , 토글방식
		power = !power;
	}
	public void channalUp() {//TV의 채널을 높이는 기능을 수행하는 메서드
		++channel;
	}
	public void channalDown() {//TV의 채널을 낮추는 기능을 수행하는 메서드
		--channel;
	}
}

public class TvMain {
	public static void main(String[] args) {
		//객체 선언 및 초기화
		Tv t = new Tv(); //boolean의 기본값 false (전원off상태) 채널 기본값 0
		t.isPower (); // power의 값은 false -> true
		System.out.println("TV의 실행 여부 : " + t.power);
		System.out.println("현재 채널 : " + t.channel);
		System.out.println("-----------------");
		
		t.channel = 7;
		System.out.println("첫번째 변경된 채널 : " + t.channel);
		System.out.println("-----------");
		
		t.channalDown();
		System.out.println("두번째 변경된 채널 : " + t.channel);
		System.out.println("-----------");
		
		//Tv전원 끄기
		t.isPower();
		System.out.println("TV의 실행 여부 : "+ t.power);
		
		
		
	}
}
