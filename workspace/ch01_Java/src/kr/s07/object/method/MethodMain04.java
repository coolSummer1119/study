package kr.s07.object.method;

public class MethodMain04 {
	/*
	 * [실습]
	 * 배열 요소 수 (사람 수)를 입력 받아서 배열 weight 생성.
	 * 입력받은 정수를 배열 weight에 저장하고 배열 weight가 가진 모든 요소의 수중 모든 요소의 수중 최소값을 구하는
	 * minOf 메서드를 작성하시오
	 * 
	 * [입력 예시]
	 * 사람 수 : 3
	 * 1번의 몸무게 : 90
	 * 2번의 몸무게 : 88
	 * 3번의 몸무게 : 91
	 * 
	 * [출력 예시]
	 * 가장 마른 사람의 체중 : 88
	 */
	public int minOf(int [] a) {// 인자는 여러개 명시가 가능하나 
		int min = a[0];
		for(int i=1; i < a.length; i++) {
			if (a[i] < min) {
				min = a[i];
			}else {
			}
		}
		return min; //여러개 반환불가 ex) return min, max ... (x)
	}
	
	public static void main(String[] args) {
		java.util.Scanner input = new java.util.Scanner(System.in);
		
		System.out.print("사람 수 :");
		int num = input.nextInt();
		int [] weight = new int[num];
		
		for(int i = 0; i < weight.length; i++) {
			System.out.print((i+1) + "번 사람의 몸무게 :");
			weight[i] = input.nextInt();
			}
		
		MethodMain04 method = new MethodMain04();
		int result = method.minOf(weight);
		
		System.out.println("가장 마른 사람의 몸무게는 " + result + "kg입니다.");
		
		input.close();
	}
}
