package kr.s10.object.capsule;

class Capsule{
	//private은 같은 클래스내에서만 접근이 가능함.
	//캡슐화의 장점은 데이터를 대입할때 데이터를 검증할 수 있음. '넣는 행위 자체를 하지 않음'
	
	//은닉화
	private int a; // 불러올 수 없음.
	
	//캡슐화
	public void setA (int n) {
		if(n>=0) {
			a = n;
		}else {
			System.out.println("음수는 허용되지 않습니다.");
		}
		
	}
	public int getA() {
		return a;
	}
}

public class CapsuleMain {
	public static void main(String[] args) {
		Capsule cap = new Capsule();
		//변수 a의 접근 지정자 (제한자)가 private 이기때문에 같은 클래스에서는 호출이 가능하지만 다른 클래스에서는 호출 불가능 
		//System.out.println(cap.a); 
		cap.setA(-10);//데이터 저장
		System.out.println(cap.getA());//데이터 호출
	}
}
