package kr.web.ch04;

import java.io.PrintWriter;
import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;

@WebServlet("/lifeCycle")
public class LifeCycle extends HttpServlet {
	int initCnt = 0;
	int serviceCnt = 0;
	int destroyCnt = 0; 
	
	@Override
	public void init()throws ServletException{//서버호출
		System.out.println("init 메서드는 메서드는 첫 요청만 호출 됨 : " + (++initCnt));
	}
	@Override
	public void service(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		System.out.println("service 메서드가 요청할 때마다 호출됨." + (++serviceCnt));
		//문서타입 및 캐릭터 셋 지정
		response.setContentType("text/html;charset=utf-8");
		//HTML 출력을 위한 출력 스트림 생성
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>Servlet Life Cycle</title></head>");
		out.println("<body>");
		out.println("서블릿 init() 메서드 호출 횟수 : " + initCnt + "<br>");
		out.println("서블릿 service() 메서드 호출 횟수 : " + serviceCnt);
		
		out.println("</body>");
		out.println("</html>");
		
		out.close();
		
	}
	@Override
	public void destroy(){//자원정리
		System.out.println("destroy 메서드는 본 Servlet이 더 이상 사용되지 않을 때만 호출됨 " + (++destroyCnt));
	}
	
}
