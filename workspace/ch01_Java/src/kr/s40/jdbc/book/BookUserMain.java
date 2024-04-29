package kr.s40.jdbc.book;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;


public class BookUserMain {
	private BufferedReader br;
	private BookDAO dao;
	private BookAdminMain bam;
	private String me_id; //로그인한 회원 아이디
	private boolean login; //로그인 여부 (로그인 true,로그아웃 false)

	//생성자
	public BookUserMain(){
		try {
			br = new BufferedReader(new InputStreamReader(System.in));
			dao = new BookDAO();

			callMenu();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(br!=null)try {br.close();}catch(IOException e) {}
		}
	}

	//메뉴
	public void callMenu() throws IOException{
		//로그인 체크
		while(true) {
			System.out.print("1.로그인,2.회원가입,3.종료>");
			try {
				int no = Integer.parseInt(br.readLine());
				if (no==1) {//로그인
					System.out.print("아이디:");
					me_id = br.readLine();

					System.out.print("비밀번호:");
					String me_passwd=br.readLine();

					if(me_id.equals("9999") && me_passwd.equals("9999")) {
						System.out.println("관리자 계정으로 접속하였습니다.");
						if (bam == null) {
							bam = new BookAdminMain();
							break;
						}
					}

					login = dao.loginCheck(me_id, me_passwd);
					if(login) {
						System.out.println(me_id+"님이 로그인 되었습니다.");
						break;
					}
					System.out.println("아이디 또는 비밀번호가 일치하지 않습니다.");
				}else if(no==2) {//회원가입
					System.out.print("아이디:");
					String me_id = br.readLine();
					//아이디 중복 체크
					int check = dao.checkId(me_id);
					if(check>=1) {//1:중복,2:오류
						System.out.println("아이디가 중복되었습니다,");
					}else {//0 : 미중복
						//비밀번호,이름,전화번호 입력 intsertMember 호출
						System.out.println("아이디 사용 가능!");
						System.out.print("비밀번호:");
						String me_passwd = br.readLine();
						System.out.print("이름:");
						String me_name = br.readLine();
						System.out.print("전화번호:");
						String me_phone= br.readLine();

						dao.insertMember(me_id, me_passwd, me_name, me_phone);
					}
				}else if(no==3) {//종료
					System.out.println("프로그램 종료");break;
				}else {
					System.out.println("잘못 입력 했습니다.");
				}

			} catch (NumberFormatException e) {
				System.out.println("숫자만 입력 가능!");
			}
		}
		//로그인 체크 후 메뉴
		while(login) {
			System.out.println("1.도서대출,2.MY대출 목록,3.대출 도서 반납,4.종료:");
			try {
				int no = Integer.parseInt(br.readLine());

				if(no==1) {//도서 대출
					dao.selectListBook();
					System.out.print("대출할 책 번호:");
					int bk_num = Integer.parseInt(br.readLine());
					int count = dao.getStatusReservation(bk_num);
					if(count == 0) {
						dao.insertReservation(bk_num, me_id);
					}else {
						while(true) {
							System.out.println("대출 예약을 하시겠습니까?");
							System.out.print("1.Y,2.N >");
							int k = Integer.parseInt(br.readLine());
							if(k==1) {
								dao.insertWaiting(bk_num, bk_num, me_id);
								break;
							}else if(k==2) {
								System.out.println("대출 예약을 하지 않았습니다.");
								break;
							}else {
								System.out.println("다시 입력해 주십시오.");
							}

						}
					}
				}else if(no==2) {//my대출 목록
					dao.selectMyList(me_id);
				}else if(no==3) {//대출 도서 반납
					dao.selectMyList(me_id);
					System.out.print("반납할 대출 번호:");
					int re_num = Integer.parseInt(br.readLine());
					int count = dao.getStatusBack(re_num, me_id);
					if(count == 0) {
						dao.updateReservation(re_num);
					}
				}else if(no==4) {//종료
					System.out.println("프로그램 종료");break;
				}else {
					System.out.println("잘못 입력 했습니다.");
				}
			} catch (NumberFormatException e) {
				System.out.println("숫자만 입력 가능!");
			}
		}
	}

	public static void main(String[] args) {
		new BookUserMain();
	}
}
