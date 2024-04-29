package kr.s05.objectfield;

public class Student05 {
	String name; // 배열은 자료형을 하나로만 쓸수 있다는 단점이 있지만 객체는 다양하게 넣을 수 있음
	int korean;
	int english;
	int math;
	int sum;
	double average;

	public static void main(String[] args) {
		Student05 student = new Student05();
		student.name = "노소하";
		student.korean = 98;
		student.english = 97;
		student.math = 95;
		student.sum = student.korean + student.english + student.math;
		student.average = student.sum / 3.0 ; // average자체가 실수형 자료기때문에 3이 아닌 3.0을 넣기

		//객체 멤버 변수 출력
		System.out.println("이름 : " + student.name);
		System.out.println("국어 : " + student.korean);
		System.out.println("영어 : " + student.english);
		System.out.println("수학 : " + student.math);
		System.out.println("총점 : " + student.sum);
		System.out.printf("평균 : %.2f", student.average);

	}
}
