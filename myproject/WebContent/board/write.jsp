<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="boardfrm" name="boardfrm" method="post" action="write_ok.jsp"
	enctype="multipart/form-data">
	작성자 : <input type="text" name="name"><br>
	비밀번호 : <input type="password" name="pwd"><br>
	제목 : <input type="text" name="title"><br>
	이메일 : <input type="text" name="email"><br>
	내용 : <textarea rows="10" cols="10" name="content"></textarea><br>
	첨부파일 : <input type="file" name="upfile"><br>
	<hr>
	<input type="submit" value="등록">
	<input type="button" value="글목록" onclick="location.href='list.jsp'">
</form>
</body>
</html>