package kr.web.ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board")
public class boardServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
		/*
		 *[실습]
		 *name, title,content를 전달 받아서 아래와 같이 출력하시오.
		 *[출력예시]
		 *이름: 홍길동
		 *제목: 봄봄봄
		 *내용: 무더위 시작
		 */
		//문서 타입 및 캐릭터셋 지정
		response.setContentType("text/html;charset=utf-8");
		//인코딩
		request.setCharacterEncoding("utf-8");
		//전송된 데이터 반환
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		//HTML 출력을 위한 출력 스트림 생성
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>게시판</title></head>");
		out.println("<body>");
		out.println("이름 : " + name + "<br>");		
		out.println("제목 : " + title + "<br>");		
		out.println("내용 : " + content + "<br>");		
		out.println("</body>");
		out.println("</html>");
		
		out.close();
	}

}
