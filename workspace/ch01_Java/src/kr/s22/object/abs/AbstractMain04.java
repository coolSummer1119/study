package kr.s22.object.abs;

//추상클래스
abstract class AbsEx{
	int a = 100;//변수
	public int getA() {//일반메서드
		return a;
	}
	abstract public int getB(); // abstract 와 public 모두 번갈아 써도 됨
	abstract public int getC();
}
//추상클래스
abstract class AbsEx2 extends AbsEx{//추상 클래스를 추상클래스가 상속을한다면 상속의 의무가 없음
	String msg = "신세계";
	//추상메서드
	abstract public String getMsg();
	//부모클래스의 추상 메서드 구현
	@Override
	public int getB() {
		return 200;
	}
}

public class AbstractMain04 extends AbsEx2{
	//부모클래스의 추상메서드를 구현
	@Override
	public int getC() {
		return 300;
	}
	public String getMsg() {
		return msg;
	}
	public static void main(String[] args) {
		AbstractMain04 am = new AbstractMain04();
		System.out.println(am.getA());
		System.out.println(am.getB());
		System.out.println(am.getC());
		System.out.println(am.getMsg());
	}
}
