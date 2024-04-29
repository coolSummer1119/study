package kr.s21.object.util;

import java.util.Calendar;

public class CalendarMain01 {
	public static void main(String[] args) {
		Calendar today = Calendar.getInstance();
		System.out.println(today);
		
		int year = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH)+1;
		int date = today.get(Calendar.DATE);
		System.out.println(year);
		System.out.println(month);
		System.out.println(date);

		System.out.printf("%d년 %d월 %d일 %n", year, month, date);
		
		int day  = today.get(Calendar.DAY_OF_WEEK);//요일 1~7
		String[] days = {"일","월","화","수","목","금","토"};//1을 차감해야지 일요일을 부를 수 있고 없는 인덱스 7번을 부르지 않을 수 있다.
		
		System.out.println(days[day-1]+"요일");
		
		int amPm = today.get(Calendar.AM_PM);//오전 0, 오후1
		String str = amPm == Calendar.AM ?"오전":"오후";
		
		int hour = today.get(Calendar.HOUR);//시
		int min = today.get(Calendar.MINUTE);//분
		int sec = today.get(Calendar.SECOND);//초
		
		System.out.printf(" %s %d시%d분%d초", str,hour,min,sec);
		
	}
}
