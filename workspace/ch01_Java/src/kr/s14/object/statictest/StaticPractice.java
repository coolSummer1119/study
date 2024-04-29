package kr.s14.object.statictest;

public class StaticPractice {
	public static void main(String[] args) {
		StaticCount ss1 = new StaticCount();
		
		System.out.println("c: " + ss1.C + ", count: " + StaticCount.count);
	}
}
