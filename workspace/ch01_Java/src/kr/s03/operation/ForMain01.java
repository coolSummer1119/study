package kr.s03.operation;

public class ForMain01 {
	public static void main(String[] args) {
		//for 반복문
		//      초기식;    조건식;  증감식
		//syso 쓰고 ctrl + space 하면 println나옴
		for(int i = 1 ; i <= 5; i++) {
			System.out.println(i);
		}
		System.out.println("======");
		//수행문이 한줄일 경우 중괄호 블럭 생략 가능.
		for(int k = 1 ; k <=10 ; k++)
			System.out.println(k);
		
		System.out.println("프로그램 끝");
	}
}