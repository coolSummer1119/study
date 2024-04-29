package kr.s28.object.iostream;

import java.io.Serializable;
import java.io.ObjectOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

class UserInfo implements Serializable{
	private String name;
	private int age;
	private String address;
	
	
	public UserInfo(String name, int age, String address) {
		this.name = name;
		this.age = age;
		this.address = address;
	}


	@Override
	public String toString() {
		return "UserInfo / 이름 :" + name + ", 나이 :" + age + ", 주소 :" + address ;
	}
}

public class SerialMain03 {
	public static void main(String[] args) {
		//직렬화할 객체 생성
		UserInfo u1 = new UserInfo("Holland" , 20, "From to the bottom");
		UserInfo u2 = new UserInfo("Messi" , 12, "From to the top");
		
		ArrayList<UserInfo> list = new ArrayList<UserInfo>();
		list.add(u1);
		list.add(u2);
		
		FileOutputStream fos = null;
		ObjectOutputStream oos = null;
		
		try {
			//파일생성
			fos = new FileOutputStream("userInfo.ser");
			oos = new ObjectOutputStream(fos);
			//객체 직렬화 하기
			oos.writeObject(list);
			
			System.out.println("직렬화가 성곡적으로 완료되었습니다.");
			
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			if (oos != null)try {oos.close();}catch(IOException e) {}
			if (fos != null)try {fos.close();}catch(IOException e) {}
		}
		
		
	}
}
