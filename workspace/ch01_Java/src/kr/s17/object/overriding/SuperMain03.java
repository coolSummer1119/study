package kr.s17.object.overriding;

class People2{
	int a;
	public People2(int a) {
		this.a=a;
	}
}

class Student2 extends People2{//부모 클래스의 default 값을 찾음
	//생성자
	public Student2() {
		//부모클래스의 자료형이 int인 인자를 가지고 있는 생성자 호출
		super(700); //위에 부모 클래스로 들어감
	}
	
}


public class SuperMain03 {
	public static void main(String[] args) {
		Student2 st = new Student2();
		System.out.println(st.a);
	}
}
