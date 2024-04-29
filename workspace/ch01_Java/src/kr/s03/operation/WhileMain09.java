package kr.s03.operation;

public class WhileMain09 {
	public static void main(String[] args) {
		/*
		 * [실습]
		 * 커피 전문점에서 아메리카노가 4,000원 입니다. 마실 커피 수량을 정하고 돈을 지불하세요.
		 * 지불한 돈에서 발생한 거스름돈을 출력하고 커피의 총 비용보다 지불한 돈이 적어서 커피를 구매할 수 없을 경우 "금액이 부족합니다."
		 * (정상적으로 아메리카노를 구매하면 반복문을 빠져나오고 금액이 부족하면 계속 반복)
		 * 
		 * [입력 예시]
		 * 구매 수량 입력 : --
		 * 내가 지불한 금액 : ------
		 * or
		 * 내가 해야하는 금액 : ------
		 * 
		 * [출력 예시]
		 * 거스름돈은 -,---원 입니다. ->반복문을 빠져나감 (거스름돈 >=0)
		 * or
		 * 1,000원이 부족합니다.-> 계속 반복
		 * 
		 */

		java.util.Scanner input = new java.util.Scanner(System.in);
		int quantity, price, payment, balance, total;

		price = 4000;
		
		while(true) {
			System.out.print("구매수량 입력 :");
			quantity = input.nextInt();
			
			System.out.print("내가 지불한 금액 :");
			payment = input.nextInt();
			//총 지불해야하는 금액
			total = price * quantity;
			//거스름돈
			balance = payment - total;
			
			//거스름돈이 0이상이면 정상적인 구매로 반복문을 빠져나감
			
			if(balance>=0) {
				System.out.printf("거스름 돈은 %d원입니다%n", balance);
				break;//break 덕분에 else안써도 됨
			}else {
			}
			System.out.printf("%d원이 부족합니다.%n", -balance);
		}


		input.close();

	}
}
