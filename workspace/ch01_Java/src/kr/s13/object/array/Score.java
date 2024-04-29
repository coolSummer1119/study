package kr.s13.object.array;

public class Score {
	//은닉화
	private String name;
	private int korean;
	private int english;
	private int math;
	
	//생성자
	public Score(String name, int korean, int english, int math) {
		//멤버 변수 = 지역 변수
		this.name = name ;
		this.korean = korean;
		this.english = english;
		this.math = math;
	}
	
	//총점 구하기
	public int makeSum() {
		return korean + english + math;
	}
	
	//평균 구하기
	public int makeAvg() {
		return makeSum() / 3;
	}
	
	//등급구하기
	public String makeGrade() {
		String grade;
		switch (makeAvg()/10) {
		case 10 :
		case 9 :
			grade = "A"; break;
		case 8 :
			grade = "B"; break;
		case 7 :
			grade = "C"; break;
		case 6 :
			grade = "D"; break;
		default :
			grade = "F";
		}
		return grade;
	}
	public String getName() {
		return name;
	}
	public int getKorean() {
		return korean;
	}
	public int getEnglish() {
		return english;
	}
	public int getMath() {
		return math;
	}
}
