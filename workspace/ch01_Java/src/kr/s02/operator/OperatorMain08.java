package kr.s02.operator;

public class OperatorMain08 {
	public static void main(String[] args) {
		/*
		 * 논리곱 (&&)
		 * 선조건 && 후조건           결과
		 * true   true           true
		 * true   false          false
		 * false --(후조건 미실행)--> false
		 * 
		 * 논리합 (||)
		 * 선조건 || 후조건           결과
		 * true --(후조건 미실행)-->  true
		 * false  true           true
		 * false  false          false
		 */
		//증감연산자, 비교연산자, 논리연산자
		int a,b;
		a = b = 10;  // a= 10 b = 10
		
		boolean c = a++ >= ++b && ++a > b++; 
		// 10 >= 11 (false) && 12 > 11 (true) -->하나라도 false면 false 따라서  c = false
		//후조건 미실행이기 때문에 11에서 멈춤
		System.out.println(a + "," + b); // [10, 10] 출력 >>>>> [11 , 11]
		System.out.println("c = " + c); // [c = false] 출력
		
		System.out.println("-----------");
		
		int d, e ;
		d = e = 10;
		
		boolean f = ++d < e++ || d++ >= ++e; // 11<10 (false) || 11>= 12 (false) 따라서 c = false
		System.out.println(d + "," + e); //[12,12]출력 (데이터상으로)
		System.out.println("f = " + f); //[f = false]출력
	}
}
