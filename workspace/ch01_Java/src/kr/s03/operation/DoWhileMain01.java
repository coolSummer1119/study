package kr.s03.operation;

public class DoWhileMain01 {
	public static void main(String[] args) {
		int su = 0;
		String str = "hello world";
		
		//선 처리, 후 비교
		do {
			System.out.println(str);
		}while(su++<5);
		System.out.println("---------------");
		
		//선 비교 후 처리
		
		int su2 = 0;
		while(su2++<5) {
			System.out.println(str);
		}
	}
}
