package kr.s08.object.method;
/*
 * Method Overloading(중복정의)은 하나의 크래스 내에서 같은 이름을 가지는 메서드가 여러 개 정의되는 것을 말함
 * 메서드명은 동일하게 하고 인자의 타입 또는 개수 , 배치된 순서가 다를 경우 다른 메서드로 인식
 */

public class OverloadingMain01 {
	public void print(int n) {
		System.out.println("정수 n = " + n);
	}
	public void print(double n) { //메서드 명은 동일하게 했으나 인자의 타입을 다르게했기 떄문에 다른 메서드로 인식
		System.out.println("실수 n = " + n);
	}
	public void print(double n, long a) { //매서드 속 인자 개수가 달라서 충돌 x
		System.out.println("실수 n = " + n + ", 정수 a = " + a);
	}
	public void print(long a, double n) { // 인자의 순서가 달라져 다른 메서드로 인식
		System.out.println("정수 a = " + a + ", 실수 n = " + n);
	}
	public static void main(String[] args) {
		OverloadingMain01 om = new OverloadingMain01();
		om.print(20);
		om.print(5.6);
		om.print(3.7, 1234L);
		om.print(5678L,5.8);
	}
}
	