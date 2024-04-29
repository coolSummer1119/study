package kr.s01.basic;

public class VariableTypeMain04 {
	public static void main(String[] args) {
		System.out.println("===명시적 형변환(강제 형변환)===");
		
		// 더 작은 자료형으로 강등이 일어나는 형태, 정보의 손일이 일부 있을 수 있다.
		byte b1 = 127;
		byte b2 = 127;
		byte result1 = (byte)(b1 + b2); //현재 결과값이 int를 byte로 끌어내림
		System.out.println("result1 = " + result1); // 정보의 손실이 발생해 -2 출력
		
		short s1 = 32767;
		short s2 = 32767;
		short result2 = (short)(s1 + s2);
		System.out.println("result2 = " + result2); // 정보 손실이 발생해 -2 출력
		//캐스트 연산자

		float f1 =3.14f;
		int in1 = 15;
		int result3 = (int)(f1 + in1);
		System.out.println("result3  = " + result3); //소숫점 이하 사라지면서 데이터 손실
		
		long lg1 = 1234L;
		int in2 = 59;
		int result4 = (int)lg1 + in2;
		System.out.println("result4 = " + result4); //표시할 수 있는 데이터는 손실 x
		
		
	}
}
