<%@page import="myproject.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no = request.getParameter("no");
	
	BoardDAO dao = new BoardDAO();
	int cnt = dao.updateBad(Integer.parseInt(no));
	
	if(cnt>0){
		response.sendRedirect("detail.jsp?no="+no);
	}
%>