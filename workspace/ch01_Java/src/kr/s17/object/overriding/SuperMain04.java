package kr.s17.object.overriding;
//부모클래스
class Point {
	int x;
	int y;
	
	public Point(int x , int y) {
		this.x = x;
		this.y = y;
	}
	public String getLocation() {
		return "x: " + x + ", y: " + y;
	}
}
//자식클래스
class Point3D extends Point{
	int z;
	
	public Point3D(int x, int y, int z) {
		//Point 부모클래스의 int형 인자가 두개인 생성자를 호출
		super(x, y);
		this.z = z;//생산자 블럭 안에서 super을 통해서 x와 y는 값을 넣을 수 있으나 z는 넣지 못했다 그래서 여기에도 위처럼 똑같이
		           //this 실행
	}
	@Override
	public String getLocation() {
		return "x: " + x + ", y: " + y + ", z: " + z;
	}
}

public class SuperMain04 {
	public static void main(String[] args) {
		Point3D p3 = new Point3D(10,20,30);
		System.out.println(p3.getLocation());
	}
}
