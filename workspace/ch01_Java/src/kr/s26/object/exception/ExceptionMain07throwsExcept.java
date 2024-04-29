package kr.s26.object.exception;

public class ExceptionMain07throwsExcept {
	public void methodA(String[] n)throws Exception{
		if(n.length>0) {//데이터 입력 o
			for (String s : n) {
				System.out.println(s);
			}
		}else {//데이터 입력 x
			//예외를 인위적으로 발생시킴
			throw new Exception("배열의 요소가 없습니다.");
		}
	}
	
	public static void main(String[] args){
		ExceptionMain07throwsExcept ex = new ExceptionMain07throwsExcept();
		try {
			ex.methodA(args);
		}catch(Exception e) {
			//예외문구 출력
			//System.out.println(e.toString());
			System.out.println(e.getMessage());//깔끔하게 문구만 출력
		}
	}
}
