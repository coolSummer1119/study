package kr.s28.object.iostream;

import java.io.File;

public class FileMain05 {
	public static void main(String[] args) {
		//절대경로 지정
		String path = "C:\\javaWork\\javaSample"; 
		
		File f1 = new File(path);
		System.out.println("===디렉토리 생성===");
		//디레고리를 생성할 수 있으면 true
		//디레고리를 생성할 수 없으면 false
		System.out.println(f1.mkdir());
		
		
	}
}
