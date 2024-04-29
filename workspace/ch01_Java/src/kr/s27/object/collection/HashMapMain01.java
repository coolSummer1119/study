package kr.s27.object.collection;

import java.util.HashMap;

public class HashMapMain01 {
	public static void main(String[] args) {
		/*
		 * Map : key와 value의 쌍으로 저장. 저장된 순서가 유지되지않음
		 * 
		 */
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("김신", 95);
		map.put("지은탁", 100);
		map.put("저승사자", 85);
		map.put("써니", 98);
		map.put("유덕화", 70);
		map.put("지은탁", 0); //먼저 입력한 값은 사라지고 나중에 입력한 값만 남는다.
		map.put("강호동", null);//value에 null을 인정함
		map.put(null, 100); //key에 null또한 인정
		
		//저장된 데이터(key, value의 쌍)의 목록
		System.out.println(map);//키가 숫자일 때 정렬 된것 처럼 보일 수 있음
		System.out.println("-------------------------------------------");
		
		Integer num = map.get("지은탁");
		System.out.println("지은탁의 성적은" + num);
		
	}
}
