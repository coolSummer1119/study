package kr.s11.object.constructor;
//같은 패키지에 같은 이름의 클래스를 사용하면 충돌이 남.
class Car2{
	String color;
	String gearType;
	int door;
	
	//생성자 오버로딩
	//생성자를 여러개 정의하는데 인자의 타입과 개수, 배치 순서를 기준으로 생성자를 구분
	public Car2() {//기본생성자
		
	}
	
	public Car2(String c, String g, int d) {//인자 있는 생성자
		color = c;
		gearType = g;
		door = d;
	}
}
public class CarMain02 {
	public static void main(String[] args) {
		//객체 선언 및 생성
		Car2 newCar = new Car2();
		newCar.color = "gold";
		newCar.gearType = "auto";
		newCar.door = 5;
		System.out.println(newCar.color + ", " + newCar.gearType + ", " + newCar.door);
		
		Car2 car2 = new Car2("검정색", "manual", 4);//인자가 있다면 넣어줘야 함.
		System.out.println(car2.color + ", " + car2.gearType + ", " + car2.door);
		
	}
}
