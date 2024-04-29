package kr.s28.object.iostream;

import java.util.ArrayList;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;

public class MovieMain {
	/*
	 * 메뉴 : 1.영화정보입력, 2.영화정보출력, 3.파일생성, 4.파일읽기, 5.종료
	 * 
	 * 메소드 명 : 메뉴 callMenu()
	 * 			영화정보 입력 inputMovie()
	 * 			영화정보 출력 printMovie()
	 * 			파일 생성 createFile()
	 * 			파일 읽기 readfile()
	 * 조건 : 상영시간은 0보다 크게 입력하십시오
	 */
	BufferedReader br;
	ArrayList<Movie> list;

	public MovieMain(){
		list = new ArrayList<Movie>();
		try {
			br = new BufferedReader(new InputStreamReader(System.in));
			callMenu();
		}catch(Exception e){
			e.printStackTrace();
		}finally {if(br!=null) try{br.close();}catch(IOException e) {}}

	}

	public void callMenu()throws IOException {
		while(true) {
			try {
				System.out.println("메뉴> 1.영화정보입력, 2.영화정보출력, 3.파일생성, 4.파일읽기, 5.종료");
				int num = Integer.parseInt(br.readLine());
				if (num==1) {
					inputMovie();
				}else if(num==2) {
					printMovie();
				}else if(num==3) {
					creatFile();
				}else if(num==4) {
					readFile();
				}else if(num==5) {
					System.out.println("프로그램을 종료합니다");
					break;
				}else {
					System.out.println("숫자를 다시 입력해주십시오.");
				}

			}catch(NumberFormatException e) {
				System.out.println("숫자를 입력하십시오");
				//			}catch(IOException e) {
				//				e.printStackTrace();
				//			}finally {if(br!=null) try{br.close();}catch(IOException e) {}}

			}}}

	public void inputMovie() throws IOException{
		Movie mv = new Movie();
		System.out.print("제목:");
		mv.setName(br.readLine());
		System.out.print("제작년도:");
		mv.setCreate_year(br.readLine());
		System.out.print("영화감독:");
		mv.setDirector(br.readLine());
		System.out.print("영화배우:");
		mv.setActor(br.readLine());
		while(true) {
			System.out.print("상영시간:");
			int num = Integer.parseInt(br.readLine());
			if (num<=0) {
				System.out.println("상영시간의 길이는 0보다 크게 입력해야합니다.");
			}else {
				mv.setTime(num);
				break;
			}
		}

		list.add(mv);
		System.out.println("영화 1개의 정보가 추가되었습니다.");

	}

	public void printMovie() {
		if(list.size()>0) {
			System.out.println("------------------------------------------");
			System.out.println("제목\t제작년도\t영화감독\t영화배우\t상영시간");
			System.out.println("------------------------------------------");
			for(Movie k : list) {
				System.out.print(k.toString());
//				System.out.printf("%s\t", k.getName());
//				System.out.printf("%s\t", k.getCreate_year());
//				System.out.printf("%s\t", k.getDirector());
//				System.out.printf("%s\t", k.getActor());
//				System.out.printf("%d%n", k.getTime());
			}
		}else {
			System.out.println("출력할 영화정보가 없습니다.");
		}
	}



	public void creatFile() {
		FileWriter fw =null;
		try {
			fw = new FileWriter("movie.txt");
			fw.write("------------------------------------\n");
			fw.write("영화제목\t제작연도\t감독\t배우\t상영시간\n");
			fw.write("------------------------------------\n");
			for(Movie m :list) {
				fw.write(m.toString());
			}
			fw.flush();
			System.out.println("파일에 영화정보를 저장했습니다.");
			
		}catch(IOException e) {
			System.out.println("파일에 영화 정보 저장 오류");
		}finally {
			if (fw!=null)try{fw.close();}catch(IOException e) {}
		}
	}

	public void readFile() {
		FileReader fr = null;
		int readChar;
		try {
			fr = new FileReader("movie.txt");
			while((readChar = fr.read())!=-1) {
				System.out.print((char)readChar);
			}
		}catch(FileNotFoundException e) {
			System.out.println("영화 파일을 찾을 수 없습니다.");
		}catch(IOException e) {
			System.out.println("파일 읽기 오류");
		}finally {
			if(fr!=null)try {fr.close();}catch(IOException e) {}
		}
	}


	public static void main(String[] args) {
		new MovieMain();
	}
}
