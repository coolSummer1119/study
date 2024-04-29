package kr.s15.object.thistest;

public class AnimalMain {
	/*
	 * [실습]
	 * Animal
	 * 멤버 변수 : 이름 (name), 나이(age), 비행 여부 (fly)-boolean
	 * 멤버 메서드 : public set / get 메서드
	 * 생성자 : 인자가 있는 생성자, 인자가 없는 생성자
	 * 
	 * AnimalMain
	 * 인자가 있는 생성자를 이용해 객체를 생성
	 * 이름, 나이, 비행 여부를 출력, 비행여부를 true / false 를 가능 / 불가능
	 * 
	 * 인자가 없는 생성자를 이용해서 객체 생성
	 * 이름, 나이, 비행 여부 설정
	 * 이름, 나이, 비행 여부를 출력, 비행여부를 가능 / 불가능으로 출력
	 * 
	 * 애니멀 메인에서만 사용하길 원하면 private사용
	 */
	
	public static void main(String[] args) {
		Animal a1 = new Animal("고양이", 4, false);
		
		Animal a2 = new Animal("강아지");
		Animal a3 = new Animal(23);
		Animal a4 = new Animal(false);
		
	}
}
