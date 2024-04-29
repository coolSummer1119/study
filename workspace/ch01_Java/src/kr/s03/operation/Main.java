package kr.s03.operation;

public class Main{
	public static void main(String[] args) {
		java.util.Scanner input = new java.util.Scanner(System.in);
		System.out.println("A 입력 :");
		int A = input.nextInt();
		System.out.println("B 입력 :");
		int B = input.nextInt();
		
		System.out.println(A + B);
		
		input.close();
	}
}
