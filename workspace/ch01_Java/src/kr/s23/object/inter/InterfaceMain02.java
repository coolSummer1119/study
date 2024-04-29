package kr.s23.object.inter;

//인터페이스는 형식을 부여하기 위해서 추상메서드를 작성 (빵을 위한 빵틀을 만들기)
//인터페이스는 형식만 있고 내용은 없다.
interface A2{
	//추상메서드
	public abstract void abc();// 원형
	void def();//public abstract 생략
}

class B2 implements A2{
	//인터페이스의 추상메서드를 구현
	@Override
	public void abc() {
		System.out.println("abc메서드");
	}
	public void def() {
		System.out.println("def메서드");
	}
}

public class InterfaceMain02 {
	public static void main(String[] args) {
		B2 bp = new B2();
		bp.abc();
		bp.def();
	}
}
