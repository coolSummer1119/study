package kr.s27.object.collection;

import java.util.ArrayList;
import java.util.Collections;

public class ArrayListMain06 {
	public static void main(String[] args) {
		ArrayList<String> list = new ArrayList<String>();
		list.add("머루");
		list.add("사과");
		list.add("오디");
		list.add("자두");
		list.add("사과");
		
		//인덱스 탐색
		int index1 = list.indexOf("사과");
		System.out.println("첫 번째 사과 : " + index1);
		
		int index2 = list.lastIndexOf("사과");
		System.out.println("마지막 사과 : " + index2);

		int index3 = list.indexOf("망고");
		System.out.println("망고 : " + index3);//없는 경우에는 -1 출력

		boolean f1 = list.contains("오디");//오디가 있는지 검색
		System.out.println("오디 : " + f1);
		
		boolean f2 = list.contains("바나나");//오디가 있는지 검색
		System.out.println("바나나 : " + f2);
		
		//요소의 목록 출력
		System.out.println(list);
		System.out.println("--------------------");
		
		//정렬(사전(진짜 사전임 ㅋㅋ ㄱㄴㄷㄹ 처럼)에 명시된 순서대로)
		Collections.sort(list);
		
		System.out.println(list);
		
		//역순
		Collections.reverse(list);
		System.out.println(list);
		System.out.println("---------------");
		
		ArrayList<Integer> list2 = new ArrayList<Integer>();
		list2.add(10);
		list2.add(100);
		list2.add(15);
		list2.add(2);
		list2.add(40);

		System.out.println(list2);
		
		//정렬(오름차순)
		Collections.sort(list2);
		System.out.println(list2);
		
		//역순(내림차순)
		Collections.reverse(list2);
		System.out.println(list2);

	
	}
}
