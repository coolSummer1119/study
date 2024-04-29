package kr.s28.object.iostream;

import java.io.BufferedOutputStream;//데이터를 받아서 전송하는역할
import java.io.FileOutputStream;
import java.io.IOException;

public class FileOutputStreamMain02 {
	public static void main(String[] args) {
		FileOutputStream fos =null;
		BufferedOutputStream bos = null;
		try {
			fos = new FileOutputStream("bufferOut.txt");//파일을 생성하고
			bos = new BufferedOutputStream(fos);//만들어진 파일을 여기로 보냄
			
			String str = "BufferedOutputStream Test입니다.";
			//        String->byte[]
			bos.write(str.getBytes());
			//버퍼를 비우고 버퍼에 있는 데이터를 파일에 출력
			//플러시를 하지 않으면버퍼에 담겨있는 데이터를 파일에 저장하지 않음
			bos.flush();
			
			System.out.println("파일을 생성하고 파일에 내용을 기술함");
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			                    //bufferedOutputStream의 close 메서드는 자원정리하기 전에 buffer를 체크해서 데이터가 남아있으면 flush처리함
			//자원정리				↓여기서 예외가 발생하수 있어서 try catch사용 ↓여기를 비워둔 이유는 거의 마지막 작업이기 때문에 그냥 마무리 되어도 됨. 진행될 수 있게만.
			if(bos!=null)try {bos.close();}catch(IOException e) {}
			if(fos!=null)try {fos.close();}catch(IOException e) {}
		}
	}
}
