<%@page import="myproject.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");
	String pwd = request.getParameter("pwd");
	
	BoardDAO dao = new BoardDAO();
	int cnt = dao.deleteBoard(Integer.parseInt(no), pwd);
	String msg = "", url ="";
	if(cnt>0){
		msg = "삭제되었습니다";
		url = "/board/list.jsp";
	} else {
		msg = "삭제 실패 ! 비밀번호를 다시 입력하세요";
		url = "/board/delete.jsp?no="+no;
	}
	
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>