package kr.s27.object.collection;

import java.util.ArrayList;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/*
 * [실습]
 * 메뉴 : 1.성적입력,2.성적출력, 3.종료
 * 메서드명 : 메뉴(callMenu) 성적입력 (inputScore) 성적출력 (outputScore)
 * 입력시 조건 체크 : 0부터 100까지만 입력 가능
 */


public class ScoreMain {
	BufferedReader br;
	ArrayList<Score> list;
	
	public ScoreMain() {
		list = new ArrayList<Score>();
		try {
			br = new BufferedReader(new InputStreamReader(System.in));
			callMenu();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (br != null) {try {br.close();}catch(IOException e) {}
			}
		}
	}
	
	
	public void callMenu() throws IOException {
		while(true) {
			try {
				System.out.print("메뉴선택> 1.성적 입력, 2.성적 출력, 3.프로그램 종료");
				int num = Integer.parseInt(br.readLine());
				if(num==1) {
					inputScore();
				}else if (num ==2) {
					outputScore();
				}else if (num ==3) {
					System.out.println("프로그램 종료");
					break;
				}else {
					System.out.println("잘못 입력하였습니다.");
				}
			}catch(NumberFormatException e) {
				System.out.println("숫자를 입력해주십시오.");
			}
		}
	}
	
	public void inputScore() throws IOException{
		Score sc = new Score();
		System.out.print("이름:");
		sc.setName(br.readLine());
		while (true) {
			System.out.print("국어:");
			int k = Integer.parseInt(br.readLine());
			if (k>100 || k<0) {
				System.out.println("점수는 0~100사이 숫자를 넣어야합니다.");
			}else {
				sc.setKorean(k);
				break;
			}
		}
		while (true) {
			System.out.print("영어:");
			int k = Integer.parseInt(br.readLine());
			if (k>100 || k<0) {
				System.out.println("점수는 0~100사이 숫자를 넣어야합니다.");
			}else {
				sc.setEnglish(k);
				break;
			}
		}
		while (true) {
			System.out.print("수학:");
			int k = Integer.parseInt(br.readLine());
			if (k>100 || k<0) {
				System.out.println("점수는 0~100사이 숫자를 넣어야합니다.");
			}else {
				sc.setMath(k);
				break;
			}
		}
		
		list.add(sc);
		
		System.out.println("점수 등록이 1명 완료되었습니다.");
	}
	
	public void outputScore() {
		System.out.println("학생 정보 : 총 " + list.size() + "명");
		System.out.println("이름\t국어\t영어\t수학\t총합\t평균\t등급");
		System.out.println("-------------------------------------------------");

		for(Score k : list) {
			System.out.printf("%s\t",k.getName());
			System.out.printf("%d점\t",k.getKorean());
			System.out.printf("%d점\t",k.getEnglish());
			System.out.printf("%d점\t",k.getMath());
			System.out.printf("%d점\t",k.makeSum());
			System.out.printf("%.1f점\t",k.makeAvg());
			System.out.printf("%s%n",k.makeGrade());
		}			
	}
	
	
	public static void main(String[] args) {
		new ScoreMain();
	}
}
