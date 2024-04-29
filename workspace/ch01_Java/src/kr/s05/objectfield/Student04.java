package kr.s05.objectfield;

public class Student04 {
	String name;
	int age;
	
	public static void main(String[] args) {
		Student04 s1 = new Student04();
		s1.name = "장영실";
		s1.age = 51;
		System.out.println(s1.name + "," + s1.age);
		System.out.println(s1);// @뒤에가 주소가 됨
		System.out.println("----------");
		
		Student04 s2 = new Student04();
		s2.name = "을지문덕";
		s2.age = 30;
		System.out.println(s2.name + "," + s2.age);
		//객체의 참조값(주소)
		System.out.println(s2);//주소가 온전히 일치한다면 그것은 같은 객체
	}
}
