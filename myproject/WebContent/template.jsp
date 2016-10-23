<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath()%>/bs3/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/main.css?ver=2">
<title>템플릿 페이지</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<header style="margin: 20px 0">
				<div class="col-sm-6">
					<a href="<%=request.getContextPath()%>/main.jsp">
					<img id="logo" src="<%=request.getContextPath()%>/images/리버풀로고.jpg"></a>
				</div>
				<div class="col-sm-6 pull-right" style="padding-top:40px">
					<button class="btn btn-danger">회원가입</button>
					<button class="btn btn-success">로그인</button>
					<button class="btn btn-warning">아이디/비번 찾기</button>
				</div>
			</header>
		</div>
	</div>
	
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-9 text-center">
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
	
	
	
	
	<section></section>
	
	
	
	
	<footer></footer>




<script type="text/javascript" src="<%=request.getContextPath()%>/bs3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-3.1.0.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>