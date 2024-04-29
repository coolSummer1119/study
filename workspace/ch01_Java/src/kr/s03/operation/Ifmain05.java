package kr.s03.operation;

public class Ifmain05 {
	public static void main(String[] args) {
		/*[실습]
		 * 정수 하나를 입력하여 짝수면 10을 더하ㅗ 홀수면 20을 더하여 결과값을 출력하시오.
		 * 
		 * [입력 예시]
		 * 정수 하나 입력 : 64
		 * 
		 * [출력 예시]
		 * 결과 :84
		 */
		java.util.Scanner input = new java.util.Scanner(System.in);
		
		System.out.print("정수 하나 입력 :");
		int a = input.nextInt();
		int sum;
		
		if (a%2==0) {
			sum = a + 10;
		}else {
			sum = a + 20;
		}
		
		System.out.printf("결과 : %d%n", sum);
		
		
		
		
		input.close();
	}
}
