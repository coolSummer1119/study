package kr.s01.basic;

public class VariableTypeMain02 {
	public static void main(String[] args) {
		//확장 특수 출력 문자 (escape sequence)
		char single = '\'';// 역슬레시를 통해 특수문자'를 일반문자로 전환
		System.out.println(single);
		
		String str = "\"오늘은 \'월요일\' 입니다.\"";
		System.out.println(str);
		
		String str2 = "오늘은 '월요일' 입니다.";//여기선 큰 문자열이 있기 때문에 자동으로 문자열로 인식
		System.out.println(str2);
		
		String str3 = "C:\\javaWork\\workspace"; // 역슬레시를 표현하기 위해서는 2번 치기
		System.out.println(str3);
		
		String slash = "\\\\\\\\\\"; //  ///// 출력
		System.out.println(slash);
		
		String str4 = "오늘은 월요일 \n내일은 화요일"; //줄바꿈
		System.out.println(str4);
		
		String str5 ="이름\t나이\t취미"; //tab효과
		System.out.println(str5);
		
		
		
	}
}
