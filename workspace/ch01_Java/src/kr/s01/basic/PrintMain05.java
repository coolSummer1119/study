package kr.s01.basic;

public class PrintMain05 {
	public static void main(String[] args) {
		//printf (포맷문자, 데이터)를 이용한 출력
		//데이터의 종류를 표시할 수 있는 포맷문자 지원
		
		
		//문자
		                //포맷문자 전달될 데이터
		System.out.printf("%c", 'A'); //결과적으로는 문자열로 출력 , 문자는 꼭 %c
		System.out.printf("%c%n", 'A'); //엔터 하나 들이기 - %n
		System.out.printf("%c%n", 'B'); 
		System.out.printf("%6c%n", 'C'); // 여섯 칸을 확보 후 오른쪽 정렬 
		System.out.printf("%-6c%n", 'C'); // 여섯 칸을 확보 후 왼쪽 정렬
		
		System.out.println("============");
		
		//정수
		System.out.printf("%d%n", 67); //67
		System.out.printf("%,d%n", 100000);	// 100,000 쉽표 삽입으로 세 자리마다 끊어줌
		System.out.printf("%5d%n", 20); // 다섯 칸을 확보 후 오른쪽 정렬
		System.out.printf("%-5d%n", 30); // 다섯 칸을 확보 후 오른쪽 정렬
		
		System.out.println("============");
		
		//실수
		System.out.printf("%f%n", 35.896); // 기본으로 6 자리까지 확보 후 빈 자리는 0으로 채우기
		System.out.printf("%.2f%n", 35.896); // .2가 소숫점 2번째 자리까지만 표기를 의미 (세번째자리는 반올림)
		System.out.printf("%10.2f%n", 35.896); // 열 칸을 확보 후 소숫점 2번째 자리까지 표기, 오른쪽 정렬 (나머지는 반올림)
		
		System.out.println("============");
		
		//문자열
		System.out.printf("%s%n", "바다");
		System.out.printf("%6s%n", "우주"); // 여섯 칸을 확보 후 오른쪽 정렬
		System.out.printf("%-6s%n", "구름"); // 여섯 칸을 확보 후 왼쪽 정렬
		System.out.printf("%-6.4s%n", "구름"); // 위와 같음..?
		
		System.out.println("============");
		
		//논리값
		System.out.printf("%b%n", true);
		
		
		//데이터의 종류가 여러개일 경우
		System.out.printf("%s는 %d점 입니다.%n", "점수",98);
		System.out.printf("중간고사 성적은 총점 %d점,%n평균 %d점 입니다.%n", 285, 95);
		
		//System.out.print("%c"); // %6으로 출력 왜인지 모름... 선언과는 다른 개념... 괄호 안에서만 순서대로 들어가는 듯
	}

}
