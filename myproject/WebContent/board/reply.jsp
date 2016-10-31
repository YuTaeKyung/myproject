<%@page import="myproject.board.model.BoardVO"%>
<%@page import="myproject.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "../inc/top.jsp"%>
<%
	String no = request.getParameter("no");
	
	String msg = "", url = "/board/list.jsp";
	
	if(no==null || no.isEmpty()){
		msg = "잘못된 URL 입니다!";
		request.setAttribute("msg", msg);
		request.setAttribute("url", url); 
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
<%}
request.getParameter("no");
BoardDAO dao = new BoardDAO();
BoardVO vo = dao.selectByNo(Integer.parseInt(no));
	



%>


<script type="text/javascript">
	$(document).ready(function(){
		$("#boardfrm").submit(function(){
			if($("#name").val().length<1){
				alert("이름을 입력하세요");
				$("#name").focus();
				return false;
			} else if($("#pwd").val().length<1){
				alert("비밀번호를 입력하세요");
				$("#pwd").focus();
				return false;
			} else if($("#title").val().length<1){
				alert("제목을 입력하세요");
				$("#title").focus();
				return false;
			}
		});
	});
</script>


<div class="col-sm-offset-2 col-sm-10">
<h1>답변 글쓰기</h1>

</div>
<form id="boardfrm" name="boardfrm" method="post" action="reply_ok.jsp"
	enctype="multipart/form-data" class="form-horizontal">
		
		<input type="hidden" name="groupNo" value= "<%=vo.getGroupNo() %>">
		<input type="hidden" name="sortNo" value= "<%=vo.getSortNo() %>">
		<input type="hidden" name="step" value= "<%=vo.getStep() %>">
		
		
	<div class="form-group">	

		<label for="name" class="control-label col-sm-2">작성자
			:</label>
		<div class="col-sm-4">
			<input id="name" type="text" name="name" class="form-control">
		</div>
		
	</div>	
	
	<div class="form-group">
		<label for="pwd" class="control-label col-sm-2">비밀번호
			:</label>
		<div class="col-sm-4">
			<input type="password" name="pwd" class="form-control">
		</div>
	</div>
	
	<div class="form-group">	
		<label for="title" class="control-label col-sm-2">제목
			:</label>
		<div class="col-sm-4">
			<input type="text" name="title" class="form-control"
			value="RE : <%=vo.getTitle()%>">
		</div>	
	</div>
		
	<div class="form-group">	
		<label for="email" class="control-label col-sm-2">이메일
			:</label>
		<div class="col-sm-4">
			<input type="text" name="email" class="form-control" >
		</div>	
	</div>
	
	<div class="form-group">
		<label for="upfile" class="control-label col-sm-2">첨부파일 :</label>
		<div class="col-sm-4">
			<input type="file" name="upfile" class="form-control">
		</div>	
	</div>	
	
	<div class="form-group">
		<label for="content" class="control-label col-sm-2">내용 :</label>
		<div class="col-sm-6">
			<textarea class="ckeditor form-control" name="content"></textarea>
		</div>	
	</div>
	
	
		<div class="text-center">
			<input type="submit" value="답변등록" class="btn btn-success"> 
			<input type="button" value="글목록" class="btn btn-info"
				onclick="location.href='list.jsp'">
		</div>
	
</form>








<%@include file= "../inc/bottom.jsp"%>
