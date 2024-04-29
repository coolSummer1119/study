package kr.s03.operation;

public class IfMain07 {
	public static void main(String[] orgs) {
		/*
		 * [실습]
		 * 생년월일을 입력하고 만 나이를 출력하는 프로그램을 작성하시오.
		 * 만 나이 = (현재 연도 - 태어난 연도) - (생일이 지났으면 0,생일이 지나지 않았으면 -1)
		 * 
		 * [입력 방식]
		 * 출생 연도 입력 :
		 * 월 입력 :
		 * 일 입력 :
		 * [출력 방식]
		 * 만 나이는 --세 입니다.
		 * 
		 * 현재 날짜 정보 240220
		 */
		java.util.Scanner input = new java.util.Scanner(System.in);
		//현재 날짜 정보
		int nowYear = 2024;
		int nowMonth = 2;
		int nowDay = 20;
		
		System.out.print("출생 연도 입력:");
		int birthYear = input.nextInt();
		System.out.print("출생 달 입력:");
		int birthMonth = input.nextInt();
		System.out.print("출생 일 입력:");
		int birthDay = input.nextInt();
		
		int age = nowYear - birthYear; // 1차적인 나이 계산
		
		if (birthMonth <= nowMonth) // 중괄호 생략, 현재 월보다 출생 월이 작거나 같을 경우 아래 코드 실행
			age = birthDay <= nowDay ? age : --age; // 현재 일보다 출생 일이 작을경우 age에서 1 빼기, 그 외에는 그냥 age , --age > age -=1
		
		/*
		if (nowMonth < birthMonth) {
			age--;
		}else if(nowMonth == birthMonth && nowDay < birthDay) {
			age--;
		}*/
		
		//연산자 활용
		/*
		if(nowMonth < birthMonth ||(nowMonth==birthMonth && nowDay < birthDay)) {
			age--;
		} 앞부분이 true여야만 다음단계로 넘어가는 것을 이용
		*/
		
		System.out.printf("만 나이는 %d세 입니다.", age);
		input.close();
	}
}
