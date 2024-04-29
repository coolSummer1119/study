package kr.s23.object.inter;

interface CookieMold{//쿠키틀
	public abstract void makeStar();
	public abstract void makeCircle();
	public abstract void makeDiamond();
}

class Cookie implements CookieMold{
	//인터페이스가 형식을 제공하면 클래스에서 제공된 형식을 이용해 내용을 채운다.
	//추상메서드 구현
	@Override
	public void makeStar() {
		System.out.println("별모양의 쿠키를 만들다.");
	}
	@Override
	public void makeCircle() {
		System.out.println("원모양의 쿠키를 만들다.");
	}
	@Override
	public void makeDiamond() {
		System.out.println("다이아몬드모양의 쿠키를 만들다.");
	}
}

public class interfaceMain03 {
	public static void main(String[] args) {
		Cookie co = new Cookie();
		co.makeStar();
		co.makeCircle();
		co.makeDiamond();
	}
}
