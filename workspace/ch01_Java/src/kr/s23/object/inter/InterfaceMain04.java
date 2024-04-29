package kr.s23.object.inter;

interface I{
	public abstract void play();
}

class Pianist implements I{
	@Override
	public void play(){
		System.out.println("피아노를 연주하다");
	}
}
class Cellist implements I{
	@Override
	public void play(){
		System.out.println("첼로를 연주하다");
	}
}

class Stage{
	public void autoPlay(I i) {//object를 호출하면 play를 활용 할 수 없음
		i.play();
	}
}

public class InterfaceMain04 {
	public static void main(String[] args) {
		Stage s = new Stage();
		s.autoPlay(new Pianist());//Pianist ->i
								  //클래스타입 -> 인터페이스타입 형변환
								  //자동적으로 형변환
		s.autoPlay(new Cellist());//Cellist ->i
		  						  //클래스타입 -> 인터페이스타입 형변환
								  //자동적으로 형변환
	}
}
