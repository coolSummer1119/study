package kr.s20.object.lang;

public class StringMain02 {
	public static void main(String[] args) {
		//문자 추출
		String s1 = "Kwon Sun Ae";
		//           012345678910, 길이 = 11
		int index = s1.indexOf('n');
		System.out.println("맨 처음 문자 n의 위치 : " + index);
		
		index = s1.indexOf("Sun");
		System.out.println("문자 Sun의 위치 : " + index);
		
		index = s1.lastIndexOf('n');
		System.out.println("마지막 문자 n의 위치 : " + index);
		
		char c = s1.charAt(index);
		System.out.println("지정한 인덱스의 문자 추출 : " + c);
		
		index = s1.indexOf('S');
		String str = s1.substring(index);//문자열 추출
		System.out.println("지정한 부분부터 끝까지 잘라내기 : " + str);
		
		str = s1.substring(index, index+3);//5,8지정
		System.out.println("인덱스 5부터 8전까지 문자열 추출 : " + str);
		
		int length = s1.length();
		System.out.println("문자열의 길이 : " + length);
		
		//구분자를 이용해서 문자열 잘라내기
		String[] array = s1.split(" ");
		for (int i = 0; i < array.length; i++) {
			System.out.println("array[" + i + "] : " + array[i]);
		}
		
	}
}
