<%@page import="myproject.member.model.MemberVO"%>
<%@page import="myproject.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String pwd = request.getParameter("password");
	String id = (String)session.getAttribute("userid");
	MemberDAO dao = new MemberDAO();
	int result = dao.loginCheck(id, pwd);
	int cnt = 0;
	String msg = "", url = "";
	if(result == dao.LOGIN_OK){
		cnt = dao.deleteMember(id, pwd);
		if(cnt>0){
			msg = "탈퇴 되었습니다";
			url = "/index.jsp";
			session.invalidate();
		} else{
			msg = "탈퇴 실패!!!";
			url = "/member/memberOut.jsp";
		}
	} else if(result==dao.PWD_DISMATCH){
		msg = "비밀번호가 일치하지 않습니다";
		url = "/member/memberOut.jsp";
	}	
request.setAttribute("msg",msg);
request.setAttribute("url",url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>