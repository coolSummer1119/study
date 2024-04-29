package kr.s11.object.constructor;

class Student{
	int korean;
	int english;
	int math;
	int history;
	int science;
	int num; //과목수

	//생성자 Overloading
	public Student(int k, int e, int m) {
		korean = k;
		english = e;
		math = m;
		num = 3; //과목수 지정.
	}
	public Student(int k, int e, int m, int h, int s) {
		korean = k;
		english = e;
		math = m;
		history = h;
		science = s;
		num = 5;
	}
	//총점 구하기
	public int getTotal() {
		int total;
		if (num == 3) { //3과목 시험
			total = korean + english + math;
		}else {
			total = korean + english + math + history + science;
		}
		return total;
	}
	public int getAvg() {
		return getTotal()/num;}
}

public class StudentMain {
	public static void main(String[] args) {
		Student s1 = new Student(45,34,69);
		System.out.println("합계 : " + s1.getTotal());
		System.out.println("평균 : " + s1.getAvg());
		System.out.println("======================");
		
		Student s2 = new Student(94,24,78,54,78);
		System.out.println("합계 : " + s2.getTotal());
		System.out.println("평균 : " + s2.getAvg());
	}
}
