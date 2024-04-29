package kr.s02.operator;

public class OperatorMain05 {
	public static void main(String[] args) {
		java.util.Scanner input = new java.util.Scanner(System.in); //입력시작
		
		System.out.print("국어 : ");
		//입력된 정수를 변수에 대입
		int korean = input.nextInt();
		
		System.out.print("영어 : ");
		int english = input.nextInt();
		
		System.out.print("수학 : ");
		int math = input.nextInt();

		//총점 구하기
		int sum = korean + english + math;
		double avg = sum / 3 ;
		
		System.out.printf("국어 : %d점%n", korean);
		System.out.printf("영어 : %d점%n", english);
		System.out.printf("수학 : %d점%n", math);
		System.out.printf("총점 : %d점%n", sum);
		System.out.printf("평균 : %.1f점%n", avg);
		
		input.close(); //입력 끝
	}
}
