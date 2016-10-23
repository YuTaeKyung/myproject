<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@include file=""%> --%>


<form name="joinfrm" id="joinfrm" method="post" action="join_ok.jsp">
	이름 : <input type="text" name="name"><br>
	아이디 : <input type="text" name="userid"><br>
	비밀번호 : <input type="password" name="pwd"><br>
	비밀번호 확인 : <input type="password" name="pwd2"><br>
	핸드폰 : 	<select name="hp1">
				<option>010</option>		
			  </select> - 
			  <input type="text" name="hp2"> - <input type="text" name="hp3"><br>
	이메일 : <input type="text" name="email"><br><br>
	
	<button type="submit" class="btn btn-success">회원가입</button>
					  
	
</form>












<%-- <%@include file=""%> --%>