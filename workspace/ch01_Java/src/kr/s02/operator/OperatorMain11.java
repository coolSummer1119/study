package kr.s02.operator;

public class OperatorMain11 {
	public static void main(String[] args) {
		char ch = 'b';
		String str; //대문자일지 판단할 결과를 저장할 문자열 변수 선언
		
		str = ch >= 'A' && ch <= 'Z' ? "대문자" : "소문자";
		System.out.println(ch + " => " + str );
		
	}
}
