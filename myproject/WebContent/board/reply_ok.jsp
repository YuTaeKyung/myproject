<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="myproject.common.Utility"%>
<%@page import="myproject.board.model.BoardVO"%>
<%@page import="myproject.board.model.BoardDAO"%>
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






	String no = multi.getParameter("no");
	String title = multi.getParameter("title");
	String name = multi.getParameter("name");
	String email = multi.getParameter("email");
	String content = multi.getParameter("content");
	String pwd = multi.getParameter("pwd");
	String groupNo = multi.getParameter("groupNo");
	String sortNo = multi.getParameter("sortNo");
	String step = multi.getParameter("sortNo");
	
System.out.println("그룹넘버" + groupNo);
System.out.println("소트넘버"+ sortNo);
	int cnt = 0;
	
	BoardDAO dao = new BoardDAO();
	BoardVO vo = new BoardVO();
	vo.setContent(content);
	vo.setEmail(email);
	vo.setGroupNo(Integer.parseInt(groupNo));
	vo.setName(name);
	vo.setPwd(pwd);
	vo.setSortNo(Integer.parseInt(sortNo));
	vo.setStep(Integer.parseInt(step));
	vo.setTitle(title);
	vo.setFileName(fileName);
	vo.setFileSize(fileSize);
	
	cnt = dao.reply(vo);
	
	String msg = "", url = "";
	if(cnt>0){
		msg = "답변달기 성공";
		url = "/board/list.jsp";
	} else{
		msg ="답변달기 실패";
		url = "/detail.jsp?no="+no;
	}
	request.setAttribute("msg",msg);
	request.setAttribute("url",url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>