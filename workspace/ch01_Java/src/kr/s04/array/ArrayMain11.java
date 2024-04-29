package kr.s04.array;

public class ArrayMain11 {
	public static void main(String[] args) {
	/*
	 * [실습]
	 * double 형인 배열의 모든 요소의 합과 평균을 구하는 프로그램을 작성하시오.
	 * 
	 * [입력 예시]
	 * 요소의 수>3
	 * a[0] = 2.2 (input.nextDouble();을 사용)
	 * a[1] = 2.2
	 * a[2] = 3.3
	 * 
	 * [출력 예시]
	 * 모든 요소의 합은 7.7.입니다. (System.out.println사용)
	 * 모든 요소의 평균은 2.57입니다. (System.out.printf사용)소수점 둘째자리까지	
	 */
		java.util.Scanner input = new java.util.Scanner(System.in);
		
		System.out.println("요소 수 >");
		int num =  input.nextInt();
		
		double[] a = new double[num];
		
		double sum=0;
		
		for(int i=0; i< a.length; i++) {
			double d = input.nextDouble();
			a [i] = d;
			sum += a[i];
		}
		double avg;
		avg= sum / a.length;
		System.out.println("모든 요소의 총 합: " + sum);
		System.out.printf("모든 요소의 평균: %.2f", avg);
		
		input.close();
	}
}
