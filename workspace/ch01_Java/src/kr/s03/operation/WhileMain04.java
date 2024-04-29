package kr.s03.operation;

public class WhileMain04 {
	public static void main(String[] args) {
		/*
		 * [실습]
		 * 입력받은 정수값부터 0까지 출력하는 프로그램을 작성하시오.
		 * (0보다 큰 수를 입력하고 0이하를 입력하면 0보다 큰 수를 입력하세요)
		 * [입력 예시]
		 * 정수 입력 : --
		 * [출력 예시]
		 * -
		 * -
		 * -
		 * -
		 * 
		 */
		java.util.Scanner input = new java.util.Scanner(System.in);

		System.out.print("정수 입력 : ");
		int i = input.nextInt();

		if(i>0) {
			while(i>=0) {
				System.out.println(i);
				i--;
			}
		}else {
			System.out.println("0보다 더 큰 수를 입력하세요.");
		}


		input.close();
	}
}
