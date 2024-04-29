package kr.s18.object.poly;

//부모클래스
class Product{//속성
	int price;
	int bonusPoint;
	
	//생성자
	public Product (int price) {
		this.price=price;
		bonusPoint = price/10;
	}
	public String getName() {
		return "상품";
	}
}
class Tv extends Product{ //제품
	public Tv() {
		super(100);
	}
	@Override
	public String getName() {
		return "티비";
	}
}
class Computer extends Product{ //제품
	public Computer() {
		super(200);
	}
	@Override
	public String getName() {
		return "컴퓨터";
	}
}
class Audio extends Product{
	public Audio () {
		super(300);
	}
	@Override
	public String getName() {
		return "오디오";
	}
	
}
//구매자
class Buyer{
	private int money = 1000;
	private int bonusPoint = 0;
	//구매하기
	public void buy(Product p) {//제품 하나하나 하지 않고 속성을 상속시켜 속성을 인자에 넣는 형식
		if(money < p.price) {
			System.out.println("잔액이 부족해서 물건을 구매할 수 없습니다."); return ;
		}
		money -= p.price;
		bonusPoint += p.bonusPoint;
		
		System.out.println(p.getName() + "을/를 구입했습니다.");
		System.out.println("가격은 " + p.price + "원 입니다.");
		System.out.println("남은 돈은 " + money + "원 입니다.");
		System.out.println("현재 보너스 점수는 " + bonusPoint + " 점 입니다.");
	}
}
public class PolyMain04 {
	public static void main(String[] args) {
		//구매자생성
		Buyer b = new Buyer();
		Tv tv = new Tv();
		Computer com = new Computer();
		Audio au = new Audio();
		//제품 구매
		b.buy(tv); //Tv -> product 업캐스팅 자동적으로 형변환
		b.buy(com); //Computer -> product 업캐스팅 자동적으로 형변환
		b.buy(au); //Audio -> product 업캐스팅 자동적으로 형변환
	}
}
