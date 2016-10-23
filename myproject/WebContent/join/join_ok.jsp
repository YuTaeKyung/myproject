<%@page import="myproject.member.model.MemberVO"%>
<%@page import="myproject.member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");
	String email = request.getParameter("email");
	String hp = "";
	if(!hp1.isEmpty() && !hp2.isEmpty() && !hp3.isEmpty()){
		hp = hp1+hp2+hp3;
	}
	
	MemberDAO dao = new MemberDAO();
	int cnt = 0;
	MemberVO vo = new MemberVO();
	vo.setName(name);
	vo.setUserid(userid);
	vo.setPwd(pwd);
	vo.setHp(hp);
	vo.setEmail(email);
	
	cnt = dao.insertMember(vo);
	
	if(cnt>0){
	%> <script type="text/javascript">
		alert("회원가입이 정상 처리 되었습니다");
		location.href="../index.jsp";
	</script>
	<%	
	} else{
	%>
	<script type="text/javascript">
		alert("회원가입 실패!");
		history.back();
	</script>
	<%} %>
