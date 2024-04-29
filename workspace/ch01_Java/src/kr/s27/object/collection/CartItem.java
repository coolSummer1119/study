package kr.s27.object.collection;

public class CartItem {
	private String code;//상품코드
	private int num;//수량
	private int price;//가격
	
	public CartItem() {
		
	}
	
	public CartItem(String code, int num, int price) {
		this.code = code;
		this.num = num;
		this.price=price;
	}
	
	
	public String getCode() {
		return code;
	}
	public int getNum() {
		return num;
	}
	public int getPrice() {
		return price;
	}
	
}
