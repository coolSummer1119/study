package kr.web.ch05;

import java.io.PrintWriter;
import java.io.IOException;
import java.util.Collection;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
@MultipartConfig(
		maxFileSize = 1024*1024*10,
		maxRequestSize = 1024*1024*50
		)
@WebServlet("/fileMultiUpload")
public class UploadServlet2 extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		//컨텍스트 경로상의 파일 업로드 절대 경로 구하기
		String realFolder=request.getServletContext().getRealPath("/upload");
		
		response.setContentType("text/html;charset=utf-8");
		
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		try {
			out.println("작성자 : " + request.getParameter("name")+"<br>");
			out.println("제목 : " + request.getParameter("title")+"<br>");
			out.println("-----------------------------------<br>");
			
			/*
			 * Part part1 = request.getPart("uploadFile1"); String fileName =
			 * part1.getSubmittedFileName(); if(!fileName.isEmpty()) {
			 * part1.write(realFolder+"/"+fileName);
			 * out.println("<image src=\"/ch03_Jsp/upload/"+fileName+"\">"); } Part part2 =
			 * request.getPart("uploadFile2"); String fileName2 =
			 * part2.getSubmittedFileName(); if(!fileName2.isEmpty()) {
			 * part2.write(realFolder+"/"+fileName2);
			 * out.println("<image src=\"/ch03_Jsp/upload/"+fileName2+"\">"); }
			 */
			Collection<Part> parts= request.getParts();
			for(Part p : parts) {
				String collectFileName = p.getSubmittedFileName();
				if(!collectFileName.isEmpty() && collectFileName!=null) {
					p.write(realFolder+"/"+collectFileName);
					out.println("<image src=\"/ch03_Jsp/upload/"+collectFileName+"\"><br>"); 
				}
			}
			
		}catch(IllegalStateException e) {
			out.println("용량 초과 : "+e.toString());
		}
	}
}