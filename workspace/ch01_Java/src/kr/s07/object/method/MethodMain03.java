package kr.s07.object.method;

public class MethodMain03 {
	/*
	 * [실습]
	 * 배열의 요소 수를 입력받아서 배열 x 생성
	 * 입력받은 정수를 배령 x에 저장하고
	 * 배열 x가 가진 모든 요소의 합을 구하는 sumOf(int[] a)메서드 정의
	 * 
	 * [입력 예시]
	 * 요소 수 : 3
	 * x[0]=1
	 * x[1]=2
	 * x[2]=3
	 * 
	 * [출력 예시]
	 * 모든 요소의 합은 6입니다.
	 * 
	 */
	public int sumOf(int [] x) {//합을 구하는 메서드 먼저 정의
		int sum = 0;
		for(int k = 0 ; k < x.length; k++) {
			sum += x[k];
		}
		return sum;
	}
	
	
	public static void main(String[] args) {
		java.util.Scanner input = new java.util.Scanner(System.in);
		
		System.out.println("요소 수 :");
		int num = input.nextInt();
		int[] x = new int[num];
		
		for (int i=0 ; i < x.length; i++ ) {
			System.out.println("x[" + i + "] = " );
			x[i] = input.nextInt();
		}
		MethodMain03 a = new MethodMain03();
		int result = a.sumOf(x);
		System.out.println("result : "+ result);

		input.close();
		
	}
}
