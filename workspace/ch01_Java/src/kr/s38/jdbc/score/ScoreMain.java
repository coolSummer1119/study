package kr.s38.jdbc.score;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class ScoreMain {
	private BufferedReader br;
	private ScoreDAO dao;
	//생성자
	public ScoreMain() {
		try {
			br = new BufferedReader(new InputStreamReader(System.in));
			dao = new ScoreDAO();
			
			callMenu();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(br!=null)try {br.close();}catch(IOException e) {}
		}
	}
	//메뉴
	public void callMenu()throws IOException {
		while(true) {
			System.out.print("1.입력,2.목록,3.상세정보,4.수정,5.삭제,6.종료>");
			try {
				int no = Integer.parseInt(br.readLine());
				if(no==1) {
					int korean,english,math;
					System.out.print("이름:");
					String name = br.readLine();
					while(true) {
						System.out.print("국어:");
						korean = Integer.parseInt(br.readLine());
						if(korean >100) {
							System.out.println("성적은 100이하로 입력해주십시오.");
						}else if (korean <0) {
							System.out.println("성적은 0이상 입력해주십시오.");
						}else {
							break;
						}
					}
					
					while(true) {
						System.out.print("영어:");
						english = Integer.parseInt(br.readLine());
						if(english >100) {
							System.out.println("성적은 100이하로 입력해주십시오.");
						}else if (english <0) {
							System.out.println("성적은 0이상 입력해주십시오.");
						}else {
							break;
						}
					}
					
					while(true) {
						System.out.print("수학:");
						math = Integer.parseInt(br.readLine());
						if(math >100) {
							System.out.println("성적은 100이하로 입력해주십시오.");
						}else if (math <0) {
							System.out.println("성적은 0이상 입력해주십시오.");
						}else {
							break;
						}
					}
					
					int sum = korean+english+math;
					
					int avg = sum/3;
					
					String grade;
					switch (avg/10) {
					case 10:
					case 9:
						grade = "A";break;
					case 8:
						grade = "B";break;
					case 7:
						grade = "C";break;
					case 6:
						grade = "D";break;
					default :
						grade = "F";break;
					}
					
					
					dao.insertScore(name, korean, english, math, sum, avg, grade);
					
				}else if(no==2) {//목록
					dao.selectScore();
				}else if(no==3) {//상세정보
					
					dao.selectScore();
					
					System.out.print("상세정보를 확인할 학생 번호 :");
					int num = Integer.parseInt(br.readLine());
					
					dao.selectDetailScore(num);
				}else if(no==4) {//수정
					System.out.print("수정할 성적정보의 번호:");
					int num = Integer.parseInt(br.readLine());
					
					int korean,english,math;
					System.out.print("이름:");
					String name = br.readLine();
					while(true) {
						System.out.print("국어:");
						korean = Integer.parseInt(br.readLine());
						if(korean >100) {
							System.out.println("성적은 100이하로 입력해주십시오.");
						}else if (korean <0) {
							System.out.println("성적은 0이상 입력해주십시오.");
						}else {
							break;
						}
					}
					
					while(true) {
						System.out.print("영어:");
						english = Integer.parseInt(br.readLine());
						if(english >100) {
							System.out.println("성적은 100이하로 입력해주십시오.");
						}else if (english <0) {
							System.out.println("성적은 0이상 입력해주십시오.");
						}else {
							break;
						}
					}
					
					while(true) {
						System.out.print("수학:");
						math = Integer.parseInt(br.readLine());
						if(math >100) {
							System.out.println("성적은 100이하로 입력해주십시오.");
						}else if (math <0) {
							System.out.println("성적은 0이상 입력해주십시오.");
						}else {
							break;
						}
					}
					
					int sum = korean+english+math;
					
					int avg = sum/3;
					
					String grade;
					switch (avg/10) {
					case 10:
					case 9:
						grade = "A";break;
					case 8:
						grade = "B";break;
					case 7:
						grade = "C";break;
					case 6:
						grade = "D";break;
					default :
						grade = "F";break;
					}
					
					dao.updateScore(num, name, korean, english, math, sum, avg, grade);
				}else if(no==5) {//삭제
					System.out.print("상세정보를 확인할 학생 번호 :");
					int num = Integer.parseInt(br.readLine());
					
					dao.deleteScore(num);
					
				}else if(no==6) {//종료
					System.out.println("프로그램 종료");
					break;
				}else {
					System.out.println("숫자를 잘못 입력했습니다.");
				}
			} catch (NumberFormatException e) {
				// TODO: handle exception
				System.out.println("숫자만 입력 가능");
			}
		}
	}
	public static void main(String[] args) {
		new ScoreMain();
	}
}
