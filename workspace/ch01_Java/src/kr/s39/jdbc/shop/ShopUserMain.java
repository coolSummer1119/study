package kr.s39.jdbc.shop;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class ShopUserMain {
	private BufferedReader br;
	private ShopDAO dao;
	//생성자
	public ShopUserMain() {
		try {
			br = new BufferedReader(new InputStreamReader(System.in));
			dao = new ShopDAO();
			//메뉴호출
			callMenu();
		} catch (Exception e) {	
			e.printStackTrace();
		}finally {
			//자원정리
			if(br!=null)try {br.close();}catch(IOException e) {}
		}
	}
	//메뉴
	public void callMenu() throws IOException{
		while(true) {
			System.out.print("1.회원 가입,2.회원 정보,3.상품 구매,4.구매 내역,5.종료>");
			try {
				int no = Integer.parseInt(br.readLine());
				if(no==1) {//회원가입
					System.out.print("아이디:");
					String cust_id = br.readLine();
					System.out.print("이름:");
					String cust_name = br.readLine();
					System.out.print("주소:");
					String cust_adress = br.readLine();
					System.out.print("전화번호:");
					String cust_tel = br.readLine();
					
					dao.insertCustomer(cust_id, cust_name, cust_adress, cust_tel);
				}else if(no==2) {//회원정보
					System.out.print("아이디:");
					String cust_id=br.readLine();
					
					dao.selectDetailCustomer(cust_id);
				}else if(no==3) {//상품구매
					dao.selectItem();
					System.out.println("---------------");
					System.out.print("구매할 상품에 번호:");
					int item_num = Integer.parseInt(br.readLine());
					System.out.print("아이디:");
					String cust_id = br.readLine();
					
					dao.insertOrder(item_num, cust_id);
				}else if(no==4) {//구매내역
					System.out.print("아이디:");
					String cust_id = br.readLine();
					
					dao.selectOrdersById(cust_id);
				}else if(no==5) {//종료
					System.out.println("프로그램 종료");
					break;
				}else {
					System.out.println("올바른 숫자를 입력해 주십시오");
				}
				
			} catch (NumberFormatException e) {
				System.out.println("숫자만 입력 가능!");
			}
		}
	}
	public static void main(String[] args) {
		new ShopUserMain();
	}
}
