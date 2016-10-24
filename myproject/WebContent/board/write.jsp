<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<form id="boardfrm" name="boardfrm" method="post" action="write_ok.jsp"
	enctype="multipart/form-data" class="form-horizontal">
	<div class="form-group">


		<label for="name" class="control-label col-sm-offset-1 col-sm-3">작성자
			:</label>
		<div class="col-sm-8">
			<input id="name" type="text" name="name" class="form-control"><br>
		</div>
		<label for="pwd" class="control-label col-sm-offset-1 col-sm-3">비밀번호
			:</label>
		<div class="col-sm-8">
			<input type="password" name="pwd" class="form-control"><br>
		</div>
		<label for="title" class="control-label col-sm-offset-1 col-sm-3">제목
			:</label>
		<div class="col-sm-8">
			<input type="text" name="title" class="form-control"><br>
		</div>
		<label for="email" class="control-label col-sm-offset-1 col-sm-3">이메일
			:</label>
		<div class="col-sm-8">
			<input type="text" name="email" class="form-control"><br>
		</div>
		<label for="content" class="control-label col-sm-offset-1 col-sm-3">내용
			:</label>
		<div class="col-sm-8" style="margin-bottom:30px;">
			<textarea class="form-control ckeditor" name="content"></textarea>
		</div>
		 <label for="upfile"
			class="control-label col-sm-offset-1 col-sm-3">첨부파일 :</label>
		<div class="col-sm-8">
			<input type="file" name="upfile" class="form-control"><br>
		</div>
		<div class="col-sm-12 text-center">
			<input type="submit" value="등록" class="btn btn-success"> 
			<input type="button" value="글목록" class="btn btn-info"
				onclick="location.href='list.jsp'">
		</div>
	</div>
</form>



<%@include file="../inc/bottom.jsp"%>