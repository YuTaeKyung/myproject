<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    Cookie [] ckArr = request.getCookies();
    String ckValue = "";
    if(ckArr!=null){
    	for(int i = 0 ; i<ckArr.length;i++){
    		if(ckArr[i].getName().equals("ckUserid")){
    			ckValue = ckArr[i].getValue();
    			break;
    		}
    	}
    }
    System.out.println("쿠키쿠키ㅜ킼"+ckValue);
    %>
    
    <script type="text/javascript">
    	$(document).ready(function(){
    		$("#loginfrm").submit(function(){
    			if($("#id").val().length<1){
    				alert("아이디를 입력하세요");
    				$("#id").focus();
    				return false;
    			} else if($("#password").val().length<1){
    				alert("비밀번호를 입력하세요");
    				$("#password").focus();
    				return false;
    			}
    		});
    	});
    </script>
    
<!-- 로그인 모달 -->
	<div class="modal fade" id="loginmodal" role="dialog" style="color:black;">
		<div class="modal-dialog" role="document">
			<div class="modal-content" >
				<form id="loginfrm" name="loginfrm" method="post" 
				class="form-horizontal" action="<%=request.getContextPath()%>/login/login_ok.jsp">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">닫기</button>
						<h3>로그인</h3>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label for="id" class="control-label col-sm-4">아이디</label>
							<div class="col-sm-4">
								<input class="form-control" type="text" name="id" id="id"
									value="<%=ckValue%>">
							</div>
						</div>
						<div class="form-group">	
							<label for="password" class="control-label col-sm-4">비밀번호</label>
							<div class="col-sm-4">
								<input type="password" name="password" id="password" class="form-control">
								<input type="checkbox" name="saveId" id="saveId"
								<%if(ckValue!=null&& !ckValue.isEmpty()){ %>
								checked<%} %>>아이디저장
							</div>
						
							
						
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">로그인</button>
						<button type="reset" class="btn btn-warning">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>