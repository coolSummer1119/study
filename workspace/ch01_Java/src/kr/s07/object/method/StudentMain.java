package kr.s07.object.method;

public class StudentMain {
	//멤버 필드 (속성)
	String name;
	int korean;
	int english;
	int math;
	
	//멤버 메서드 (동작)
	//총점 구하기
	public int makeSum() {
		return korean + english + math;
	}
	
	//평균 구하기
	public int makeAvg() {
		return makeSum() / 3;
	}
	
	//등급 구하기
	public String makeGrade() {
		String grade;
		switch (makeAvg()/10){
			case 10 :
			case 9 :
				grade = "A"; break;
			case 8 :
				grade = "B"; break;
			case 7 :
				grade = "C"; break;
			case 6 :
				grade = "D"; break;
			default : grade = "F";
		}
		return grade;
	}
	//성적 출력
	public void printScore() {//내부적으로 출력하기때문에 void로 작성해 반환하는데이터가 없게한다.
		System.out.println("이름 : " + name);
		System.out.println("국어 : " + korean);
		System.out.println("영어 : " + english);
		System.out.println("수학 : " + math);
		System.out.println("총점 : " + makeSum());
		System.out.println("평균 : " + makeAvg());
		System.out.println("등급 : " + makeGrade());
	}
	
	public static void main(String[] args) {
		StudentMain student = new StudentMain();
		student.name = "장금보";
		student.korean = 98;
		student.english = 97;
		student.math = 96;
		
		System.out.println("이름 : " + student.name);
		System.out.println("국어 : " + student.korean);
		System.out.println("영어 : " + student.english);
		System.out.println("수학 : " + student.math);
		System.out.println("총점 : " + student.makeSum()); //변수에 담지 않고 바로 호출
		System.out.println("평균 : " + student.makeAvg());
		System.out.println("등급 : " + student.makeGrade());
		System.out.println("------------------------");
		
		StudentMain student2 = new StudentMain();
		student2.name = "장미려";
		student2.korean = 91;
		student2.english = 99;
		student2.math = 79;
		student2.printScore();// 코드 줄이기
		
		
	}
}
