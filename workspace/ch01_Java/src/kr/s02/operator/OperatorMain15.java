package kr.s02.operator;

public class OperatorMain15 {
	public static void main(String[] args) {
		/*
		 * 
		 * 
		 * [입력 예시]
		 * 첫번째 정수 : 10
		 * 두번째 정수 : 5
		 * 세번째 정수 : 7
		 * 
		 * [출력 예시]
		 * 최대값 : 10
		 * 최소값 : 5
		 * 
		 */
		java.util.Scanner input = new java.util.Scanner(System.in);
		
		System.out.print("첫번째 정수 :");
		int first = input.nextInt();
		
		System.out.print("두번째 정수 :");
		int second = input.nextInt();
		
		System.out.print("세번째 정수 :");
		int third = input.nextInt();
		
		int max, min ;
		
		max = first > second ? first : second ;
		max = second > third ? second : third ;
		max = third > first ? third : first ;
		
		// max = first > second ? first : second;
		// max = max > third ? max : third;
		
		min = first < second ? first : second ;
		min = second < third ? second : third ;
		min = third < first ? third : first ;
		
		System.out.println("최대값 : "+ max);
		System.out.println("최소값 : "+ min);
		
		
		input.close();
	}
}
