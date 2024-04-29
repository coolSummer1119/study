package kr.s05.objectfield;

public class Student02 {
	//멤버 필드 (속성)
	String name;
	int age;
	String hobby;
	public static void main(String[] args) {
		//객체 선언 및 생성
		Student02 student = new Student02();
		System.out.println(student.name + ","  + student.age + "," + student.hobby);
		System.out.println("----------------------");
		//객체의 멤버 변수에 값 할당
		student.name = "강건마";
		student.age = 18;
		student.hobby = "쌈박질";
		System.out.println(student.name + ","  + student.age + "," + student.hobby);
	}
}
