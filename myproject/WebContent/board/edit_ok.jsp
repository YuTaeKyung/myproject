<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="myproject.board.model.BoardDAO"%>
<%@page import="myproject.board.model.BoardVO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="myproject.common.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String saveDir = config.getServletContext().getRealPath(Utility.UP_PATH);
	saveDir = Utility.TEST_DIR;
	
	int maxSize = 2*1024*1024;
	String encoding = "utf-8";
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	try{
		MultipartRequest multi = new MultipartRequest(request,saveDir,maxSize,encoding,policy);
		System.out.println("파일업로드 완료");
		
		String fileName =multi.getFilesystemName("upfile");
		long fileSize =0;
		if(fileName != null && !fileName.isEmpty()){
			File file = multi.getFile("upfile");
			fileSize = file.length();
			
			String oldFileName = multi.getParameter("oldFileName");
			if(oldFileName!=null && !oldFileName.isEmpty()){
				File oldFile = new File(saveDir,oldFileName);
				if(oldFile.exists()){
					boolean bool = oldFile.delete();
					System.out.println("기존파일 삭제 여부 :"	+bool);
				}
			}
		}
		
		
		String no = multi.getParameter("no");
		String name = multi.getParameter("name");
		String title = multi.getParameter("title");
		String email = multi.getParameter("email");
		String content = multi.getParameter("pwd");
		String pwd = multi.getParameter("pwd");
		
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		vo.setNo(Integer.parseInt(no));
		vo.setName(name);
		vo.setTitle(title);
		vo.setEmail(email);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		vo.setFileName(fileName);
		vo.setFileSize(fileSize);
		
		int cnt = 0;
		String msg ="", url="";
		if(dao.checkPwd(pwd, Integer.parseInt(no))){
			cnt = dao.updateBoard(vo);
			if(cnt>0){
				msg ="수정 성공~!";
				url = "/board/detail.jsp?no="+no;
			} else{
				msg ="수정실패!";
				url = "/board/edit.jsp?no="+no;
			}
		} else{
			msg="비밀번호가 일치하지 않습니다!";
			url="/board/edit.jsp?no="+no;
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
%> <jsp:forward page="../common/message.jsp"></jsp:forward>		
<%	} catch(IOException e){
		e.printStackTrace();
	}
%>