<%@page import="myproject.common.Utility"%>
<%@page import="myproject.board.model.BoardVO"%>
<%@page import="myproject.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<script	type="text/javascript">
	$(document).ready(function(){
		$("#boardfrm").submit(function(){
			if($("#pwd").val().length<1){
				alert("비밀번호를 입력하세요");
				$("#pwd").focus();
				return false;
			}
		});
		
	});
</script>
<%
	String no = request.getParameter("no");

	if(no==null || no.isEmpty()){
%> 		<script type="text/javascript">
			alert("잘못된 url 입니다.");
			location.href="list.jsp";
		</script>		
<%		return ;
	}

	BoardDAO dao = new BoardDAO();
	BoardVO vo = dao.selectByNo(Integer.parseInt(no));
	
	String email = vo.getEmail();
	String content = vo.getContent();
	if(email==null){
		email = "";
	}
	if(content == null){
		content = null;
	}
	
	String fileName = vo.getFileName();
	String fileInfo = "";
	float fileSize = (float)vo.getFileSize()/1000;
	if(fileName!=null && !fileName.isEmpty()){
		fileInfo = Utility.displayFile(fileName)+ " " + fileName
				+ " (" + fileSize+ " KB)";
	}
%>

<div class="col-sm-offset-2 col-sm-10">
<h1>글 수정</h1>

</div>
<form id="boardfrm" name="boardfrm" method="post" action="edit_ok.jsp"
	enctype="multipart/form-data" class="form-horizontal">
		<input type = "hidden" name ="no" value="<%=no %>">
		<input type = "hidden" name ="oldFileName" value="<%=fileName %>">
		
		
	<div class="form-group">	

		<label for="name" class="control-label col-sm-2">작성자
			:</label>
		<div class="col-sm-4">
			<input id="name" type="text" name="name" class="form-control"
			value="<%=vo.getName()%>">
		</div>
		
	</div>	
	
	<div class="form-group">
		<label for="pwd" class="control-label col-sm-2">비밀번호
			:</label>
		<div class="col-sm-4">
			<input id="pwd" type="password" name="pwd" class="form-control">
		</div>
	</div>
	
	<div class="form-group">	
		<label for="title" class="control-label col-sm-2">제목
			:</label>
		<div class="col-sm-4">
			<input type="text" name="title" class="form-control"
			value="<%=vo.getTitle()%>">
		</div>	
	</div>
		
	<div class="form-group">	
		<label for="email" class="control-label col-sm-2">이메일
			:</label>
		<div class="col-sm-4">
			<input type="text" name="email" class="form-control" 
			value="<%=email%>">
		</div>	
	</div>
	
	<div class="form-group">
		<label for="upfile" class="control-label col-sm-2">첨부파일 :</label>
		<div class="col-sm-4">
			<input type="file" name="upfile" class="form-control">
		</div>	
	</div>	
	
	<div class="form-group">
		<label for="fileList" class="control-label col-sm-2">첨부파일 목록 :</label>
		<div class="col-sm-4">
			<%if(fileName!= null && !fileName.isEmpty()){ %>
			<%=fileInfo %><br>
			
			<span style="color: red;font-weight: bold">
			첨부파일을 새로 등록할 경우 기존 파일은 삭제 됩니다.</span>
			<%} %>
		</div>
	</div>
	
	
	
	<div class="form-group">
		<label for="content" class="control-label col-sm-2">내용 :</label>
		<div class="col-sm-6">
			<textarea class="ckeditor form-control" name="content">
			<%=content %>
			</textarea>
		</div>	
	</div>
	
	
		<div class="text-center">
			<input type="submit" value="수정" class="btn btn-warning"> 
			<input type="button" value="글목록" class="btn btn-info"
				onclick="location.href='list.jsp'">
		</div>
	
</form>









<%@include file="../inc/bottom.jsp"%>

