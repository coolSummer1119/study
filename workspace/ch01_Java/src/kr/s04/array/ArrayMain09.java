package kr.s04.array;

public class ArrayMain09 {
	public static void main(String[] args) {
		// (테스트 조건)main 에 전달할 데이터는 두 개의 정수
		// main 의 인자로 데이터를 전달하면 전달한 데이터의 자료형은
		// 숫자라도 문자열 취급이라 계산이 되지안혹 연결이됨
		System.out.println(args[0] + args[1]);
		System.out.println("------------");
		
		//String ->int
		int num = Integer.parseInt(args[0]); // 외워어ㅓ어!!!!!! 문자열을 정수로 전환
		int num2 = Integer.parseInt(args[1]);
		
		System.out.println("합계 : " + (num + num2));
	}
}
