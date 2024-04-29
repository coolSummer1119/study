package kr.s28.object.iostream;

import java.io.File;

public class FileMain03 {
	public static void main(String[] args) {
		//상대경로
		String path = "sample.txt";//원래파일명
		String new_path = "example.txt";//새 파일명 //파일객체로 전달
		
		File f1 = new File(path);
		System.out.println("===파일명 변경===");
		File f2 = new File(new_path);
		//파일명을 변경할 수 있으면 변경하고 (true)/변경이 불가능하면 false 반환
		System.out.println(f1.renameTo(f2));//변경후 한번 더 하면 false
		
	}
}
