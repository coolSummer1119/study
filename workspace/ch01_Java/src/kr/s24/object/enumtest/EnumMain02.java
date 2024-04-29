package kr.s24.object.enumtest;
//열거형 객체
enum Lesson{
	//열거형 상수 (문자열 상수)
	JAVA,XML,JSP
}




public class EnumMain02 {
	public static void main(String[] args) {
		System.out.println(Lesson.JAVA);//실제로 사용할땐 그냥 호출
		System.out.println(Lesson.XML);
		System.out.println(Lesson.JSP);
		System.out.println("-------------");
		
		System.out.println(Lesson.JAVA.toString());//객체의 부모는 모두 Object
		System.out.println(Lesson.XML.toString());
		System.out.println(Lesson.JSP.toString());
		System.out.println("-------------");

		//열거 객체의 문자열을 반환
		System.out.println(Lesson.JAVA.name());
		System.out.println(Lesson.XML.name());
		System.out.println(Lesson.JSP.name());
		System.out.println("-------------");

		//열거 객체의 순번(0번부터 시작)을 반환
		System.out.println(Lesson.JAVA.ordinal()); //숫자값 이용할때 - 그닥 권장 x
		System.out.println(Lesson.XML.ordinal());
		System.out.println(Lesson.JSP.ordinal());
	}
}
