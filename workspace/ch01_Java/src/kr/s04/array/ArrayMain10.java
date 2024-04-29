package kr.s04.array;

public class ArrayMain10 {
	public static void main(String[] args) {
		/*
		 * [실습]
		 * 1) 10 20 30 40 50을 초기 값으로 갖는 1차원 배열을 test 이름으로 
		 * 선언 생성 초기화 하시오.
		 * 2) 반복문을 이용해서 출력하시오.
		 * 3) 확장 for 문을 이용해 출력하시오.
		 * 4) 인덱스 3의 데이터를 100으로 변경하시오.
		 * 5) 마지막 요소의 값을 200으로 변경하시오.
		 * 6) 반복문을 사용하여 모든 요소의 값을 0으로 초기화
		 * 7) 홀수 인덱스에 10 짝수 인덱스에 20 저장
		 * 8) 모든 요소의 총합과 평균 ( 총합을 요소의 수로 나누기)을 구하고 출력
		 * 총합 변수 sum 평균 변수 avg
		 */
		int[] test = new int[]{10, 20, 30, 40, 50};//1
		
		for (int i = 0; i < test.length; i++) {//2
			System.out.println(test[i]);
		}
		System.out.println("====================");
		
		for (int k : test) {//3
			System.out.println(k);
		}
		System.out.println("====================");
		test[3] = 100;//4
		//test[4] = 200;
		test[test.length-1] =200;//5
		
		System.out.println(test[3]); 
		System.out.println(test[4]); 
		
		System.out.println("====================");		
		for(int i = 0; i < test.length; i++) {//6
			test[i]=0;
			System.out.println(test[i]);
		}
		
		System.out.println("====================");		
		for(int i = 0; i < test.length; i++) {//7
			if(i%2==0) {
				test[i]=20;
			}else {
				test[i]=10;
			}
			System.out.println(test[i]);
		}
		
		System.out.println("====================");		
		int sum;//8
		float avg;
		sum=0;
		
		for(int i = 0 ; i < test.length; i++) {
			sum +=test[i];	
		}
		System.out.println("총합은 " + sum);
		avg = (float)sum / test.length;
		System.out.printf("평균은 %.2f", avg);
	}
}
