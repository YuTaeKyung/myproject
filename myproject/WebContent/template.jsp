<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/bs3/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main.css">

<title>template.jsp</title>
</head>
<body>
	<div class="container" id="hdrbtn">
		<header>

		<div class="row">
			<div class="col-sm-6">
				<h1>
					<a href="index.jsp"> <img id="logo" src="<%=request.getContextPath() %>/images/리버풀로고.jpg">
					</a>
				</h1>

			</div>
			<div class="col-sm-offset-1 col-sm-4">
				<div class="text-right" id="hdrbtn">
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#loginmodal">로그인</button>
					<button id="joinbtn" type="button" class="btn btn-default">회원가입</button>
				</div>
			</div>
		</div>

		</header>
	</div>


	<nav>
	<div>
		<ul id="navlist">
			<li><a href="<%=request.getContextPath()%>/news/list.jsp">뉴스</a></li>
			<li><a href="<%=request.getContextPath()%>/board/list.jsp">자유게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/utility/list.jsp">자료실</a></li>
			<li><a href="<%=request.getContextPath()%>/player/list.jsp">선수명단</a></li>
			<li><a href="<%=request.getContextPath()%>/schedule/list.jsp">경기일정</a></li>
		</ul>
	</div>
	</nav>

	<section></section>

	<footer></footer>







	<!-- 로그인 모달 -->
	<div id="loginmodal" class="modal fade" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h2>
						로그인
						<button class="btn btn-default pull-right" data-dismiss="modal">닫기</button>
					</h2>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" name="loginfrm" method="post"
						action="index.jsp">
						<div class="form-group">
							<label for="userid" class="col-sm-4 control-label">아이디</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="userid"
									id="userid">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">비밀번호</label>
							<div class="col-sm-4">
								<input type="password" class="form-control">
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<div style="text-align: center">
						<button type="submit" class="btn btn-primary">로그인</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 로그인 모달 끝 -->
	
	
	<script type="text/javascript" src="bs3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="jquery/jquery-3.1.0.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#joinbtn").click(function(){
				location.href="<%=request.getContextPath()%>/join/join.jsp";
			});
		});
	</script>
</body>
</html>