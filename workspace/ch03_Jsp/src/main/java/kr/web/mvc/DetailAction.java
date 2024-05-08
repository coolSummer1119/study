package kr.web.mvc;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//request에 데이터 저장
		request.setAttribute("detail", "글 상세페이지 입니다.");
		//jsp경로 반환
		return "/views/detail.jsp";
		
	}

}
