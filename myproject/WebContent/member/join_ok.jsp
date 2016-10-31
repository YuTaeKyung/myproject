<%@page import="myproject.board.model.BoardDAO"%>
<%@page import="myproject.member.model.MemberVO"%>
<%@page import="myproject.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String hp = request.getParameter("hp");
	String email = request.getParameter("email");
	String zipcode = request.getParameter("zipcode");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");

	MemberDAO dao = new MemberDAO();
	MemberVO vo = new MemberVO();
	vo.setName(name);
	vo.setUserid(userid);
	vo.setPwd(pwd);
	vo.setHp(hp);
	vo.setEmail(email);
	vo.setZipcode(zipcode);
	vo.setAddress(addr1);
	vo.setAddressDetail(addr2);

	int cnt = 0;
	cnt = dao.insertMember(vo);
	
	String msg = "", url = "";
	if(cnt>0){
		msg= "회원 가입이 완료됐습니다. 감사합니다";
		url= "/index.jsp";
	} else{
		msg="회원가입에 실패 하였습니다";
		url = "/join/join.jsp";
	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<<jsp:forward page="../common/message.jsp"></jsp:forward>
