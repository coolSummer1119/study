package kr.s13.object.array;

class Book{
	private String name;
	private String category;
	private int price;
	private double discount;
	
	
	public Book(String c, String n, int p, double d) {
		category = c;
		name = n;
		price = p;
		discount = d;	
	}
	
	public String getCategory() {
		return category;
	}
	
	public String getName() {
		return name;
	}
	
	public int getPrice() {
		return price;
	}
	
	public double getDiscount() {
		return discount;
	}
}

public class BookMain {
	public static void main(String[] args) {
		Book[] bookArray = new Book[3];
		// Book 객체 3개 생성하여 배열에 저장
		bookArray[0] = new Book("IT", "Java", 50000, 0.05 );
		bookArray[1] = new Book("IT", "Oracle", 40000, 0.03 );
		bookArray[2] = new Book("Art", "Van Go", 60000, 0.06 );
		
		for (int i = 0; i < bookArray.length ; i++) {
			System.out.printf("%s \t", bookArray[i].getCategory());
			System.out.printf("%s \t", bookArray[i].getName());
			System.out.printf("%d \t", bookArray[i].getPrice());
			System.out.printf("%.2f%n", bookArray[i].getDiscount()); //f 앞에 0절대 넣지 말기!
		}
	}
}
