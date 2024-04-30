/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.87
 * Generated at: 2024-04-30 05:35:22 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.ch17_005fmember;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class deleteUserForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(3);
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');

	Integer user_num = (Integer)session.getAttribute("user_num");
	if(user_num==null){//로그인이 되지 않은 경우
		response.sendRedirect("loginForm.jsp");
	}else{//로그인이 된경우

      out.write("		\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>회원탈퇴</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"../CSS/style.css\" type=\"text/css\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print( request.getContextPath() );
      out.write("/js/jquery-3.7.1.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("$(function(){\r\n");
      out.write("	//이벤트 연결\r\n");
      out.write("	$('#delete_form').submit(function(){\r\n");
      out.write("		if($('#id').val().trim()==''){\r\n");
      out.write("			alert('아이디를 입력하세요');\r\n");
      out.write("			$('#id').val('').focus();\r\n");
      out.write("			return false;\r\n");
      out.write("		}\r\n");
      out.write("		if($('#passwd').val().trim()==''){\r\n");
      out.write("			alert('비밀번호를 입력하세요');\r\n");
      out.write("			$('#passwd').val('').focus();\r\n");
      out.write("			return false;\r\n");
      out.write("		}\r\n");
      out.write("		if($('#cpasswd').val().trim()==''){\r\n");
      out.write("			alert('비밀번호 확인을 입력하세요');\r\n");
      out.write("			$('#cpasswd').val('').focus();\r\n");
      out.write("			return false;\r\n");
      out.write("		}\r\n");
      out.write("		//비밀번호와 비밀번호 확인 일치 여부 체크\r\n");
      out.write("		if($('#passwd').val() != $('#cpasswd').val()){\r\n");
      out.write("			alert('비밀번호와 비밀번호 확인이 불일치 합니다.');\r\n");
      out.write("			$('#cpasswd').val('').focus();\r\n");
      out.write("			return false;\r\n");
      out.write("		}\r\n");
      out.write("		\r\n");
      out.write("	});\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"page-main\">\r\n");
      out.write("	<h1>회원탈퇴</h1>\r\n");
      out.write("	<form id=\"delete_form\" action=\"deleteUser.jsp\" method=\"post\">\r\n");
      out.write("		<ul>\r\n");
      out.write("			<li>\r\n");
      out.write("				<label for=\"id\">아이디</label>\r\n");
      out.write("				<input type=\"text\" name=\"id\" id=\"id\" maxlength=\"12\">\r\n");
      out.write("			</li>\r\n");
      out.write("			<li>\r\n");
      out.write("				<label for=\"passwd\">비밀번호</label>\r\n");
      out.write("				<input type=\"password\" name=\"passwd\" id=\"passwd\" maxlength=\"12\">\r\n");
      out.write("			</li>\r\n");
      out.write("			<li>\r\n");
      out.write("				<label for=\"passwd\">비밀번호 확인</label>\r\n");
      out.write("				<input type=\"password\" id=\"cpasswd\" maxlength=\"12\">\r\n");
      out.write("			</li>\r\n");
      out.write("		</ul>\r\n");
      out.write("		<div class=\"align-center\">\r\n");
      out.write("			<input type=\"submit\" value=\"회원탈퇴\">\r\n");
      out.write("			<input type=\"button\" value=\"홈으로\" onclick=\"location.href='main.jsp'\">\r\n");
      out.write("		</div>\r\n");
      out.write("	</form>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
	
	}

    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
