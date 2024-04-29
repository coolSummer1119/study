package kr.s02.operator;

public class OperatorMain03 {
	public static void main(String[] args) {
		/*
		 * [실습]
		 * 변수 선언시 자료형은 모두 int로 지정하고
		 * 변수 korean, english, math를 선언하고 90, 95, 88로 초기화한다
		 * 총점을 구해서 변수 sum에 저장하고
		 * 평균을 구해 avg에 젖장
		 * 
		 * [출력 예시]
		 * 국어 : 90점
		 * 영어 : 95점
		 * 수학 : 88점
		 * 총점 : --점
		 * 평균 : --점
		 * 
		 */
		
		int korean = 90, english = 95, math = 88 ;
		int sum = korean + english + math;
		float avg = (korean + english + math) / 3;
		
		System.out.printf("%s = %d점%n", "국어", korean);
		System.out.printf("%s = %d점%n", "영어", english);
		System.out.printf("%s = %d점%n", "수학", math); 
		System.out.printf("%s = %d점%n", "총점", sum); 
		System.out.printf("%s = %.1f점%n", "평균", avg); 
	}

}
