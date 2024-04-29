package kr.web.ch03;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;

import java.io.PrintWriter;
import java.io.IOException;

@WebServlet("/todayMenu")
public class TodayMenu extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//문서 타입과 캐릭터 셋
		response.setContentType("text/html;charset=utf-8");
		
		//Post 방식으로 데이터 전송시 전송된 데이터 인코딩 타입 지정(명시)
		request.setCharacterEncoding("utf-8");
		
		//문서 스크림 출력
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head><title>점심 메뉴</title></head>");
		out.println("<body>");
		out.println("<h3>오늘 점심은</h3>");
		
		//배열 생성
		String[] values = request.getParameterValues("lunch");
		if(values !=null) {
			//아무것도 제출안했을 경우 NullPointerException이 발생
			for(int i=0; i<values.length; i++) {
				out.println(values[i]+"<br>");
				}
		}else {//전송된 데이터가 없는 경우
			out.println("선택한 점심 메뉴가 없습니다.");
		}
		
		out.println("</body>");
		out.println("</html>");
		
		out.close();
	}
}
