package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/num")
public class NumServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
		/*
		 * [실습]
		 * 전송된 정수 값이 짝수이면 짝수입니다 출력, 홀수이면 홀수입니다 라고 출력.
		 */
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int num = Integer.parseInt(request.getParameter("num"));
		
		out.println("<html>");
		out.println("<head><title>짝수 홀수 구하기</title></head>");
		out.println("<body>");
		if(num%2==1) {
			out.println("홀수입니다.");
		}else {
			out.println("짝수입니다.");
		}
		out.println("</body>");
		out.println("</html>");
		
		out.close();
	}
}
