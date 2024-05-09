package kr.news.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.news.dao.NewsDAO;
import kr.news.vo.NewsVO;

public class ModifyAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//전송된 데이터 인코딩 타입 지정
		request.setCharacterEncoding("utf-8");
		//자바 빈 생성
		NewsVO newsVO = new NewsVO();
		newsVO.setNum(Integer.parseInt(request.getParameter("num")));
		newsVO.setTitle(request.getParameter("title"));
		newsVO.setWriter(request.getParameter("writer"));
		newsVO.setPasswd(request.getParameter("passwd"));
		newsVO.setEmail(request.getParameter("email"));
		newsVO.setArticle(request.getParameter("article"));
		newsVO.setFilename(request.getParameter("filename"));
		
		NewsDAO dao = NewsDAO.getInstance();
		//비밀번호 인증을 위해 한건의 레코드를 자바빈에 전송
		NewsVO db_news = dao.getNews(newsVO.getNum());
		boolean check = false;
		if(db_news != null) {
			check = db_news.isCheckedPassword(newsVO.getPasswd());
		}
		if(check) {//비밀번호 일치
			dao.updateNews(newsVO);//글수정
			//상세페이지로 이동하기 위해 글번호 저장
			request.setAttribute("num", newsVO.getNum());
		}
		return "/WEB-INF/views/modify.jsp";
	}

}