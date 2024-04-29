package kr.s02.operator;

public class OperatorMain04 {
	public static void main(String[] args) {
		/* [숙제]
		 * pinos71@daum.net으로 보내기
		 * 
		 * [실습]
		 * 534자루의 연필을 30명의 학생들에게 똑같은 갯수로 나누어 줄 때 학생당 몇개를 가질 수 있고, 최종적으로 몇개가 남는지를 구하시오
		 * 
		 * [출력 예시]
		 * 학생 한 명이 가지는 연필 수 : --자루
		 * 남은 연필 수 --자루
		 * 
		 */
		
		int pencil = 534, student = 30;
		int avg = pencil / student ;
		int theLeft = pencil % student;
		
		System.out.printf("학생 한명이 가지는 연필 수 : %d자루%n", pencil);
		System.out.printf("남은 연필 수 : %d자루%n", theLeft);
		
		System.out.println("====연습====");
		System.out.printf("%s수 = %d명%n", "학생", student);
		System.out.printf("%s수 = %d자루%n", "연필", pencil);
		System.out.printf("학생 한명이 가지는 연필 수 : %d자루%n", pencil);
		System.out.printf("남은 연필 수 : %d자루%n", theLeft);
		
	}

}
