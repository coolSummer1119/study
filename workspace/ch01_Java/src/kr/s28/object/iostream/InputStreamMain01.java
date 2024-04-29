package kr.s28.object.iostream;

import java.io.IOException;

public class InputStreamMain01 {
	public static void main(String[] args) {
		System.out.println("영문자 1개 입력:");
		try {
			//문자 하나를 입력 받아서 아스키 코드로 반환,한 글자 만! 가능
			int a = System.in.read();
			System.out.println(a + ", " + (char)a);
			
			System.in.read();//enter 처리 \r 13
			System.in.read();//enter 처리 \n 10
			System.out.println("숫자 1개 입력:");
			int b = System.in.read()-48;//enter도 두글자로 되어있어서 13이 출력 
			System.out.println(b);//아스키 코드로 반환
			
			
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
}
