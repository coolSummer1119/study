package kr.s15.object.thistest;

class ThisTest{
	//은닉화
	private int a;
	//캡슐화
	public void setA(int a) { // int a {a = a;로 해버린다면 지역변수기 때문에 값이 사라짐 또 지역변수와 멤버변수가 있으면 지역변수 먼저임
	 // 멤버변수 = 지역변수
		this.a=a; //this는 객체 자신이 가지고 있는 멤버변수를 의미.
	}
	public int getA() {
		return a;
	}
}

public class ThisMain02 {
	public static void main(String[] args) {
		ThisTest tt = new ThisTest();
		tt.setA(10);
		System.out.println(tt.getA());
	}
}
