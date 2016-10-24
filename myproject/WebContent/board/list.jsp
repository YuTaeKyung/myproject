<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="myproject.board.model.BoardVO"%>
<%@page import="myproject.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	List<BoardVO> alist = new ArrayList<BoardVO>();
	
	alist = dao.selectAll();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%
			for(int i=0; i<alist.size();i++){
				vo = alist.get(i);
		%>		<tr>
					<td><%=vo.getNo() %></td>
					<td><%=vo.getTitle() %></td>
					<td><%=vo.getName() %></td>
					<td><%=vo.getRegdate() %></td>
					<td><%=vo.getReadcount() %></td>
				</tr>
		<%		
			}
		%>
	</table>
	
</body>
</html>