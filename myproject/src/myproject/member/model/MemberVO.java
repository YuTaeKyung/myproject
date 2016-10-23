package myproject.member.model;

import java.sql.Timestamp;

public class MemberVO {
	private int no;
	private String userid;
	private String name;
	private String pwd;
	private String email;
	private String hp;
	private Timestamp regdate;
	
	public MemberVO() {
		
	}

	public MemberVO(int no, String userid, String name, String pwd, String email, String hp, Timestamp regdate) {
		super();
		this.no = no;
		this.userid = userid;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.hp = hp;
		this.regdate = regdate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "MemberVO [no=" + no + ", userid=" + userid + ", name=" + name + ", pwd=" + pwd + ", email=" + email
				+ ", hp=" + hp + ", regdate=" + regdate + "]";
	}
	
	
}
