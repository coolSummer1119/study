package kr.s03.operation;

public class IfMain04 {
	public static void main(String[] args) {
		/*
		 * 
		 */
		java.util.Scanner input = new java.util.Scanner(System.in);
		
		
		int score;
		char grade;
		System.out.print("성적 : ");
		score = input.nextInt();
		
		
		if (score>=90&& score<=100) {
			grade = 'A';
		}else if (score>=80 && score<=89 ) {
			grade = 'B';
		}else if (score>=70 && score<=79) {
			grade = 'C';
		}else if (score>=60 && score<=69) {
			grade = 'D';
		}else if (score>=0 && score<=58) {
			grade = 'F';
		}else {
			grade = '?';
		}
		
		System.out.printf("당신의 성적은 %d점이고,%n", score);
		System.out.printf("당신의 학점은 %s점입니다.%n", grade);
		
		
		
		
		
		input.close();
	}
}
