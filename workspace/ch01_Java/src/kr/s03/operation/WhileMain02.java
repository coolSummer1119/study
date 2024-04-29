package kr.s03.operation;

public class WhileMain02 {
	public static void main(String[] args) {
		//   반복하기위한, 증감식을 위한 변수선언
		int sum = 0, su = 1 ;
				//조건식
		while(su <= 100) {
			//누적
			sum += su;
			//증감식
			su ++;//없으면 무한 루프 ******주의주의
			//무한 루프에 빠질경우 빨간색 버튼으로 멈추기
		}
		System.out.println("1부터 100까지의 합 : " + sum
				);
	}
}
