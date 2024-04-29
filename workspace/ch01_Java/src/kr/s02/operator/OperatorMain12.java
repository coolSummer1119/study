package kr.s02.operator;

public class OperatorMain12 {
	public static void main(String[] args) {
		System.out.println("==대입연산자==");
		int a = 5;
		int b = 7;
		
		a += b; // a= a+b  a= 5+7
		System.out.println("a += b : " + a );
		
		a -= b; // a= a-b *위에서 12로 마무리 됐기 때문에 12-7 =5 
		System.out.println("a -= b : " + a );
		
		a *= b; // a= a*b  = 5 * 7 = 35
		System.out.println("a *= b : " + a );
		
		a /= b; // a= a/b  = 35 / 7 = 5
		System.out.println("a /= b : " + a );
		
		a %= b; // a= a%b  = 5 % 7 = 5 
		System.out.println("a %= b : " + a );
	}
}
