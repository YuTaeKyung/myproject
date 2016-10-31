<%@page import="myproject.zipcode.model.ZipcodeDAO"%>
<%@page import="myproject.zipcode.model.ZipcodeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    String dong = request.getParameter("dong");
    
    
    List<ZipcodeVO> alist = null;
    
    if(dong!=null && !dong.isEmpty()){
    	ZipcodeDAO dao = new ZipcodeDAO();
    	alist = dao.selectZipcode(dong);
    	
    } else{
    	dong = "";
    }
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath()%>/bs3/css/bootstrap.min.css?ver=8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css?ver=8">
<title>우편번호 찾기</title>
</head>
<body>
<script type="text/javascript" src="<%=request.getContextPath()%>/bs3/js/bootstrap.min.js?ver=8"></script>
<script type="text/javascript" src="../jquery/jquery-3.1.0.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$("#dong").focus();
		
		$("#btSearch").click(function(){
			if($("#dong").val().length<1){
				alert("지역명을 입력하세요");
				$("#dong").focus();
				return false;
			}
		});
		
	});

	function setZipcode(zipcode,address){
		opener.document.joinfrm.zipcode.value=zipcode;
		opener.document.joinfrm.addr1.value=address;
		self.close();
	};
	
</script>

<h2>우편번호 검색</h2>
<hr>
<p>찾으실 주소의 동(읍,면)을 입력해 주세요</p>
	<form name="formZipcode" method="post" action="zipcode.jsp" class="form-horizontal">
	<div class="form-group">
		<label for="dong" class="control-label col-sm-2">지역명</label>
			<div class= "col-xs-3">
				<input class="form-control" type="text" name="dong" id="dong" value="<%=dong %>" style="color:black;">
			
			</div>
				<input type= "submit" id="btSearch" value="찾기 " class="btn btn-default">
	</div>
		
	</form>
	<br><br>
	
	<%if(alist!=null){ %>
		<table style="width:380px">
			<colgroup>
				<col width="20%">
				<col width="*">
			</colgroup>
			
			<thead>
				<tr>
					<th>우편번호</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<%if(alist.isEmpty()){ %>
				<tr>
					<td colspan="2">해당 데이터가 없습니다</td>
				</tr>
				<%}else{ %>
				<%
					String zipcode="", address="";
					for(ZipcodeVO vo : alist){
						zipcode = vo.getZipcode();
						address = vo.getSido()+ " " + vo.getGugun() + " "
								+ vo.getDong();
						String bunji = "";
						String endbunji = "";
						
							if(vo.getEndbunji()!=null && !vo.getEndbunji().isEmpty()){
								endbunji = vo.getEndbunji();
								bunji = vo.getStartbunji()+ "~"+endbunji;
							} else{
								bunji = vo.getStartbunji();
							}
							
						%><tr>
							<td><%=zipcode %></td>
							<td><a href="#"
								 onclick="setZipcode('<%=zipcode %>','<%=address %>')">
								 <%=address %> <%=bunji %></a>
							</td>
						</tr>
							
					<%	}//for
					}//if
				}//if
				%>
			</tbody>
		
		</table>

</body>
</html>














