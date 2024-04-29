package kr.s23.object.inter;

//인터페이스
interface A1{
	public static final int W = 10;//원형
	int X = 20;// public static final 생략
	static int Y = 30;// public final 생략
	final int Z = 40;//public static 생략
}

public class InterfaceMain01 {
	public static void main(String[] args) {
//		A1 ap = new A1();//인터페이스는 객체생성 물가능
		
//		A1.X = 50; //상수는 변경 불가능
		
		System.out.println("W: "+A1.W);
		System.out.println("X: "+A1.X);
		System.out.println("Y: "+A1.Y);
		System.out.println("Z: "+A1.Z);
	}
}
