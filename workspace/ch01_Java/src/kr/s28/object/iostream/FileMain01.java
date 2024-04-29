package kr.s28.object.iostream;

import java.io.File;

public class FileMain01 {
	public static void main(String[] args) {
					//   ↓디렉토리 구분자
		String path = "C:\\";
		
		File f = new File(path);
		
		if (!f.exists() || !f.isDirectory()) {
			System.out.println("유효하지 않은 디렉토리입니다.");
			System.exit(0);//프로그램 종료
		}
		
		//지정한 디렉토리의 하위 디렉토리와 파일 정보 반환
		File [] files = f.listFiles();
		for (int i = 0; i < files.length; i++) {
			File f2 = files[i];
			if(f2.isDirectory()) {//디렉토리
				System.out.println("["+f2.getName()+"]");
			}else {//파일
				System.out.println(f2.getName());
				System.out.printf("(%,dbytes)%n", f2.length());
			}
		}
	}
}
