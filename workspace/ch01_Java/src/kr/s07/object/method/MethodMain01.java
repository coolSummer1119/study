package kr.s07.object.method;

public class MethodMain01 {
	//반환하는 데이터가 있는 경우
	//  반환형↓   ↓메소드 명
	public int add(int a, int b) {
		return a + b;
	}//           ↑반환하는 데이터
	//반환하는 데이터가 없는 경우
	//  반환형↓
	public void print(String str) {
		System.out.println(str);//메소드 내부에서 출력을 해 소모를 한 경우 (return이 없음)
	}//(void는 비어있다는 뜻, 안써도 될거같지만 형식을 맞춰야함/)
	//                  ↓main 은 메소드지만 return 이 없기 때문에 void로 명시 된것. 
	public static void main(String[] args) {
		//객체 선언 및 생성
		MethodMain01 method = new MethodMain01();
		//객체의 멤버 메소드 호출
		int result = method.add(5, 8);
		System.out.println("result : " + result);
		method.print("오늘은 월요일");
		
	}
}
