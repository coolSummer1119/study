package kr.s25.object.inner;

public class Ano {
	public void make() {
		//익명 내부클래스 : 클래스를 정의하는 부분과 객체를 생성하는 부분이 합쳐진 형태
		//Inner7 클래스가 상속된 이름없는 클래스를 객체 생성
		Inner7 i = new Inner7() { //객체 생성과 
			@Override
			public void disp() {
				System.out.println("익명 내부클래스의  disp");
			}
		}; //여기까지 클래스의 정의부분이 합쳐짐
		i.disp();//메서드 호출
	}
	public static void main(String[] args) {
		Ano an = new Ano();
		an.make();
	}
}
