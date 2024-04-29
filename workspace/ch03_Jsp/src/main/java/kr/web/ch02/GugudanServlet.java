package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/gugudan")
public class GugudanServlet extends HttpServlet{
	@Override			//파라미터 값 여기 인자로 들어옴
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException{
		//문서 타입 및 캐릭터 셋 지정
		response.setContentType("text/html;charset=utf-8");
		
		//전송된 데이터 반환  (연산을 하려고 하면 String > int형으로 변환)
		int dan = Integer.parseInt(request.getParameter("dan"));//name값 value값을 String 형태로 반환
		
		//HTML 출력을 위한 출력 스트림 생성
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>");
		out.println("구구단");
		out.println("</title>");
		out.println("</head>");
		out.println("<body>");
		out.println(dan + "단 <br>");
		for(int i=1; i <=9 ; i++) {
			out.println(dan + "*" + i + "=" + dan*i + "<br>");
		}
		
		out.println("</body>");
		out.println("</html>");
		
		//자원정리
		out.close();
		
	}
}
