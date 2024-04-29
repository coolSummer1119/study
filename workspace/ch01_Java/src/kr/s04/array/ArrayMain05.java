package kr.s04.array;

public class ArrayMain05 {
	public static void main(String[] args) {
		int[] score = {79,88,91,33,100,55,95};
		int max = score[0];
		int min = score[0];
		
		for(int i =1; i<score.length; i++) { // 0을 이미 사용했기때문에 굳이 0에서 시작할 필요 x
			//최대값 구하기
			if(score[i] > max) {
				max = score[i];
			}
			if(score[i] < min) {
				min = score[i];
			}
		}//end o for
		//최대값과 최소값을 출력
		System.out.println("최대값 : " + max);
		System.out.println("최소값 : " + min);
		
	}//end of main
}//end of class
