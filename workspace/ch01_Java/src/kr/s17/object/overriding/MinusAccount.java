package kr.s17.object.overriding;
/*
 * [실습]
 * 1. 한도를 의미하는 minusLimit 멤버변수 정의
 * 2. BankAccount를 상속 받는다.
 * 3. 생성자에서 number, password, name, balance, minusLimit를 전달 받아서 멤버변수에 저장
 * 4. withdraw, printAccount 메서드 재정의
 * 5. BankMain2에서 정상 작동하는지 확인
 */


public class MinusAccount extends BankAccount {
	private long minusLimit;
	public MinusAccount(String number, String password, String name, long balance, long minusLimit) {
		super(number, password, name, balance);
		this.minusLimit = minusLimit;
	}
	@Override
	public void withdraw(long amount) {
		if (amount > minusLimit + balance) {
			System.out.println("한도초과로 출금할 수 없습니다.");
			return ;
			}
		balance-=amount;
		System.out.printf("%,d원이 출금되었습니다.%n", amount);
	}

	@Override
	public void printAccount() {
		System.out.println("(마이너스)계좌번호 : " + name);
		System.out.println("비밀번호 : " + password);
		System.out.println("예금주 : " + name);
		System.out.printf("계좌잔액 : %,d원%n", balance);
		System.out.printf("한도액 : %,d원%n", minusLimit);
		System.out.println("-------------------------");
	}




}
