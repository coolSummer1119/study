package kr.s27.object.collection;

/*
 * [실습]
 * 로또 프로그램 제작
 * 1~45까지 중복되지 않는 6개의 숫자를 구해서 ArrayList에 저장하고 출력하시오
 * 출력할 때는 오름차순 정렬하여 출력하시오.
 * 난수생성 :Math.random(), Random클래스의 nextInt()메서드 사용
 */
import java.util.ArrayList;
import java.util.Collections;


public class ArrayListMain07 {
	public static void main(String[] args) {
		ArrayList<Integer> list = new ArrayList<Integer>();

		for (int i = 0; i<6; i++) {
			double ran = Math.random();
			int num = (int)(ran*45);
			if(list.contains(num)) {
				i--;
			}
			list.add(num + 1);
		}
		Collections.sort(list);
		System.out.println(list);
	}
}
