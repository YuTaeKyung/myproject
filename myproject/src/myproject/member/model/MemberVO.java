package myproject.member.model;

import java.sql.Timestamp;

public class MemberVO {
	 private int  	no; 
	 private String    userid;
	 private String    name;
	 private String    pwd;
	 private String    email;
	 private String    hp; 
	 private String    zipcode;
	 private String    address;
	 private String    addressDetail;  
	 private Timestamp    regdate;
	 private String    authCode;
	 private Timestamp    outdate;
	   
	
	public MemberVO() {
		
	}


	public MemberVO(int no, String userid, String name, String pwd, String email, String hp, String zipcode,
			String address, String addressDetail, Timestamp regdate, String authCode, Timestamp outdate) {
		super();
		this.no = no;
		this.userid = userid;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.hp = hp;
		this.zipcode = zipcode;
		this.address = address;
		this.addressDetail = addressDetail;
		this.regdate = regdate;
		this.authCode = authCode;
		this.outdate = outdate;
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


	public String getZipcode() {
		return zipcode;
	}


	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getAddressDetail() {
		return addressDetail;
	}


	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}


	public String getAuthCode() {
		return authCode;
	}


	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}


	public Timestamp getOutdate() {
		return outdate;
	}


	public void setOutdate(Timestamp outdate) {
		this.outdate = outdate;
	}


	@Override
	public String toString() {
		return "MemberVO [no=" + no + ", userid=" + userid + ", name=" + name + ", pwd=" + pwd + ", email=" + email
				+ ", hp=" + hp + ", zipcode=" + zipcode + ", address=" + address + ", addressDetail=" + addressDetail
				+ ", regdate=" + regdate + ", authCode=" + authCode + ", outdate=" + outdate + "]";
	}

	
	
}
