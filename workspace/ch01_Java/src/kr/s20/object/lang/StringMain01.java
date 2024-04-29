package kr.s20.object.lang;
//문자열 -명시적 객체 ex_ String s = new String("하늘"); 서로 다른 하늘
//문자열 -암시적 객체 ex_ String s2 = "바다"; 같은 하늘


public class StringMain01 {
	public static void main(String[] args) {
		//암시적 문자열 생성
		//같은 문자열을 사용할 경우 객체를 공유
		String str1 = "abc";
		String str2 = "abc";
		//명시적 문자열 생성
		//같은 문자열이더라도 개별 객체생성
		String str3 = new String("abc");
		String str4 = new String("abc");

		//객체 비교
		if (str1 == str2) {
			System.out.println("str1과 str2는 같은 객체");
		}else {
			System.out.println("str1과 str2는 다른 객체");
		}
		System.out.println("-------------------");

		if (str3 == str4) {
			System.out.println("str1과 str2는 같은 객체");
		}else {
			System.out.println("str1과 str2는 다른 객체");
		}
		//문자열 비교
		if(str1.equals(str2)) {
			System.out.println("내용이 같다");
		}else {
			System.out.println("다르다");
		}
		if(str3.equals(str4)) {
			System.out.println("내용이 같다");
		}else {
			System.out.println("다르다");
		}
		
		System.out.println("--------------");
		String str5 = "bus";
		String str6 = "Bus";
		
		//대소문자 구분하지 않고 문자열을 비교
		if(str5.equalsIgnoreCase(str6)){
			System.out.println("[대소문자 구분없이 비교] str5와 str6의 내용이 같다.");
		}else {
			System.out.println("[대소문자 구분없이 비교] str5와 str6의 내용이 다르다.");
		}
		
	}
}
