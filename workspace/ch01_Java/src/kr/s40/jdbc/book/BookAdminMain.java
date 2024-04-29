package kr.s40.jdbc.book;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class BookAdminMain {
	//메뉴 : 1.도서 등록,2.도서 목록,3.회원 목록,4.대출 목록,5.종료
	private BufferedReader br;
	private BookDAO dao;

	public BookAdminMain() {
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

	public void callMenu()throws IOException {
		try {
			while(true) {
				System.out.print("1.도서 등록,2.도서 정리,3.도서 목록,4.회원 목록보기,5.대출 목록,6.종료>");
				int no = Integer.parseInt(br.readLine());
				if(no==1) {
					System.out.print("도서명 :");
					String bk_name = br.readLine();
					System.out.print("카테고리 :");
					String bk_category = br.readLine();
					
					dao.insertBook(bk_name, bk_category);
				}else if(no==2) {
					dao.selectListBook();
					System.out.print("정리할 책 번호:");
					int bk_num = Integer.parseInt(br.readLine());
					int num = dao.beforeClearBoook(bk_num);
					if(num ==1) {//정리가능
						while(true) {
							System.out.println("정리하시겠습니까?");
							System.out.print("1.Y,2.N >");
							int k = Integer.parseInt(br.readLine());
							if (k==1) {
								dao.deleteSbook(bk_num);
								break;
							}else if(k==2){
								System.out.println("정리 취소.");
								break;
							}else {
								System.out.println("올바른 번호를 눌러주십시오.");
							}
						}
					}else {//정리 불가능
						
					}
					
					
					
				}else if(no==3) {
					dao.selectListBook();
				}else if(no==4) {
					dao.selectListMember();
				}else if(no==5) {
					dao.selectListReservation();
				}else if(no==6) {
					System.out.println("프로그램 종료");break;
				}else {
					System.out.println("다시 입력해주십시오.");
				}
			}
		} catch (NumberFormatException e) {
			System.out.println("숫자를 입력해주십시오.");
		}finally {
			if(br!=null)try {br.close();}catch(IOException e) {}
		}
	}
	public static void main(String[] args) {
		new BookAdminMain();
	}

}
