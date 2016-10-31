<%@page import="myproject.member.model.MemberVO"%>
<%@page import="myproject.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<%@include file="../login/loginCheck.jsp" %>

<%
	String userid = (String)session.getAttribute("userid");
	String name= (String)session.getAttribute("userName");
	
	MemberDAO dao = new MemberDAO();
	MemberVO vo = dao.selectById(userid);
	String hp = "", email="";
	String zipcode= "";
	String addr1 = "", addr2= "";
	
	if(vo.getHp()!=null && !vo.getHp().isEmpty()){hp = vo.getHp();}
	if(vo.getEmail()!=null && !vo.getEmail().isEmpty()){email=vo.getEmail();}
	if(vo.getZipcode()!=null&&!vo.getZipcode().isEmpty()){zipcode= vo.getZipcode();}
	if(vo.getAddress()!=null&&!vo.getAddress().isEmpty()){addr1 = vo.getAddress();}
	if(vo.getAddressDetail()!=null&&!vo.getAddressDetail().isEmpty()){addr2 = vo.getAddressDetail();}
	
%>



<script>
$(document).ready(function(){
	$("#joinfrm").submit(function(){
		if($("#pwd").val().length<1){
			alert("현재 비밀번호를 입력하세요");
			$("#pwd").focus();
			return false;
		}else if($("#pwd2").val().length<1){
			alert("새 비밀번호를 입력하세요");
			$("#pwd2").focus();
			return false;
		}else if($("#pwd3").val().length<1){
			alert("비밀번호확인 입력하세요");
			$("#pwd3").focus();
			return false;
		}
		else if($("#pwd2").val()!=$("#pwd3").val()){
			alert("새비밀번호와 새비밀번호 확인이 일치하지 않습니다!!");
			$("#pwd3").focus();
			return false;
		} else if($("#hp").val() != null && $("#hp").val().length>0){
			if(!validate_hp($("#hp").val())){
				alert("핸드폰번호는 숫자만 입력 가능합니다");
				$("#hp").focus();
				return false;
		} 
			
			
		} 
	});
	
	
	
	$("#findzipcode").click(function(){
		window.open("../zipcode/zipcode.jsp","zip",
				"left=10,top=20,width=400,height=500,location=yes,resizable=yes");
	});
	
	
	
	
	function validate_hp(hp){
		var pattern = new RegExp(/^[0-9]+$/g);
		return pattern.test(hp);
	}
}); 



</script>


<form name="joinfrm" id="joinfrm" method="post" action="updateMember_ok.jsp"
	class="form-horizontal">
	<fieldset>
		<legend class="text-center"
			style="font-size: 36px; color: darkred; font-weight: bold;">회원
			정보 수정</legend>

		<div class="form-group">
			<label for="name" class="control-label col-sm-4">이름 :</label>
			<div class="col-sm-2">
				<input value="<%=name %>" readonly type="text" 
				id="name" name="name" class="form-control">
			</div>

		</div>

		<div class="form-group">
			<label for="userid" class="col-sm-4 control-label">아이디 :</label>
			<div class="col-sm-2">
				<input type="text" id="userid" name="userid" class="form-control"
				readonly value="<%=userid%>">
			</div>
		</div>

		<div class="form-group">
			<label for="pwd" class="col-sm-4 control-label">현재 비밀번호 :</label>
			<div class="col-sm-2">
				<input type="password" id="pwd" name="pwd" class="form-control">
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="pwd2" class="col-sm-4 control-label">새 비밀번호:</label>
			<div class="col-sm-2">
				<input type="password" id="pwd2" name="pwd2" class="form-control">
			</div>
		</div>
		
		
		
		
		

		<div class="form-group">
			<label for="pwd3" class="col-sm-4 control-label">비밀번호 확인 :</label>
			<div class="col-sm-2">
				<input type="password" id="pwd3" name="pwd3" class="form-control">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-4 control-label" for="hp">핸드폰 :</label>
			<div class="col-sm-2">
				<input value="<%=hp %>" 
				type="text" id="hp" name="hp" class="form-control">
			</div>
			<label class="control-label" style="color: red"> ㅡ 를 빼고 입력해
				주세요!</label>
		</div>

		<div class="form-group">
			<label for="email" class="col-sm-4 control-label">이메일 :</label>
			<div class="col-sm-2">
				<input value="<%=email %>"
				 type="email" id="email" name="email" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="zipcode" class="col-sm-4 control-label">주소 :</label>
			<div class="col-sm-1">
				<input type="text" value="<%=zipcode %>"
				 id="zipcode" name="zipcode" class="form-control"
					readonly>
			</div>
			<div class="col-sm-2">
				<button type="button" id="findzipcode"
					class="form-control btn btn-default"
					style="background: silver; color: white;">우편번호 찾기</button>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-3">
				<input value="<%=addr1 %>" 
				type="text" name="addr1" id="addr1" class="form-control"
					readonly>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label" for="addr2">상세 주소 :</label>
			<div class="col-sm-3">
				<input type="text" value="<%=addr2 %>"
				id="addr2" name="addr2" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-4">
				<button type="submit" class="btn btn-success" class="form-control">수정</button>
				<button type="reset" class="btn btn-warning" class="form-control">취소</button>
			</div>

		</div>
		<input type="hidden" name= "chkId" id="chkId">
	</fieldset>
</form>


<%@include file="../inc/bottom.jsp"%>

