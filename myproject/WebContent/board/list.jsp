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
<%@include file="../inc/top.jsp"%>

<h1>자유 게시판</h1>
<div class="row">
	<div class="col-sm-12 text-center">
		<form name="frm1" id="frm1" method="post" action="list.jsp" class="form-inline">
		<div class="form-group">
			<select name="category" style="color:black" class="form-control">
				<option>제목</option>
				<option>내용</option>
				<option>작성자</option>
			</select>
			</div>
			<div class="form-group">
			<input type="text" name="search" style="color:black;" class="form-control">
			<button type="submit" class="btn btn-primary">검색</button>
			</div>
		</form>
	</div>
</div>
<div class="col-sm-offset-2 col-sm-8">
<table class="table table-condensed">
	<colgroup>
		<col style="width: 10%;">
		<col style="width: 40%;">
		<col style="width: 15%;">
		<col style="width: 15%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
	</colgroup>
	<thead>
		<tr>
			<th class="text-center">번호</th>
			<th class="text-center">제목</th>
			<th class="text-center">작성자</th>
			<th class="text-center">작성일</th>
			<th class="text-center">조회수</th>
			<th class="text-center">추천수</th>
		</tr>
	</thead>
	<tbody>
		<%
			for (int i = 0; i < alist.size(); i++) {
				vo = alist.get(i);
		%>
		<tr>
			<td class="text-center"><%=vo.getNo()%></td>
			<td class="text-left"><%=vo.getTitle()%></td>
			<td class="text-center"><%=vo.getName()%></td>
			<td class="text-center"><%=vo.getRegdate()%></td>
			<td class="text-center"><%=vo.getReadcount()%></td>
			<td class="text-center">0</td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
</div>



<div class="col-sm-offset-5 col-sm-5 pull-right">

	<a href="write.jsp" class="btn btn-success">글쓰기</a>
</div>




<%@include file="../inc/bottom.jsp"%>