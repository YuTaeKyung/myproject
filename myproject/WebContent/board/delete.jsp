<%@page import="myproject.board.model.BoardVO"%>
<%@page import="myproject.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file='../inc/top.jsp'%>
<%
	String no = request.getParameter("no");
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#pwd").focus();
		$("#frm1").submit(function(){
			if($("#pwd").val().length<1){
				alert("비밀번호를 입력하세요");
				$("#pwd").focus();
				return false;
			}
		});
	});
</script>

<article>
<div class = "col-sm-8">
<fieldset>
<legend style="color:white;font-weight:bold; text-align:center">글 삭제</legend>
	<form id="frm1" name="frm1" method="post" action="delete_ok.jsp"
		class="form-horizontal">
		<div class="form-group">
			<label for="pwd" class="control-label col-sm-3">비밀번호</label>
			<div class="col-sm-3">
				<input type="password" name="pwd" id="pwd" class="form-control">
			</div>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-danger form-control">삭제</button>
			</div>
				
			<div class="col-sm-2">
				<button type="reset" class="btn btn-success form-control">취소</button>
			</div>
			<div class="col-sm-2">
				<button type="button" onclick="location.href='list.jsp'" class="btn btn-primary form-control">글목록</button>
			</div>

				<input type = "hidden" name="no" value = "<%=no%>">
		</div>
	</form>
</fieldset>	
</div>
</article>
<%@include file='../inc/bottom.jsp'%>