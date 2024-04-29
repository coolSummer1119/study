package kr.s05.objectfield;

public class Student03 {
	String name;
	int age;
	String hobby;
	String job;
	
	public static void main(String[] args) {
		Student03 student = new Student03();
		student.name="강건마";
		student.age=18;
		student.hobby="쌈박질";
		student.job="고등학생";
		
		System.out.println(student.name + "," + student.age + "," + student.hobby + ","
				+ student.job);
		System.out.println("-------------------------------");
		
		Student03 student3 = new Student03();
		
		student3.name = "박문치";
		student3.age = 30;
		student3.hobby = "노래만들기";
		student3.job = "가수";
		
		System.out.println(student3.name + "," + student3.age + "," + student3.hobby + ","
				+ student3.job);
	}
}
