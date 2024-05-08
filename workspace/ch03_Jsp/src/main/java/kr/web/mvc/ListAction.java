package kr.web.mvc;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		//request에 데이터 저장
		request.setAttribute("message","목록 페이지입니다.");
		//JSP 경로 반환
		return "/views/list.jsp";
	}

}