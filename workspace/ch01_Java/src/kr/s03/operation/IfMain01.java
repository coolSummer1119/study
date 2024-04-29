package kr.s03.operation;

public class IfMain01 {
	public static void main(String[] args) {
		System.out.println("===단일IF문===");
		int n = 4;

		//단일 if문 : 조건이 true 이면 if 블럭안의 수행문을 실행

		//  조건 을 만족시 if문 시작


		if(n > 5) {//if문 시작
			System.out.println("n은 5보다 크다.");
		}//if문 끝
		System.out.println("--------------");

		//if문 블럭 내의 수행문이 ***한 줄***만 {}블럭을 행략할 수 있음
		if (n<5) 
			System.out.println("~~~~~~~~~~~");



		System.out.println("프로그램 종료!");
	}
}
