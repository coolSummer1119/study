package kr.board.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteFormAction implements kr.controller.Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// JSP 경로반환
		return "/WEB-INF/views/writeForm.jsp";
	}
}
