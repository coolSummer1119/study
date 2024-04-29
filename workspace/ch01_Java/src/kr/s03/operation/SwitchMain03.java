package kr.s03.operation;

public class SwitchMain03 {
	public static void main(String[] args) {
		java.util.Scanner input = new java.util.Scanner(System.in);
		
		int score;
		char grade;
		
		System.out.print("성적 입력 :");
		score = input.nextInt();
		
		if (score<0 || score>100) {
			System.out.println("성적은 0부터 100만 입력 가능.");
			System.exit(0);
		}
		
		switch (score / 10) {//구간을 줄여주기
		case 10 :
			grade = 'A';//여기랑 아래 지워도 됨.
			break;
		case 9 :
			grade = 'A';
			break;
		case 8 :
			grade = 'B';
			break;
		case 7 :
			grade = 'C';
			break;
		case 6 :
			grade = 'D';
			break;
		default :
			grade = 'F';
		}
		
		System.out.println();//단순 줄 바꿈
		System.out.printf("성적 : %d%n", score);
		System.out.printf("학점 : %c%n", grade);
		
		
		input.close();
	}
}
