package kr.s25.object.inner;

public class LocalMain02 {
	//멤버 변수
	int a =100;
	String str = "장지환";
	
	//멤버 메서드
	public void innerTest(){
		int b =200;
		//로컬 내부 클래스
		class Inner{
			public void getData() {
				//멤버 변수
				System.out.println("변경 전 : " +  a);
				a=200;
				System.out.println("변경 후 : " +  a);
				System.out.println("--------------");
				//지역 변수 호출
				System.out.println("지역 변수 변경 전 : " + b);
				//b = 800; - 로컬 내부클래스가 포함된 메서드의 지역 변수를 호출할 때 자동으로 상수화가진행되어 데이터를 변경 불가능
			}
		}
		Inner i = new Inner();
		i.getData();
		class Inner2{
			public void getData2() {
				System.out.println("문자열 : " + str);
			}
		}
		Inner2 i2 = new Inner2();
		i2.getData2();
	}
	
	public static void main(String[] args) {
		LocalMain02 m = new LocalMain02();
		m.innerTest();
	}
}
