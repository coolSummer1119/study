package kr.s14.object.statictest;

public class StaticMain01 {
	public static void main(String[] args) {
		StaticCount sc1 = new StaticCount();
		System.out.println("c: " + sc1.C + ", count: " + StaticCount.count);
		
		StaticCount sc2 = new StaticCount();
		System.out.println("c: " + sc2.C + ", count: " + StaticCount.count);
		
		StaticCount sc3 = new StaticCount();
		System.out.println("c: " + sc3.C + ", count: " + StaticCount.count);
	}
}