package kr.s04.array;

public class ArrayMain08 {
	public static void main(String[] args) {//외부에 문자열배열 데이터를 받아전달 , String (자료형) 때문에 문자열로 인식 
		//클래스를 실행할때 외부에서 데이터 전달.
		//우클릭 - run as - run configuration - argument - 데이터입력 / 띄어쓰기로 구분
		if (args.length>0) {
			for(int i = 0; i < args.length; i++)
				System.out.println(i+ ":" + args[i]);
		}else {//전달되는 데이터가 없음
			System.out.println("입력한 내용이 없습니다.");
		}
	}
}
