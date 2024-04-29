package kr.s27.object.collection;

/*
 * [실습]
 * 메뉴 : 1.회원정보 입력, 2.회원정보 출력, 3.종료
 * 메서드명 : 메뉴(callMenu),회원가입(register),회원정보 출력(printUserInfo)
 * 입력시 조건 체크 : 나이는 1살 이상 입력 가능
 */
import java.util.ArrayList;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class MemberMain {
	BufferedReader br;//reader 객체 "br" 생성
	ArrayList<Member> list;// 비어있는 Member "list" 생성  /초기화를 선언 동시에 해도 됨

	public MemberMain(){
		list = new ArrayList<Member>(); // "list"라는 새로운 arraylist 객체 생성
		try {
			br = new BufferedReader(new InputStreamReader(System.in));//입력하는 버퍼생성
			callMenu();//메뉴 부르기

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(br!=null) {
				try{
					br.close();
				}catch(IOException e){}
			}
		}
	}

	public void callMenu()throws IOException {
		while (true) {
			try {
				System.out.print("메뉴 > 1.회원정보 입력 2.회원정보 출력 3. 종료");
				int num = Integer.parseInt(br.readLine());
				if(num==1) {
					register();
				}else if(num==2 ){
					printUserInfo();
				}else if(num==3) {
					System.out.print("프로그램 종료");
					break;
				}else {
					System.out.println("잘못입력하였습니다.");
				}
			}catch(NumberFormatException e) {
				System.out.println("숫자를 입력해주십시오.");
			}
		}
	}

	public void register()throws IOException {

		Member mb = new Member();
		System.out.print("이름:");
		mb.setName(br.readLine());
	    while (true) {
	        try {
	            System.out.print("나이:");
	            int age = Integer.parseInt(br.readLine());
	            if (age < 1) {
	                System.out.println("나이는 1살 이상이어야 합니다.");
	            } else {
	                mb.setAge(age);
	                break; // 올바른 나이를 입력하면 반복문을 종료합니다.
	            }
	        } catch (NumberFormatException e) {
	            System.out.println("숫자를 입력해주십시오.");
	        }
	    }
		System.out.print("직업:");
		mb.setJob(br.readLine());
		System.out.print("주소:");
		mb.setAddress(br.readLine());
		System.out.print("전화번호:");
		mb.setPhone(br.readLine());
		
		list.add(mb);

		System.out.print("회원 등록 1명이 완료되었습니다.");

	}

	public void printUserInfo() {
		System.out.println("회원 정보 : 총 " + list.size() + "명");
		System.out.println("회원명\t나이\t직업\t주소\t핸드폰 번호");
		System.out.println("-------------------------------");

		for(Member k : list) {
			System.out.printf("%s\t",k.getName());
			System.out.printf("%d\t",k.getAge());
			System.out.printf("%s\t",k.getJob());
			System.out.printf("%s\t",k.getAddress());
			System.out.printf("%s%n",k.getPhone());
		}
	}


	public static void main(String[] args) {
		new MemberMain();
	}
}
