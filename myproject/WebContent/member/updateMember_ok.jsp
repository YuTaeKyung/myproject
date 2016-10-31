<%@page import="myproject.member.model.MemberVO"%>
<%@page import="myproject.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="../login/loginCheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String pwd2 = request.getParameter("pwd2");
	String hp = request.getParameter("hp");
	String email = request.getParameter("eamil");
	String zipcode = request.getParameter("zipcode");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	
	MemberDAO dao = new MemberDAO();
	MemberVO vo = new MemberVO();
	vo.setName(name);
	vo.setUserid(userid);
	vo.setPwd(pwd2);
	vo.setHp(hp);
	vo.setEmail(email);
	vo.setZipcode(zipcode);
	vo.setAddress(addr1);
	vo.setAddressDetail(addr2);
	int cnt = 0;
	String msg = "", url = "";
	int result = dao.loginCheck(userid, pwd);
	if(result == dao.LOGIN_OK){
		cnt = dao.updateMember(vo);
		if(cnt>0){
			msg = "정보 수정 완료";
			url = "/index.jsp";
		} else{
			msg = "수정 실패!!";
			url = "/member/updateMember.jsp";
		}
	} else if(result == dao.PWD_DISMATCH){
		msg = "현재 비밀번호가 틀렸네요  다시 입력해주세요";
		url = "/member/updateMember.jsp";
	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>