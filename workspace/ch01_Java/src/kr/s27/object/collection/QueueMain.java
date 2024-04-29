package kr.s27.object.collection;

import java.util.LinkedList;

public class QueueMain {
	public static void main(String[] args) {
		//큐(Queue):선입선출 FIFO(First-In First-Out)방식
		String[] array = {"서울","부산","대구","광주","인천"};
		
		LinkedList<String> ll = new LinkedList<String>();
		for(int i = 0; i < array.length; i++) {
			//LinkedList 에 요소를 저장
			ll.offer(array[i]);
		}
		//저장된 요소의 목록
		System.out.println(ll);
		System.out.println("------------------");
		
		while(ll.peek() != null) {//큐에 저장된 첫번째 요소를 검색
			System.out.print(ll.poll()+"\t");//큐에 저장된 첫번째 요소를 반환하고 제거
		}
		System.out.println("\n-------------------");
		System.out.println(ll);//<<비어있음
	}
}
