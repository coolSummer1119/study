package kr.s25.object.inner;

class Inner7{
	public void disp() {
		System.out.println("부모클래스의 disp");
	}
}

public class AnonymousMain {
	public void make() {
		//로컬 내부 클래스
		class Inner extends Inner7{
			@Override
			public void disp() {
				System.out.println("내부클래스의 disp");
			}
		}
		//내부클래스 객체 생성
		Inner i = new Inner();
		i.disp();
	}
	public static void main(String[] args) {
		AnonymousMain an = new AnonymousMain();
		an.make();
	}
}
