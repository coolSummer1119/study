package kr.s18.object.poly;
class Car{
	String color;
	int door;
	public void drive() {
		System.out.println("운전하다");
	}
	public void stop() {
		System.out.println("정지하다");
	}
}
class FireEngine extends Car{
	public void water() {
		System.out.println("물을 뿌리다");
	}
}

public class PolyMain06 {
	public static void main(String[] args) {
		FireEngine fe = new FireEngine();

		//자식클래스를 생성했기때문에 다 출력됨

		if (fe instanceof FireEngine) {
			System.out.println("FireEngine 객체입니다");
		}
		if (fe instanceof Car) {
			System.out.println("Car 객체입니다");
		}
		if (fe instanceof Object) {
			System.out.println("Object 객체입니다");
		}

		Car c = new Car();

		//부모클래스를 생성했기때문에 car 과 object만 출력

		if (c instanceof FireEngine) {
			System.out.println("FireEngine 객체입니다");
		}
		if (c instanceof Car) {
			System.out.println("Car 객체입니다");
		}
		if (c instanceof Object) {
			System.out.println("Object 객체입니다");
		}
	}
}
