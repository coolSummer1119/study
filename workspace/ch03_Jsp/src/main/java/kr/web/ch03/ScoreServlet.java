package kr.web.ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet("/score")
public class ScoreServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException{
		//성적 처리
		//국어,영어,수학,총점,평균,등급 출력
		//문서 타입 및 캐릭터 셋
		response.setContentType("text/html;charset=utf-8");

		//문서 타입 인코딩
		request.setCharacterEncoding("utf-8");

		//문서 스크림
		PrintWriter out = response.getWriter();

		String name = request.getParameter("name");
		int korean = Integer.parseInt(request.getParameter("korean"));
		int english = Integer.parseInt(request.getParameter("english"));
		int math = Integer.parseInt(request.getParameter("math"));

		int sum = korean+english+math;
		float avg = sum/3;

		char grade;

		switch((sum/3)/10) {
		case 10:
		case 9:
			grade='A';break;
		case 8:
			grade='B';break;
		case 7:
			grade='C';break;
		case 6:
			grade='D';break;
		default:
			grade='F';break;
		}


		out.println("<html>");
		out.println("<head><title>여행지</title></head>");
		out.println("<body>");
		out.println("<h3>성적 결과</h3>");
		out.println("<table border=1px solid black>");
		out.println("<tr>");
		out.println("<th>국어</th>");
		out.println("<th>수학</th>");
		out.println("<th>영어</th>");
		out.println("<th>총점</th>");
		out.println("<th>평균</th>");
		out.println("<th>등급</th>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td>"+korean+"</td>");
		out.println("<td>"+english+"</td>");
		out.println("<td>"+math+"</td>");
		out.println("<td>"+sum+"</td>");
		out.printf("<td>%.1f</td>",avg);
		out.println("<td>"+grade+"</td>");
		out.println("</tr>");
		out.println("</table>");
		


		out.println("</body>");
		out.println("</html>");

		out.close();

	}

}
