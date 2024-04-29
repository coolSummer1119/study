package kr.s13.object.array;

public class ScoreMain {
	public static void main(String[] args) {
		Score[] scoreArray = new Score[3];
		
		//반복문을 이용한 배열의 요소 출력
		System.out.println("이 름 국어 영어 수학 총 점 평균 등급");
		System.out.println("--------------------------");
		
		scoreArray[0] = new Score("전준우",89,86,99);
		scoreArray[1] = new Score("한동희",59,45,77);
		scoreArray[2] = new Score("윤동희",85,67,35);
		
		for (int i = 0; i < scoreArray.length ; i++) {
			System.out.printf("%s ", scoreArray[i].getName());
			System.out.printf("%d ", scoreArray[i].getKorean());
			System.out.printf("%d ", scoreArray[i].getEnglish());
			System.out.printf("%d ", scoreArray[i].getMath());
			System.out.printf("%d ", scoreArray[i].makeSum());
			System.out.printf("%d ", scoreArray[i].makeAvg());
			System.out.printf("%s%n", scoreArray[i].makeGrade());
		}
		System.out.println("----------------------------");
		//확장 for 문을 이용한 배열의 요소 출력
		for (Score s : scoreArray) {
			System.out.printf("%s ", s.getName());
			System.out.printf("%d ", s.getKorean());
			System.out.printf("%d ", s.getEnglish());
			System.out.printf("%d ", s.getMath());
			System.out.printf("%d ", s.makeSum());
			System.out.printf("%d ", s.makeAvg());
			System.out.printf("%s%n", s.makeGrade());
		}
	}
}
