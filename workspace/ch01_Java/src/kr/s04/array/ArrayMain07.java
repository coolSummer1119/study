package kr.s04.array;

public class ArrayMain07 {
	public static void main(String[] args) {
		java.util.Scanner input = new java.util.Scanner(System.in);
		String[] course = {"국어", "영어", "수학", "과학"};
		int[] score = new int[course.length]; // 0:국어 1:영어 2: 수학
		int sum = 0;
		float avg = 0.0f;
		
		//반복문을 이용해서 입력 처리
		for(int i = 0; i <score.length; i++) {//이퀄이 들어가면 없는 인덱스를 호출하기 때문에 오류발생 
			//입력값을 0에서 부터 100사이만 가능하게 조건 체크
			do {
				System.out.print(course[i] + "="); // 과목명 불러오기
				score[i] = input.nextInt(); // 점수 입력 란.		
			}while(score[i]<0 || score[i]>100);
			
			//총점 구하기
			sum += score[i];//반복문 하나로 합도 구하기
		}//end of for
		//평균 구하기
		avg = (float)sum/course.length;
		System.out.println();
		
		for (int i = 0; i < course.length;i++) {
			System.out.printf("%s = %d%n", course[i], score[i]);
		}
		
		System.out.printf("총점 = %d%n", sum);		
		System.out.printf("평균 =%.2f%n", avg);
		
		
		input.close();
	}
}
