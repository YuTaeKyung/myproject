<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<%@include file="../login/loginCheck.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		$("#outfrm").submit(function() {
			if ($("#password").val().length < 1) {
				alert("비밀번호를 입력하세요");
				$("#password").focus();
				return false;
			}
		});
	});
</script>


<form id="outfrm" name="outfrm" method="post"
	class="form-horizontal"
	action="<%=request.getContextPath()%>/member/memberOut_ok.jsp">
	<div class="col-sm-offset-4 col-sm-8">
		<h3>회원 탈퇴</h3>
	</div>
	<div>
		<div class="form-group">
			<label for="password" class="control-label col-sm-4">비밀번호</label>
			<div class="col-sm-2">
				<input type="password" name="password" id="password"
					class="form-control">
			</div>
		</div>
	</div>
	<div class="col-sm-offset-4 col-sm-4">
		<button type="submit" class="btn btn-primary">탈퇴</button>
		<button type="reset" class="btn btn-warning">취소</button>
	</div>
</form>



<%@include file="../inc/bottom.jsp"%>