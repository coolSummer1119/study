package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/add")
public class AddSurvlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		/*
		 * [실습]
		 * 두 개의 숫자가 전송되면 전송된 두 개의 숫자를 더해서 결과를 구하시오
		 * [출력예시]
		 * 5 + 2 = 7
		 */
		response.setContentType("text/html;charset=utf-8");
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>");
		out.println("더하기");
		out.println("</title>");
		out.println("</head>");
		out.println("<body>");
		/*out.println(num1 + " + " + num2 + " = " + (num1+num2));*/
		out.printf("%d + %d = %d",num1,num2,num1+num2);
		out.println("</body>");
		out.println("</html>");
		
		out.close();
	}
}
