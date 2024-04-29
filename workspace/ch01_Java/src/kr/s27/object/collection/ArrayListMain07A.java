package kr.s27.object.collection;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Random;

public class ArrayListMain07A {
	public static void main(String[] args) {
		ArrayList<Integer> list = new ArrayList<Integer>();
		Random ra = new Random();
		
		while(list.size()<6) {
			//난수 발생 (1~45)
			int num = ra.nextInt(45)+1;
			//중복값 체크
			if (!list.contains(num)) {
				list.add(num);
			}
		}//end of while
		
		//오름차순 정렬
		Collections.sort(list);
		for(int num : list ) {
			System.out.println(num + "\t");
		}
	}
}
