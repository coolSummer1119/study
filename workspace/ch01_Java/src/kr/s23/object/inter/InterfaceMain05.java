package kr.s23.object.inter;
//구현은 늘 클래스에서만 
interface Inter1{
	public int getA();
}
interface Inter2{
	public int getB();
}
//인터페이스를 인터페이스에 상속
interface Inter3 extends Inter1,Inter2{//인터페이스는 다중 상속 간능
	public int getData();
}
interface Inter4{
	public String getMsg();
}

//인터페이스를 클래스에 다중 "구현" 가능
//단 클래스는 다중 "상속" 불가능
public class InterfaceMain05 implements Inter3, Inter4 {
	@Override
	public int getA(){
		return 10;
	}
	@Override
	public int getB(){
		return 20;
	}
	@Override
	public int getData(){
		return 30;
	}
	@Override
	public String getMsg(){
		return "구현";
	}
	public static void main(String[] args) {
		InterfaceMain05 it = new InterfaceMain05();
		it.getA();
		it.getB();
		it.getMsg();
		it.getData();
		System.out.println(it.getA());
		System.out.println(it.getB());
		System.out.println(it.getData());
		System.out.println(it.getMsg());
	}
}
