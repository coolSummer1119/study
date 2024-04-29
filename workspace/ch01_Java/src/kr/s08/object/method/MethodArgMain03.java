package kr.s08.object.method;
/*
 * Variable Arguments (가변 인자)
 * 자료형이 일치할 때 전달하고자 하는 값의 개수를 다르게 지정할 수 있음
 * 전달되는 데이터는 내부적으로 배열로 인식함.
 * public 앞에 접근 지정자를 붙이지 않음
 */
public class MethodArgMain03 {
	public void argTest(int ... n) {//n 이 배열을 가르키는 배열 명이 됨. "..."의 의미는 가변	
		for(int i =0 ; i < n.length; i++) {
			System.out.println("n["+ i + "] : "+ n[i]);
		}
		System.out.println("-----------");
	}
	public static void main(String[] args) {
		MethodArgMain03 ma = new MethodArgMain03();
		ma.argTest(); //length가 0 일명 빈배열
		ma.argTest(1); // 자료형이 일치하지 않는다면 오류 발생.
		ma.argTest(10,20,30);
	}
}
