package kr.s21.object.util;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class DateMain {
	public static void main(String[] args) {
		Date now = new Date();
		System.out.println(now);		
		System.out.println(now.toString());
		System.out.println("----------------");
		//deprecated 곧 사라질 기능
		System.out.println(now.toLocaleString());
		System.out.println("----------------");
		
		DateFormat df = DateFormat.getDateInstance();//년도 월 일
		String today = df.format(now);
		System.out.println(today);
		System.out.println("-------------");
		
		df = DateFormat.getDateTimeInstance();//시간까지
		today = df.format(now);
		System.out.println(today);
		System.out.println("-------------");

		df = DateFormat.getTimeInstance();//시간까지
		today = df.format(now);
		System.out.println(today);
		System.out.println("-------------");
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyy년mm월dd일 (E) a hh:mm:ss");
		today = sf.format(now);
		System.out.println(today);
	}
}
