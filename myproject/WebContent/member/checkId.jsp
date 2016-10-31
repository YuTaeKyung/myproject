<%@page import="myproject.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	MemberDAO dao = new MemberDAO();
	int cnt = 1;
	
	String msg = "";
	if(userid!=null && !userid.isEmpty()){
		cnt =dao.checkId(userid);
		if(cnt>0){
			msg = "이미 있는 아이디 입니다.";
		} else{
			msg = "사용 가능한 아이디 입니다.";
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 체크</title>
<style>
body{background:black; color:white;}
</style>
</head>
<body>
<script type="text/javascript" src ="../jquery/jquery-3.1.0.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#userid").focus();
			$("#frmIdChk").submit(function(){
				if($("#userid").val().length<1){
					alert("아이디를 입력하세요");
					$("#userid").focus();
					return false;
				}
			});
			$("#btUse").click(function(userid){
				opener.document.joinfrm.userid.value="<%=userid%>";
				opener.document.joinfrm.chkId.value = 'Y';
				self.close();
			});
		});
	</script>
	<h2>아이디 중복 체크</h2>
	<hr>
	<form name="frmIdChk" id="frmIdChk" method="post" action="checkId.jsp">
		<input type="text" id="userid" name="userid" value="<%=userid %>">
		<input type="submit" value="아이디 확인">
		<br><br>
		<span><%=msg %></span>
		<%if(cnt==0){ %>
		<input type="button" value="사용하기" id="btUse">
		<span>사용하기 버튼을 눌러 주세요.</span>
		<%} %>
	</form>
</body>
</html>