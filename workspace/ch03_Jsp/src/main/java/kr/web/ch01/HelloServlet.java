package kr.web.ch01;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;
import java.io.PrintWriter;

//일반클래스를 서블릿으로 사용할 경우 HttpServlet를 상속시켜야함 (잊지말것!)

//호출 주소 지정
@WebServlet("/helloServlet")//기본경로가 막혀있어서 옆 주소로 호출
public class HelloServlet extends HttpServlet{//상속을 통해 서버클래스로 인정 받음
	//주소를 호출하는 방법 :get 주소를 숨기는 방법 :post
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
					//			위 두 객체는 container가 만들어줌
		//문서 타입 및 캐릭터 셋 지정(꼭해야함)		↓표시를 안하면 한글이 깨짐
		response.setContentType("text/html;charset=utf-8");
		
		//HTML 출력을 위한 출력 스트림 생성
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>Hello Servlet</title></head>");
		out.println("<body>");
		out.println("처음 작성하는 servlet입니다");
		out.println("</body>");
		out.println("</html>");
		
		//자원정리
		out.close();
	}
}
