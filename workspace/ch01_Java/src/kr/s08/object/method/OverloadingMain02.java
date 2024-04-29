package kr.s08.object.method;

public class OverloadingMain02 {
	public void getLength(int n) {
		String s = String.valueOf(n); // int > String
		getLength(s);
	}
	public void getLength(float n) {
		String s = String.valueOf(n); //float - > String
		getLength(s);
	}
	public void getLength(String s) {
		System.out.println(s + "의 길이 : " + s.length());
	}
	public static void main(String[] args) {
		OverloadingMain02 om = new OverloadingMain02();
		om.getLength("hello");
		om.getLength(200000); // 200000 -> "200000"
		om.getLength(3.14F); // f를 넣지 않으면 double / 3.14f > "3.14" 점포함 총 4
		
	}
}
