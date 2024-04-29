package kr.s12.object.constructor;

public class AccountMain {

	String accountNo;//계좌번호
	String name; //예금주
	int balance; //잔고

	//생성자
	public AccountMain(String a, String o, int b) {
		accountNo = a;
		name = o;
		balance = b;
		System.out.println(name + "님 계좌가 생성되었습니다.");
	}

	//예금하기
	public void deposit(int amount) {
		if (amount <= 0) {
			System.out.println("0보다 크게 입력해야합니다.");
			//void 형 메서드에서 특정 조건일 떄 메서드를 빠져나감. (switch 에서 break 같은 느낌)
			return;//else 꼭 빼기 (이중작업) 반복문에서는 return
		}
		balance += amount;
		System.out.println("입금이 완료되었습니다.");
	}
	//출금하기
	public void withdraw(int amount) {
		if (amount <= 0) {
			System.out.println("0보다 크게 입력해야 합니다.");
			return;
		}
		if (balance < amount) {
			System.out.println("잔고가 부족합니다.");
			return;
		}
		balance -= amount;
		System.out.println("출금이 완료되었습니다.");
	}


	public static void main(String[] args) {
		AccountMain account1 = new AccountMain("072702-04-050590", "윤시원", 10000);
		System.out.println("계좌 번호 : " + account1.accountNo);
		System.out.println("예금 주 : " + account1.name);
		System.out.printf("잔고 : %d원%n", account1.balance);
		System.out.println("-------------------------");
		
		//예금 하기
		account1.deposit(5000);
		
		//출금 하기
		account1.withdraw(15000);
		
		System.out.println("계좌 번호 : " + account1.accountNo);
		System.out.println("예금 주 : " + account1.name);
		System.out.printf("잔고 : %d원%n", account1.balance);
		
	}
}
