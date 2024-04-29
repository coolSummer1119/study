package kr.s27.object.collection;

import java.util.ArrayList;
//객체 형대로만 넣기만 하면됨.
class A{
	@Override
	public String toString() {
		return "A";//재정의 되면서 주소가 아닌 A로 출력
	}
}
class B{}

public class ArrayListMain01 {
	public static void main(String[] args) {
		ArrayList list = new ArrayList();
		//ArrayList에 객체 저장하기
		list.add(new A());
		list.add(new B());
		list.add("홍길동");
		list.add(10); //int -> integer (auto boxing)
		//다양한 타입을 넣으면 작업의 효율성이 떨어져 한가지 타입으로만 list구성
		
		
		//저장된 요소의 목록
		System.out.println(list);
		//요소의 갯수
		System.out.println(list.size());
	}
}
