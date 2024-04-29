package kr.s26.object.exception;

import java.io.BufferedReader;//두개 모두 세트로 쓰기
import java.io.InputStreamReader;//임마랑
import java.io.IOException;

public class ExceptionMain06_throw {
	/*
	 * throws 예약어의 사용
	 * 메서드에 throws 예외클래스를 명시하면 메서드내에 try~catch 블럭을 생략하고 예외가 발생하면 예외를 임시 보관하고 메서드를 호출하는 곳에 try catch 가 되어있다면
	 * 그 곳으로 예외를 양도함
	 */
	public void printData() throws IOException,NumberFormatException{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));//한 라인으로 입력 받아 string으로 받음
		System.out.println("단 입력:");

		//String -> int 
		int dan = Integer.parseInt(br.readLine()); //한 라인에 입력받은 데이터를 반환 , 꼭 예외 처리해야함 //글자를 숫자로 전환
		System.out.println(dan + "단");
		System.out.println("-------------");
		for (int i =1 ; i <=9 ; i++) {
			System.out.println(dan + "*" + i + "=" + dan*i);
		}
	}

	public static void main(String[] args) {
		ExceptionMain06_throw ex = new ExceptionMain06_throw();
		try {
			ex.printData();			
		}catch(IOException e) {
			System.out.println("입력시 오류 발생");
		}catch(NumberFormatException e) {
			System.out.println("숫자를 입력하세요");
		}
	}
}
