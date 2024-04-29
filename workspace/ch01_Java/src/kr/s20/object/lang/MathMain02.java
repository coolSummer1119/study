package kr.s20.object.lang;

import java.util.Random;

public class MathMain02 {
	public static void main(String[] args) {
		String[] gift = {"스마트폰", "TV", "냉장고","꽝!"};
		                  // 0     1      2     3 
		//난수 발생 : 0~1 미만의 실수 ( 1이 안됨)
		double ran = Math.random();
		System.out.println("발생한 난수 : " + ran);
		int index = (int)(ran*4); //0~3범위의 난수
		System.out.println("정수로 변환한 난수 :" + index);
		System.out.println("오늘의 선물 : " + gift[index]);
		
		System.out.println("---------------");
		
		String[] luck = {"귀인을 만남", "해외 여행을 떠남", "로또 당첨", "피곤"};
		
		Random r1 = new Random();
		//0부터 인자로 전달된 값의 전까지의 범위로 난수 발생 0~3
		index = r1.nextInt(4); // 0~3설정
		System.out.println("발생한 난수 : "+ index);
		System.out.println("운세 : " + luck[index]);
	}
}