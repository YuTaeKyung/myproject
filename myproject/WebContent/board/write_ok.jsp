<%@page import="myproject.board.model.BoardVO"%>
<%@page import="myproject.board.model.BoardDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="myproject.common.Utility"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String saveDir= application.getRealPath(Utility.UP_PATH);
	saveDir = config.getServletContext().getRealPath(Utility.UP_PATH);
	saveDir = Utility.TEST_DIR;
	int maxSize = 4*1024*1024; 
	String encoding = "utf-8";
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	
	MultipartRequest multi =
	new MultipartRequest(request,saveDir,maxSize,encoding,policy);
	
	System.out.println("파일 업로드 완료~!!");
	
	String fileName = multi.getFilesystemName("upfile");
	long fileSize = 0;
	
	if(fileName!=null && !fileName.isEmpty()){
		File file = multi.getFile("upfile");
		fileSize = file.length();
	}
	
	
	
	String name = multi.getParameter("name");
	String pwd = multi.getParameter("pwd");
	String title = multi.getParameter("title");
	String email = multi.getParameter("email");
	String content = multi.getParameter("content");
	
	String ip1 = request.getRemoteAddr();
	String ip2 = request.getRemoteHost();
	System.out.println("ip1 = "+ip1 +", ip2 = "+ip2);
	
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	int cnt = 0;
	
	vo.setName(name);
	vo.setPwd(pwd);
	vo.setTitle(title);
	vo.setEmail(email);
	vo.setContent(content);
	vo.setFileName(fileName);
	vo.setFileSize(fileSize);
	
	cnt =dao.insertBoard(vo);
	
	if(cnt>0){
%>		<script type="text/javascript">
			alert("글쓰기 성공");
			location.href="list.jsp";
		</script>		
<%	} else{
%>		<script type="text/javascript">
			alert("글쓰기 실패");
			history.back();
		</script>	
<%		
}
	
%>








