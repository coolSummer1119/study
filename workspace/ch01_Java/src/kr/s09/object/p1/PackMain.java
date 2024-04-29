package kr.s09.object.p1;

//호출하고자 하는 클래스의 패키지를 등록
import kr.s09.object.p2.PackTwo;//이후에는 import문을 이용해 클래스의 패키지를 등록했기 때문에 클래스명만 기재해도 호출 가능.

public class PackMain {
	public static void main(String[] args) {
		//kr.s09.object.p1.PackOne p1 = new kr.s09.object.p1.PackOne(); //원칙은 앞에 패키지를 모두 명시해야함
		//같은 페키지의 클래스를 호출해서 객체 생성을 할 떄는 패키지 생략 가능
		PackOne p1 = new PackOne();
		//PackTwo p2 = new PackTwo();//같은 패키지에 있지 않기 때문에 에러
		kr.s09.object.p2.PackTwo p3 = new kr.s09.object.p2.PackTwo();//풀네임으로 불러 호출 완
		}
	
}
