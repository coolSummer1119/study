package kr.s04.array;

public class ArrayMain01 {
	public static void main(String[] args) {
		//배열 선언
		//  ↓배열의 자료형 , 배열의 요소
		char[] ch;
		//배열 생성
		            //↓배열의 길이 , 방갯수
		ch = new char[4];
		//배열 초기화 (방번호) 늘 **0번** 방부터 시작
		ch[0] = 'J';
		ch[1] = 'a';
		ch[2] = 'v';
		ch[3] = 'a';
		
		
		System.out.println(ch[0]);
		System.out.println(ch[1]);
		System.out.println(ch[2]);
		System.out.println(ch[3]);
		
		//반복문을 이용한 배열의 요소 출력
		//                    ↓배열의 길이를 모를 때 배열의 길이를 의미
		for (int i = 0 ; i < ch.length ; i++) {
			System.out.println("ch["+ i +"] :" +ch[i]);
		}
		
		//배열의 선언 및 생성
		int[] it = new int[6];
		
		//배열의 선언 및 생성(명시적 배열 생성), 초기화
		char[] ch2 = new char[] {'J','a','v','a'};
		
		
		//배열의 선언 및 생성(암시적 배열 생성), 초기화
		char[] ch3 = {'자','바'};
		
		
	}
}
