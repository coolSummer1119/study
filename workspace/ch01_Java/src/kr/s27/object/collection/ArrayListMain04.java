package kr.s27.object.collection;

import java.util.ArrayList;
//중복제거
public class ArrayListMain04 {
	public static void main(String[] args) {
		ArrayList<String> list = new ArrayList<String>();
		list.add("고길동");
		list.add("둘리");
		list.add("또치");
		list.add("희동이");
		list.add("고길동");

		//반복문을 이용한 요소의 출력
		for (int i=0; i < list.size(); i++) {
			System.out.println(i+ " : " + list.get(i));
		}
		System.out.println("-------------");
		
		//요소의 삭제
//		list.remove(2);//인덱스
//		중복된 데이터가 있을때는 동시 삭제를 할 수 없고 앞에서부터 삭제함
		list.remove("고길동");
		for (int i=0; i < list.size(); i++) {
			System.out.println(i+ " : " + list.get(i));
		}
		System.out.println("-------------");
		
		ArrayList<Integer> list2 = new ArrayList<Integer>();
		list2.add(13);
		list2.add(78);
		list2.add(4);
		list2.add(13);
		list2.add(28);
		
		for (int i=0; i < list2.size(); i++) {
			System.out.println(i+ " : " + list2	.get(i));
		}
		System.out.println("-------------");
		
		//요소의 삭제
		//list2.remove(2);//인덱스
//		list2.remove((Integer)13); 앞에 형변환 ok
		list2.remove(Integer.valueOf(13));
		
		for (int i=0; i < list2.size(); i++) {
			System.out.println(i+ " : " + list2	.get(i));
		}
		System.out.println("-------------");
		
		//요소의 변경
		       //인덱스 데이터
		list2.set(1, 30);
		
		for (int i=0; i < list2.size(); i++) {
			System.out.println(i+ " : " + list2	.get(i));
		}
		System.out.println("-------------");
	}
}
