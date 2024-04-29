package kr.s22.object.abs;

//추상클래스
abstract class A2{
	private int x;
	public void setX(int x) {
		this.x = x;
	}
	public int getX() {
		return x;
	}
	//추상메소드
	public abstract void make();//중괄호가 없음, 내용은 없고 형식만 존재. 무조건 재정의가 있는 상황이면 자식클래스에서 재정의 의무를 부여함
}
//자식 클래스
class B2 extends A2{
	//부모클래스의 추상 메서드를 구현
	@Override
	public void make() {//문법적으로는  재정의 문법을 따름 즉, Override 사용 가능
		System.out.println("make");
	}
	int b = 200;
}

public class AbstractMain02 {
	public static void main(String[] args) {
		B2 bp = new B2();
		bp.make();
	}
}
