package kr.s03.operation;

public class ScoreMain01 {
	public static void main(String[] args) {
		java.util.Scanner input = new java.util.Scanner(System.in);
		
		int korean, english, math, sum;
		char grade;
		float avg;
		
		do {
			System.out.print("국어 :");
			korean = input.nextInt();
			
		}while(korean < 0 || korean > 100);//잘못 입력하면 다시 
		do {
			System.out.print("영어 :");
			english = input.nextInt();
			
		}while(english < 0 || english > 100);//잘못 입력하면 다시 
		do {
			System.out.print("수학 :");
			math = input.nextInt();
			
		}while(math < 0 || math > 100);//잘못 입력하면 다시 
		
		sum = korean + english + math;
		
		avg = sum / 3.0f; //형변환
		//      연산의 결과임을 알려주기위해 괄호 인트와 괄호 씌우기 (캐스트 연산자) (연산의 결과)
		switch((int)(avg/10)) {
		case 10 :
		case 9 :
			grade = 'A'; break;
		case 8 :
			grade = 'B'; break;
		case 7 :
			grade = 'C'; break;
		case 6 :
			grade = 'D'; break;
		default :
			grade = 'F'; break;
		}
		System.out.print("\n"); // 단순 줄바꿈
		System.out.printf("총점 : %d점%n", sum);
		System.out.printf("평균 : %.2f%n", avg);
		System.out.printf("등급 : %c%n", grade);
		
		input.close();
	}
}
