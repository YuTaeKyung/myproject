<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
		String login_id = (String)session.getAttribute("userid");
    	boolean login = false;
    	if(login_id!=null && !login_id.isEmpty()){
    		login = true;
    	}
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath()%>/bs3/css/bootstrap.min.css?ver=8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css?ver=8">
<title>LIVERPOOL</title>

<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-3.1.0.min.js?ver=8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js?ver=8"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/bs3/js/bootstrap.min.js?ver=8"></script>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<header style="margin: 20px 0">
				<div class="col-sm-6">
					<a href="<%=request.getContextPath()%>/index.jsp">
					<img id="logo" src="<%=request.getContextPath()%>/images/리버풀로고.jpg"></a>
				</div>
				
				<%if(!login){ %>
				<div class="col-sm-6 pull-right" style="padding-top:40px">
					<button class="btn btn-danger"
					onclick="location.href='<%=request.getContextPath()%>/member/join.jsp'">회원가입</button>
					<button class="btn btn-success"
					onclick = "location.href='<%=request.getContextPath() %>/login/login.jsp'"
					data-toggle="modal" data-target="#loginmodal">로그인</button>
					<button class="btn btn-warning"
					onclick = "location.href='<%=request.getContextPath()%>/member/findMember.jsp'">아이디/비번 찾기</button>
				</div>
			<%}else{ %>
			<div class="col-sm-6 pull-right" style="padding-top:40px">
					<button class="btn btn-danger"
					onclick="location.href='<%=request.getContextPath()%>/member/updateMember.jsp'">회원정보수정</button>
					<button class="btn btn-success"
					onclick="location.href='<%=request.getContextPath()%>/login/logout.jsp'">로그아웃</button>
					<button class="btn btn-warning"
					onclick="location.href='<%=request.getContextPath() %>/member/myInfo.jsp'">마이페이지</button>
					<button class="btn btn-default"
					onclick="location.href='<%=request.getContextPath() %>/member/memberOut.jsp'">회원탈퇴</button>
					<button class="btn btn-primary"
					onclick="location.href='<%=request.getContextPath() %>/Q&A/Q&A.jsp'">Q&A</button>
				</div>
			<%} %>
			</header>
		</div>
	</div>
	
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12 text-center">
				<nav>
					<ul>
						<li><a href="<%=request.getContextPath()%>/intro/intro.jsp">Intro</a></li>
						<li><a href="<%=request.getContextPath()%>/news/news.jsp">News</a></li>
						<li><a href="<%=request.getContextPath()%>/player/player.jsp">Player</a></li>
						<li><a href="<%=request.getContextPath()%>/schedule/schedule.jsp">Schedule</a></li>
						<li><a href="<%=request.getContextPath()%>/board/list.jsp">Board</a></li>
						<li><a href="<%=request.getContextPath()%>/utility/utility.jsp">Utility</a></li>
						<li><a href="<%=request.getContextPath()%>/gallery/gallery.jsp">Gallery</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
	
	
	
	<aside></aside>
	
	
	
		
	<section>