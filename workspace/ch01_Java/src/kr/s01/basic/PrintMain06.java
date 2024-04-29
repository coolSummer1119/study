package kr.s01.basic;

public class PrintMain06 {
	public static void main(String[] args) {
		/*
		 * [실습]
		 * System.out.printf()를 이용해 아래와 같이 출력.
		 * 
		 * [출력 예시]
		 * 국어 : 98점
		 * 영어 : 97점
		 * 총점 : 195점 
		 * 평균 : 97.5점
		 * 
		 */
		System.out.printf("%s : %d점%n", "국어", 98);
		System.out.printf("%s : %d점%n", "영어", 97);
		System.out.printf("%s : %d점%n", "총점", 195);
		System.out.printf("%s : %.1f점%n", "평균", 97.5); //이거 다시 해보기 .1 - 소숫점 아래 한자리 수까지만 표기.
		System.out.println("--------------------------");
		// 문자 써넣기, 한 줄에 다쓰기 등의 방법도 있다.
		
		System.out.printf("국어 : %d점%n", 98);
		System.out.printf("영어 : %d점%n", 97);
		System.out.printf("총점 : %d점%n", 195);
		System.out.printf("평균 : %.1f점%n", 97.5);
		System.out.println("--------------------------");
		
		System.out.printf("%s : %d점%n%s : %d점%n%s : %d점%n%s : %.1f점", "국어", 98, "영어", 97, "총점", 195,
						  "평균", 97.5);
		
	}

}
