package kr.s04.array;

public class practice {
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
	public int sumOf(int [] a) {
		int sum=0;
		for (int i = 0; i < a.length; i++ ) {
			sum += a[i];
		}
		return sum;
	}
	
	public static void main(String[] args) {
		
	}
}
