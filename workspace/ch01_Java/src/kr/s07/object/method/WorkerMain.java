package kr.s07.object.method;
/*
 * [실습]
 * Worker
 * 1) 멤버 변수 : 직원이름 (name), 급여 (money), 계좌 잔고 (balance)
 * 2) 멤버 메소드 : work(실행하면 money에 1000원 누적) deposite(실행하면 money의 돈을 balance에 누적시키고 money
 *              0처리
 * WorkerMain
 * 1)Worker 객체 생성
 * 2)직원 이름 지정
 * 3)10번 일하는데 번 돈이 3000원일 때마다 계좌에 저축
 * 4)직원 이름 , 현재 계좌에 입금되지 않고 남아있는 급여(money), 계좌잔고(balance)
 * 
 */
class Worker{
	String name;
	int money;
	int balance;
	
	public int work() {
		return money += 1000;
	}
	
	public int deposite() {
		money = 0;
		return balance+=3000;
	}
	
	public void infoWorker(){
		System.out.println("직원 이름 : " + name);
		System.out.println("현금 : " + money);
		System.out.println("계좌 잔고 : " + balance);
	}
}

public class WorkerMain {
	public static void main(String[] args) {
		java.util.Scanner input = new java.util.Scanner(System.in);
		Worker a = new Worker();
		System.out.print("직원의 이름 :");
		a.name = input.nextLine();
		
		System.out.print("일 한 횟수 : ");
		int x = input.nextInt();
		for (int i = 1 ; i <= x ; i++) { // i == x로 설정할 경우 1234...x이전까지 false가 되기 때문에 루프 자체가 돌지 못함
			a.work();
			if (i % 3 == 0) {
				a.deposite();
			}
		}
		
		a.infoWorker();
		
		
		input.close();
	}
}
