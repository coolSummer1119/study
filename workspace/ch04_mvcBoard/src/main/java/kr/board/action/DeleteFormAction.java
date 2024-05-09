package kr.board.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;

public class DeleteFormAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
		int num = Integer.parseInt(request.getParameter("num"));
		
		request.setAttribute("num", num);
		//JSP경로 반환
		return "/WEB-INF/views/deleteForm.jsp";
	}

}
