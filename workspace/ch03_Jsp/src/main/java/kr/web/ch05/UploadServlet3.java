package kr.web.ch05;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.Part;

@MultipartConfig(
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1024 * 50
		)
@WebServlet("/profile")
public class UploadServlet3 extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
		//컨텍스트 경로상의 파일 업로드 절대 경로 구하기
		String realFolder = request.getServletContext().getRealPath("/upload");
		
		//문서타입 캐릭터 셋
		response.setContentType("text/html;charset=utf-8");
		
		//post 방식으로 전송된 데이터 인코딩 타입 지정
		request.setCharacterEncoding("utf-8");
		
		//html 문서 출력을 위한 출력 스트림
		PrintWriter out = response.getWriter();
		try {
			Part part = request.getPart("file");
			String fileName = part.getSubmittedFileName();
			if(!fileName.isEmpty()) {
				part.write(realFolder+"/"+fileName);
				request.setAttribute("fileName", fileName);
			}
			
			//s04_profile.jsp 포워드
			RequestDispatcher dispatcher = request.getRequestDispatcher("/ch09_fileupload/s04_profile.jsp");
			//없으면 포워드 동작을 안함
			dispatcher.forward(request, response);
			
			
			
		} catch (IllegalStateException e) {
			// TODO: handle exception
			out.println("용량 초과 : "+ e.toString());
		}
	}
}