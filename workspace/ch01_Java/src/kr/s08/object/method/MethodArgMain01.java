package kr.s08.object.method;

public class MethodArgMain01 {
	//인자 전달 방식 : 값 호출 (Call by value)
	//기본 자료형의 값을 인자로 전달하는 방식. 값을 복사하여 전달
	public int increase(int n) {
		++n;
		return n;	
	}
	public static void main(String[] args) {
		int var1 = 100;
		MethodArgMain01 ma = new MethodArgMain01();
		int var2 = ma.increase(var1); // 생성된 객체에 var1을 복사해 int n에 넣어 var2로 데이터를 담는 과정
		System.out.println("var1 : " + var1 + ", var2 : " + var2 );
		
	}
}
