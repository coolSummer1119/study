package kr.s27.object.collection;

import java.util.Stack;

public class StackMain {
	public static void main(String[] args) {
		//스텍 (Stack) : 후입선출LIFO (last - In First - Out)방식
		String[] array = {"진달래","백합","개나리","벚꽃","장미"};
		
		Stack<String> stk = new Stack<String>();
		//반복문을 이용해서 Stack에 요소 저장
		for(int i = 0; i<array.length;i++) {
			stk.push(array[i]);//객체 저장
		}
		
		//저장된 용소의 목록
		System.out.println(stk);
		System.out.println("--------------------");
		
		while(!stk.isEmpty()) {
							//스텍에 저장된 객체를 꺼내온다
			System.out.print(stk.pop() + "\t");
		}
		System.out.println("\n-----------------");
		
		System.out.println(stk);
	}
}
