package kr.web.mvc;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//request에 데이터 저장   속성명      속성값
		request.setAttribute("insert", "글 등록 완료");
		//JSP 경로 반환 (VIEW)
		return "/views/write.jsp";
		
		
		
		
	}

}
