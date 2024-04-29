package kr.s17.object.overriding;
import java.util.Scanner;

public class BankMain {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		//일반 계좌 생성
		BankAccount ba = new BankAccount("123-456", "2580", "장하진", 10000L);
		
		//계좌번호 출력
		ba.printAccount();
		//입금하기
		System.out.print("입금 : ");
		long money = input.nextLong();
		ba.deposit(money);
		ba.printAccount();
		
		//출금하기
		System.out.print("출금 : ");
		money = input.nextLong();
		ba.withdraw(money);
		ba.printAccount();
		
		input.close();
	}
}
