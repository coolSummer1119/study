package kr.s15.object.thistest;


public class Animal {
	//멤버 필드
	private String name;
	private int age;
	private boolean fly;
	//멤버메서드(set)
	public void setName(String name) {
		this.name = name;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void setFly(boolean fly) {
		this.fly = fly;
	}
	//get
	public String getName() {
		return name;
	}
	public int getAge() {
		return age;
	}
	public boolean getFly() {
		return fly;
	}
	
	//출력
	public Animal(String str) {
		System.out.println(str);
	}
	
	public Animal(int a) {
		this(String.valueOf(a));
	}
	
	public Animal(boolean b) {
		this(String.valueOf(b));
	}
	
	//인자가 있는 생성자
	public Animal(String name, int age, boolean fly) {
		this.name = name;
		this.age = age;
		this.fly = fly;
		
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("비행 여부 : " + (fly ? "가능": "불가능"));
	}
}
