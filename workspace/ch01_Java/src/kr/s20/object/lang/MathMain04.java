package kr.s20.object.lang;

import java.util.Arrays;

/*
 * [실습]
 * 로또 프로그랩 제작
 * 길이가 6인 int 형 배열을 생성하고 1 부터 45 숫자 범위로 난수를 구함.
 * 중복되지 않은 6개의 숫잘를 생성해서 배열에 저장하고 출력하시오.
 * 난수 생성 : Math.random()또는 Random 클래스의 nextInt() 메서드 사용
 */
public class MathMain04 {
	public static void main(String[] args) {
		int[] lotto = new int[6];
		
		for(int i = 0; i < lotto.length; i++) {
			double ran = Math.random();
			lotto[i] = (int)(ran*45)+1;
			for (int j = 0; j < i; j++) {//length 를 써버리면 값이 안들어간 함수를 불러와 쓸 수 없. 
				if (lotto[i]==lotto[j]) {
					i--;//중복되면 생성한 난수를 불허 i의 값을 1 줄여서 중복된 값을 제거하고 새로운 값을 저장
					break;
				}
			}
		}
		System.out.println(Arrays.toString(lotto));
		Arrays.sort(lotto);
		for(int num : lotto) {
			System.out.print(num+"\t");//오름차순 정렬
		}
	}
}
