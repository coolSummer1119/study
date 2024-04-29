package kr.s20.object.lang;

import java.util.Scanner;


public class MathMain03 {
	/*
	 * [실습]
	 * 가위바위보 게임
	 * 
	 * [입력 예시]
	 * 가위바위보 입력 (0 가위 1바위 2 보) :1
	 * 
	 * [출력 예시]
	 * ->컴퓨터 : 가위, 사람 : 바위 
	 * 결과 : 사람 승
	 */
	public static void main(String[] args) {
		String[] item = {"가위","바위","보"};
        //  0    1    2
		Scanner input = new Scanner(System.in);
		while(true) {
			System.out.println("-----------------");
			System.out.println("메뉴>1.게임하기 2.종료하기");
			System.out.println("-----------------");
			System.out.print("메뉴>");
			int num = input.nextInt();
			
			if (num == 1) {
				System.out.print("가위바위보 입력(0.가위,1.바위,2.보)");
				int user = input.nextInt();
				double ran = Math.random();
				int com = (int)(ran*3);
				
				System.out.println("컴퓨터 :" + item[com] + " 사람 :" + item[user]);
				if (user == com) {//무승부 나는 경우	
					System.out.println("결과 : 무승부");
				}else if ((user == 0 && com==1) || (user ==1 && com == 2)||(user ==2 &&com==0)){//사람이 지는 경우의 수 or com - user = 1 || com - user = -1
					System.out.println("결과 : 사람 패");
				}else {//사람이 이기는 경우의 수
					System.out.println("결과 : 사람 승");
				}
			}else if(num==2) {
				System.out.println("프로그램 종료");
				break;
			}else {
				System.out.println("잘못입력했습니다.");
			}
		}
		
		input.close();
	}
}
