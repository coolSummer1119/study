package kr.s20.object.lang;

public class StringMain05 {
	public static void main(String[] args) {
		/*
		 * [실습]
		 * 아래 문자열의 대문자 > 소문자, 소문자 > 대문자
		 */
		String str = "abcMDye-4W?EWzz";
		String result = "";
		
		for (int i=0; i<str.length(); i++) {
			char a = str.charAt(i);
			if (a<=122 && 97<=a) {//소문자
				//char->String  대문자로 변환
				result += String.valueOf(a).toUpperCase();//*********
			}else if (a<=90 && 65<=a) {//대문자
				//char->String  소문자로 변환
				result += String.valueOf(a).toLowerCase();
			}else {//특수문자 및 숫자
				result += a;
			}
		}
		System.out.println(result);
		System.out.println("--------------------");
		
		String result2 = "";
		//              String->char[] 배열로 전환 charAt과 동일
		for(char c : str.toCharArray()) {
				//대문자라면 true
			if(Character.isUpperCase(c)) {
				result2 += Character.toLowerCase(c);//소문자로 변환
				//소문자라면 true
			}else if(Character.isLowerCase(c)) {
				result2 += Character.toUpperCase(c);//대문자로 변환
			}else {
				result2 += c;
			}
		}
		System.out.println(result2);
		System.out.println("--------------------");
		
		String result3 = "";
		
		for (int i=0; i<str.length(); i++) {
			char c = str.charAt(i);
			if(c>=65&&c<=90) {
				result3 += (char)(c+32); //형변환
			}else if (c>=97 && c<=122) {
				result3 += (char)(c-32);
			}else {
				result3 += c;
			}
		}
		System.out.println(result3);
	}
}
