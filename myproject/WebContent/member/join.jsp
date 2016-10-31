<%@page import="myproject.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>

<script>
$(document).ready(function(){
	$("#joinfrm").submit(function(){
		if($("#name").val().length<1){
			alert("이름을 입력하세요");
			$("#name").focus();
			return false;
		}else if($("#userid").val().length<1){
			alert("아이디를 입력하세요");
			$("#userid").focus();
			return false;
		}else if($("#pwd").val().length<1){
			alert("비밀번호를 입력하세요");
			$("#pwd").focus();
			return false;
		}else if($("#pwd2").val().length<1){
			alert("비밀번호확인 입력하세요");
			$("#pwd2").focus();
			return false;
		}else if($("#pwd").val()!=$("#pwd2").val()){
			alert("비밀번호가 일치하지 않습니다!!");
			$("#pwd2").focus();
			return false;
		}else if($("#chkId").val()!="Y"){
			alert("아이디 중복확인을 하셔야 합니다!");
			$("#chkIdbtn").focus();
			return false;
		}  else if(!validate_userid($("#userid").val())){
			alert("아이디는 영 대소문자나 숫자 또는 _ 로 시작하고 끝나야 합니다");
			$("#userid").focus();
			return false;
		} else if($("#hp").val() != null && $("#hp").val().length>0){
			if(!validate_hp($("#hp").val())){
				alert("핸드폰번호는 숫자만 입력 가능합니다");
				$("#hp").focus();
				return false;
		} 
			
			
		} 
	});
	
	$("#chkIdbtn").click(function(){
		var userid = $("#userid").val();
		window.open("checkId.jsp?userid="+userid,"chkid",
				"left=100,top=100,width=400,height=250,location=yes,resizable=yes");
	});
	
	$("#findzipcode").click(function(){
		window.open("../zipcode/zipcode.jsp","zip",
				"left=10,top=20,width=400,height=500,location=yes,resizable=yes");
	});
	
	
	
	function validate_userid(id){
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(id);
	}
	function validate_hp(hp){
		var pattern = new RegExp(/^[0-9]+$/g);
		return pattern.test(hp);
	}
}); 



</script>
<form name="joinfrm" id="joinfrm" method="post" action="join_ok.jsp"
	class="form-horizontal">
	<fieldset>
		<legend class="text-center"
			style="font-size: 36px; color: darkred; font-weight: bold;">회원
			가입</legend>

		<div class="form-group">
			<label for="name" class="control-label col-sm-4">이름 :</label>
			<div class="col-sm-2">
				<input type="text" id="name" name="name" class="form-control">
			</div>

		</div>

		<div class="form-group">
			<label for="userid" class="col-sm-4 control-label">아이디 :</label>
			<div class="col-sm-2">
				<input type="text" id="userid" name="userid" class="form-control">
			</div>
			<div class="col-sm-1">
				<button type="button" id="chkIdbtn" name="chkIdbtn"
					class="form-control btn btn-primary">중복확인</button>
			</div>
		</div>

		<div class="form-group">
			<label for="pwd" class="col-sm-4 control-label">비밀번호 :</label>
			<div class="col-sm-2">
				<input type="password" id="pwd" name="pwd" class="form-control">
			</div>
		</div>

		<div class="form-group">
			<label for="pwd2" class="col-sm-4 control-label">비밀번호 확인 :</label>
			<div class="col-sm-2">
				<input type="password" id="pwd2" name="pwd2" class="form-control">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-4 control-label" for="hp">핸드폰 :</label>
			<div class="col-sm-2">
				<input type="text" id="hp" name="hp" class="form-control">
			</div>
			<label class="control-label" style="color: red"> ㅡ 를 빼고 입력해
				주세요!</label>
		</div>

		<div class="form-group">
			<label for="email" class="col-sm-4 control-label">이메일 :</label>
			<div class="col-sm-2">
				<input type="email" id="email" name="email" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="zipcode" class="col-sm-4 control-label">주소 :</label>
			<div class="col-sm-1">
				<input type="text" id="zipcode" name="zipcode" class="form-control"
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
				<input type="text" name="addr1" id="addr1" class="form-control"
					readonly>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label" for="addr2">상세 주소 :</label>
			<div class="col-sm-3">
				<input type="text" id="addr2" name="addr2" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-4">
				<button type="submit" class="btn btn-success" class="form-control">회원가입</button>
				<button type="reset" class="btn btn-warning" class="form-control">취소</button>
			</div>

		</div>
		<input type="hidden" name= "chkId" id="chkId">
	</fieldset>
</form>
<%@include file="../inc/bottom.jsp"%>

