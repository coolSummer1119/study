package kr.s03.operation;

public class CoffeeMain {
	public static void main(String[] args) {
		java.util.Scanner input = new java.util.Scanner(System.in);
		/*
		 * [실습]
		 * 동전을 넣고 커피를 주문하면 커피를 판매하는 자판기프로그램을 만든다.
		 * 자판기는 자판기 보유 동전 (1000),커피는 (10), 프림(10), 설탕(10) 을 보유하고 있고
		 * 커피를 주문할 때 마다 자판기 (보유 동전 - 거스름돈) 차감.
		 * 커피 5 프림 3 설탕 1 차감 0이 되면 판매를 중단함.
		 * 
		 * [입력 및 출력 예시]
		 * 동전을 넣으세요 (커피값 : 400) 500
		 * 거스름돈 : 100원
		 * 맛 좋은 커피가 준비 되었습니다.
		 * 
		 * OR
		 * 
		 * 동전을 넣으세요 (커피값 : 400) 300
		 * (고객이 투입한 동전이 커피값보다 작으면) 투입한 동전이 부족합니다.
		 * 
		 * or
		 * 
		 * 동전을 넣으세요 (커피값 : 400) 2000
		 * (자판기 보유 동전이 부족하면 ) 거스름돈이 부족합니다.
		 * 
		 * or
		 * 
		 * 동전을 넣으세요 (커피값 : 400) 3
		 * (커피가 부족하면) 커피가 부족합니다.
		 * (프림이 부족하면) 프림이 부족합니다.
		 * (설탕이 부족하면) 설탕이 부족합니다.
		 * 
		 * ====현재 자판기 정보====
		 * 커피 : 5
		 * 프림 : 7
		 * 설탕 : 1
		 * 자판기 보유 동전 금액 : 900원
		 * 투입한 동전 금액 : 500
		 * ==================
		 */
		//커피 정보
		int price = 400;

		//커피 한잔에 들어갈 양
		int content_coffee = 5;
		int content_cream = 3;
		int content_sugar = 1;

		//커피에 들어갈 재료의 보유량
		int coffee = 10;
		int cream = 10;
		int sugar = 10;

		//투입한 금액이 누적
		int amount = 0;
		//자판기 보유 동전
		int coin = 1000;

		int payment;

		while(true) {
			System.out.println("1 : 커피마시기 2 : 종료");
			int num = input.nextInt();
			if (num == 1) {
				while(true) {
					System.out.print("동전을 투입해주세요 :");
					payment = input.nextInt();
					amount+=payment;
					if(coin<=0) {
						System.out.println("자판기에 거스름돈이 없습니다.");
						break;
					}else{
						if(coffee<=0) {
							System.out.println("자판기에 커피가 없습니다.");
							break;
						}else {
							if(amount > 1000) {
								System.out.println("거스름돈이 부족합니다.");
								amount = 0;
								continue;
							}else if(amount < 400){
								System.out.println("투입 금액이 부족합니다.");
								continue;
							}else {
								System.out.println("거스름 돈 : " + (amount - 400));
								System.out.println("맛있는 커피가완성되었습니다.");
								System.out.println();
								System.out.println("====현재 자판기 정보====");
								System.out.println("==================");
								System.out.printf("커피 = %d%n", (coffee - content_coffee));
								System.out.printf("프림 = %d%n", (cream - content_cream));
								System.out.printf("설탕 = %d%n", (sugar - content_sugar));
								System.out.printf("자판기 보유 동전 = %d%n", (coin - amount));
								System.out.printf("투입한 금액 = %d%n", amount);

								coffee -= content_coffee;
								cream -= content_cream;
								sugar -= content_sugar;
								coin -= amount;
								amount = 0;
								break;
							}
						}
					}
				}
			}else if(num == 2) {
				System.out.println("자판기 종료");
				break;
			}else {
				System.out.println("잘못 입력했습니다.");
			}
		}





		input.close();
	}
}