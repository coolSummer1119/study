package kr.s16.object.extention;

public class SmartPhone extends Phone{
	private String os;
	//상속받았기때문에 원래 가지고 있듯 인식
	public SmartPhone(String number,String model,String color,String os) {
		this.number = number;
		this.model = model;
		this.color = color;
		this.os = os;
	}
	//os 의 getters
	public String getOs() {
		return os;
	}
	
}
