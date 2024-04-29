package kr.s21.object.util;

import java.util.StringTokenizer;

public class StringTokenrizerMain01 {
	public static void main(String[] args) {
		String source = "100,200,300,400";
		StringTokenizer st = new StringTokenizer(source, ",");
		
		//구분자를 통해서 잘려진 문자열이 있는지 검증
		while(st.hasMoreTokens()) {
			System.out.println(st.nextToken());//잘려진 토큰 반환
		}
	}
}