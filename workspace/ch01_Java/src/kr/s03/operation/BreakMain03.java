package kr.s03.operation;

public class BreakMain03 {
	public static void main(String[] args) {
		//다중 반복문에서 break 통해 모두 빠져나가기
		exit_for: //break label 지정
		for (int i = 0 ; i < 3 ; i++) {
			for (int j = 0 ; j < 5 ; j++) {
				if (j==3) {
					break exit_for;//레이블이 지정된 for 문 영역을 빠져나감
				}
				System.out.println(i + "," + j);
			}
		}
		//여까지
	}
}
//삼중 반복문은 쉽지 않다.느려질 수 있어 여러개로 분할해 반복하기.