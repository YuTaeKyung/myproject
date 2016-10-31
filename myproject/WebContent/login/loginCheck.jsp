<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginId = (String)session.getAttribute("userid");
	if(loginId == null || loginId.isEmpty()){
		request.setAttribute("msg", "로그인 후 이용 가능합니다!");
		request.setAttribute("url", "/login/login.jsp");
	}
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>