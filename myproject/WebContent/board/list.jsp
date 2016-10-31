<%@page import="myproject.common.Utility"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="myproject.board.model.BoardVO"%>
<%@page import="myproject.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String category = request.getParameter("category");
	String keyword  = request.getParameter("keyword");

		
	String align ="";
	
	if(request.getParameter("align")!=null && !request.getParameter("align").isEmpty()){
				align = request.getParameter("align");
	}
	
	
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	List<BoardVO> alist = new ArrayList<BoardVO>();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	alist = dao.selectAll(category,keyword,align);
	
	
	
	int currentPage = 1;
	if(request.getParameter("currentPage")!=null 
			&& !request.getParameter("currentPage").isEmpty()){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int pageSize = 10;
	int blockSize = 5;
	int totalRecord = 0;
	if(alist!=null){
		totalRecord = alist.size();
	}
	
	int totalPage = (int)Math.ceil(((float)totalRecord/pageSize));
	int firstPage = currentPage - ((currentPage-1)% blockSize);
	int lastPage = firstPage + (blockSize - 1);
	int curPos = (currentPage -1) * pageSize;
	int num = totalRecord - curPos;
	
	
	
	
	
%>
<%@include file="../inc/top.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("tbody tr").hover(function(){
			$(this).css("background","pink");
		},function(){
			$(this).css('background','');
		});
	});
</script>
<div class="col-sm-offset-2 col-sm-10">
<h1>자유 게시판</h1>

</div>
<div class="row" style="margin-bottom:30px;">
	<div class="col-sm-12 text-center">
		<form name="frm1" id="frm1" method="post" action="list.jsp" class="form-inline">
		<div class="form-group">
			<select name="category" style="color:black" class="form-control">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="name">작성자</option>
			</select>
			</div>
			<div class="form-group">
			<input type="text" name="keyword" style="color:black;" class="form-control">
			<button type="submit" class="btn btn-primary">검색</button>
			<a href="write.jsp" class="btn btn-success">글쓰기</a>
			</div>
		</form>
	</div>
</div>
<div class="col-sm-offset-2 col-sm-8">
<table class="table table-condensed">
	<colgroup>
		<col style="width: 10%;">
		<col style="width: 35%;">
		<col style="width: 10%;">
		<col style="width: 15%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
	</colgroup>
	<thead>
		<tr>
			<th class="text-center"><a href="list.jsp?align=no">번호</a></th>
			<th class="text-center"><a href="list.jsp?align=title">제목</a></th>
			<th class="text-center"><a href="list.jsp?align=name">작성자</a></th>
			<th class="text-center"><a href="list.jsp?align=regdate">작성일</a></th>
			<th class="text-center"><a href="list.jsp?align=readcount">조회수</a></th>
			<th class="text-center"><a href="list.jsp?align=good">좋아요</a></th>
			<th class="text-center"><a href="list.jsp?align=bad">싫어요</a></th>
		</tr>
	</thead>
	<tbody>
		<%
			if(alist.size()==0){
		%>		
				<tr>
					<td colspan="7" class="text-center">해당 데이터가 존재하지 않습니다.</td>
				</tr>
		<%	} else{
		
			for (int i = 0; i < pageSize; i++) {
				if(num<1){break;}
				
				vo = alist.get(curPos++);
				num--;
		%>
		<tr>
			<td class="text-center"><%=vo.getNo()%></td>
			<td class="text-left">
			<%=Utility.displayRe(vo.getStep()) %>
			<%=Utility.displayNew(vo.getRegdate()) %>
			<%=Utility.displayFile(vo.getFileName()) %>
			<a href="readcountUp.jsp?no=<%=vo.getNo()%>"><%=vo.getTitle()%></a></td>
			<td class="text-center"><%=vo.getName()%></td>
			<td class="text-center"><%=sdf.format(vo.getRegdate())%></td>
			<td class="text-center"><%=vo.getReadcount()%></td>
			<td class="text-center"><%=vo.getGood() %></td>
			<td class="text-center"><%=vo.getBad() %></td>
		</tr>
		<%
			}
		}
		%>
	</tbody>
</table>
</div>
		<!-- <div class="col-sm-12 text-center">
			<button class="btn btn-primary" id="showBtn">더보기</button>
		</div> -->
	<div class="col-sm-offset-2 col-sm-8">
		<nav aria-label="Page navigation" class="text-center">
			<ul class="pagination">
			
			<%if (firstPage>1){ %>
				<li>
					<a href="list.jsp?currentPage=<%=firstPage -1 %>" 
					aria-label="Previous">
						<span aira-hidden="true">&laquo;</span>
					</a>
				</li>
				<%} %>
				<%for(int i= firstPage; i<=lastPage; i++){
					if(i> totalPage){break;}
					
					if(i == currentPage){
				 %>
					<li class="active"><a href=""><%=i%></a></li>
				<%}else {%>
				<li>
					<a href=list.jsp?currentPage=<%=i%>><%=i %></a>
				</li>
				<%}//else
					}//for%>
				
				<%if(lastPage<totalPage){ %>
				<li>
					<a href="list.jsp?currentPage=<%=lastPage+1 %>" 
					aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
				<%} %>
			</ul>
		</nav>
	</div>


<%@include file="../inc/bottom.jsp"%>