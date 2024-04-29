package kr.web.ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/greeting")
public class GreetingServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
		//문서 타입 및 캐릭터셋 지정
		response.setContentType("text/html;charset=utf-8");
		
		//post 방법은 내용을 숨김
		//post 방식으로 데이터를 전송할 때는 인코딩 타입 지정(post떄만)
		request.setCharacterEncoding("utf-8");
		//작성을 안할 경우 글자가 깨지게 됨.
		
		//전송된 데이터 반환
		String name = request.getParameter("name");
		
		//HTML 출력을 위한 출력 스트림 생성
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>Greeting</title></head>");
		out.println("<body>");
		out.println(name+"님의 방문을 환영합니다");
		out.println("</body>");
		out.println("</html>");
		
		out.close();
	}
}
