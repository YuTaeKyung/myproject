<%@page import="myproject.common.Utility"%>
<%@page import="myproject.board.model.BoardVO"%>
<%@page import="myproject.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>

<%
	String no = request.getParameter("no");
	
	String msg = "", url = "/board/list.jsp";
	
	if(no==null || no.isEmpty()){
		msg = "잘못된 URL 입니다!";
		request.setAttribute("msg", msg);
		request.setAttribute("url", url); 
%>
			<jsp:forward page="../common/message.jsp"></jsp:forward>
<%
	}

	BoardDAO dao = new BoardDAO();
	BoardVO vo = dao.selectByNo(Integer.parseInt(no));
	
	String content = vo.getContent();
	if(content!=null && !content.isEmpty()){
		content = content.replace("\r\n", "<br>");
	} else {
		content = "";
	}
	
	String email = vo.getEmail();
	if(email==null || !email.isEmpty()){
		email = "";
	}

	
	String fileInfo = "";
	String fileName =vo.getFileName();
	if(fileName!=null&& !fileName.isEmpty()){
		float fileSize = (float)vo.getFileSize()/1000;
		fileInfo = Utility.displayFile(fileName)+ " "+ fileName +
				" (" +fileSize+ " KB) 다운 : " + vo.getDowncount();
	}
	
	
%>


<div class="col-sm-offset-2 col-sm-10">
<h1>자유 게시판</h1>

</div>
<div class="form-horizontal">
		
	<div class="form-group">	

		<span class="control-label col-sm-2">작성자
			:</span>
		<div class="col-sm-4">
			<span class="form-control" style="background:black; color:white; border:0;"><%=vo.getName() %></span>
		</div>
		
	</div>	
	
	
	
	<div class="form-group">	
		<span class="control-label col-sm-2">제목
			:</span>
		<div class="col-sm-4">
			<span class="form-control" style="background:black; color:white; border:0;"><%=vo.getTitle() %></span>
		</div>	
	</div>
		
	<div class="form-group">	
		<span class="control-label col-sm-2">이메일
			:</span>
		<div class="col-sm-4">
			<span class="form-control" style="background:black; color:white; border:0;"><%=email %></span>
		</div>	
	</div>
	
	<div class="form-group">
		<span class="control-label col-sm-2">등록일
		 :</span>
		 <div class="col-sm-4">
		 	<span class="form-control" style="background:black; color:white; border:0"><%=vo.getRegdate() %></span>
		 </div>
	</div>
	
	<div class="form-group">
		<span class="control-label col-sm-2">조회수
		 :</span>
		 <div class="col-sm-4">
		 	<span class="form-control" style="background:black; color:white; border:0"><%=vo.getReadcount() %></span>
		 </div>
	</div>
	
	
	
	
	
	<div class="form-group">
		<span class="control-label col-sm-2">첨부파일 :</span>
		<div class="col-sm-4">
			<span class="form-control" style="background:black; color:white; border:0;">
				<%if(fileName!=null && !fileName.isEmpty()){ %>
				<a href="downCount.jsp?no=<%=no%>&fileName=<%=vo.getFileName()%>">
					<%=fileInfo %>
				</a><%} %>
			</span>
		</div>	
	</div>	
	
	<div class="form-group">
		<span class="control-label col-sm-2">내용 :</span>
		<div class="col-sm-6">
			<p class="ckeditor form-control" style="background:black; color:white; border:0;"><%=content %></p>
		</div>	
	</div>
	
	
		<div class="text-center">
			<div class="row" style="margin-bottom:40px;">
				<button id = "good" type="button" class="btn btn-primary"
				onclick="location.href='updateGood.jsp?no=<%=no%>'">좋아요<small>(<%=vo.getGood() %>)</small></button>
				<button id = "bad" type="button" class="btn btn-danger"
				onclick = "location.href='updateBad.jsp?no=<%=no%>'">싫어요<small>(<%=vo.getBad() %>)</small></button>
			</div>
			<input type="button" value="수정" class="btn btn-success"
				onclick = "location.href='edit.jsp?no=<%=no%>'"> 
			<input type="button" value="삭제" class="btn btn-danger"
			onclick = "location.href='delete.jsp?no=<%=no%>'"> 
			<input type="button" value="답변" class="btn btn-warning"
			onclick = "location.href='reply.jsp?no=<%=no%>'"> 
			<input type="button" value="글목록" class="btn btn-info"
				onclick="location.href='list.jsp'">
		</div>
	
</div>



<%@include file="../inc/bottom.jsp"%>