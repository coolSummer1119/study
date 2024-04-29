package kr.s03.operation;

public class BreakMain02 {
	public static void main(String[] args) {
		//다중반복문에서 break 사용하기
		for (int i = 0 ; i < 3 ; i++) {
			for (int j = 0 ; j < 5 ; j++) {
				if (j==3) {
					//특정 조건일 떄 반복문을 빠져나감
					//다중 반복문일 때 전체 반복문을 빠져나가는 것이 아니라 break 가 포함된 반복문 1개만 빠져나감.
					break;
				}
				System.out.println(i + "," + j);
			}
		}
	}
}
