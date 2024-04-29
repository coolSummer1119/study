package kr.web.ch03;

import java.io.PrintWriter;
import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;

@WebServlet("/travel")
public class TravelServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException{
		//문서 타입 및 캐릭터 셋
		response.setContentType("text/html;charset=utf-8");
		
		//인코딩
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		
		String[] city = request.getParameterValues("city");
		//출력 스크림
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head><title>여행지</title></head>");
		out.println("<body>");
		out.println("<h3>여행지 선택</h3>");
		out.println("이름 : " + name + "<br>");
		if(city !=null) {
			for(int i=0; i<city.length;i++) {
				if(i<city.length-1) {
					out.print(city[i]+",");				
				}else {
					out.print(city[i]);				
				}			
			}
		}else {
			out.println("선택한 여행지가 없습니다.");
		}
		
		
		out.println("</body>");
		out.println("</html>");
		
		out.close();
		
	}
}