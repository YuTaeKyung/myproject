<%@page import="myproject.member.model.MemberVO"%>
<%@page import="myproject.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String saveId = request.getParameter("saveId");
	
	System.out.println(saveId);
	MemberDAO dao = new MemberDAO();
	
	int result = dao.loginCheck(id,password);
	String msg = "", url = "/index.jsp";
	if(result == dao.LOGIN_OK){
		MemberVO vo = dao.selectById(id);
		
		session.setAttribute("userid", id);
		session.setAttribute("userName", vo.getName());
		session.setAttribute("authCode", vo.getAuthCode());
		
		
		if(saveId!=null){
			Cookie ck = new Cookie("ckUserid",id);
			ck.setMaxAge(30*24*60*60);
			response.addCookie(ck);
			
		} else{
			Cookie ck = new Cookie("ckUserid",id);
			ck.setMaxAge(0);
			response.addCookie(ck);
		}
		msg = "로그인 완료!";
		
	} else if(result==dao.ID_NONE){
		msg = "로그인 실패 ! 해당 아이디가 존재 하지 않습니다 ";
	} else if(result == dao.PWD_DISMATCH){
		msg = "로그인 실패 ! 비밀번호가 일치하지 않습니다";
	} else {
		msg = "로그인 실패!!??";
	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	
	
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>