package myproject.board.model;

import java.sql.Timestamp;

public class BoardVO {
	
	private int no;
	private String name;
	private String pwd;
	private String title;
	private String email;
	private String content;
	private Timestamp regdate;
	private int readcount;
	
	
	private int groupNo;
	private int step;
	private int sortNo;
	private String delFlag;
	
	private String fileName;
	private long fileSize;
	private int downcount;
	
	
	public BoardVO() {
		
	}


	public BoardVO(int no, String name, String pwd, String title, String email, String content, Timestamp regdate,
			int readcount, int groupNo, int step, int sortNo, String delFlag, String fileName, long fileSize,
			int downcount) {
		super();
		this.no = no;
		this.name = name;
		this.pwd = pwd;
		this.title = title;
		this.email = email;
		this.content = content;
		this.regdate = regdate;
		this.readcount = readcount;
		this.groupNo = groupNo;
		this.step = step;
		this.sortNo = sortNo;
		this.delFlag = delFlag;
		this.fileName = fileName;
		this.fileSize = fileSize;
		this.downcount = downcount;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}


	public int getReadcount() {
		return readcount;
	}


	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}


	public int getGroupNo() {
		return groupNo;
	}


	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}


	public int getStep() {
		return step;
	}


	public void setStep(int step) {
		this.step = step;
	}


	public int getSortNo() {
		return sortNo;
	}


	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}


	public String getDelFlag() {
		return delFlag;
	}


	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public long getFileSize() {
		return fileSize;
	}


	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}


	public int getDowncount() {
		return downcount;
	}


	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}


	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", name=" + name + ", pwd=" + pwd + ", title=" + title + ", email=" + email
				+ ", content=" + content + ", regdate=" + regdate + ", readcount=" + readcount + ", groupNo=" + groupNo
				+ ", step=" + step + ", sortNo=" + sortNo + ", delFlag=" + delFlag + ", fileName=" + fileName
				+ ", fileSize=" + fileSize + ", downcount=" + downcount + "]";
	}


	
	
}
