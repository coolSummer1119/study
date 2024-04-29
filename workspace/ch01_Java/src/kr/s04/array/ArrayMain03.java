package kr.s04.array;

public class ArrayMain03 {
	public static void main(String[] args) {
		//배열 선언 및 생성 (암시적 배열 생성), 초기화
		// ↓배열의 자료형
		int[] array = {10,20,30,40,50};
		
		//반복문을 이용한 배열의 요소 출력
		for(int i=0; i <array.length; i++) {
			System.out.print(array[i] + "\t");
		}
		System.out.println("\n-------------");
		
		//확장 for 문을 이용한 배열의 요소 출력
		//배열 명을 통해서 배열에 들어감
		for(int num : array) {//인덱스로 받는게 아니고 데이터로 직접 받음
			System.out.print(num + "\t");
		}
	}
}
