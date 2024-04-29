package kr.s17.object.overriding;
//부모클래스
class GrandParent{
	public String getCar() {
		return "구형자동차";
	}
}
class Uncle extends GrandParent{

}

//자식클래스
class Father extends GrandParent{
	//Method Overriding (메서드 재정의)
	//상속관께에서 자식 클래스에 메서드 재정의를 하면 부모클래스의 메서드가 호출 되는 것이 아니라 자식클래스의 메서드가 호출됨
	//메서드 재정의를 하는 이유 여러 자식 클래스에게 상속을 할 수 있기때문에 그것때문에 부모 클래스를 수정할 수 없음
	@Override //어노테이션은 메서드 재정의 문법에 맞게 재정의가 잘 되었는지 검증하는 기능의 주석, 
			  //문법에 맞게 재정의 되지 않으면 컴파일 오류발생
	public String getCar() {
		return "신형자동차";
	}
}
public class OverridingMain01 {
	public static void main(String[] args) {
		Father ft = new Father();
		System.out.println("아버지는 "+ ft.getCar() + "를 좋아해요.");
		Uncle un= new Uncle();
		System.out.println("삼촌은 "+ un.getCar() + "를 좋아해요.");
		
	}
}
