package kr.co.kung.modelExam;

public class MemberDTO {
  private String userid;
  private String pw;
  private String name;
  private String phone;
  private String address;
  private String email;
public MemberDTO(String userid, String pw, String name, String phone, String address, String email) {
	super();
	this.userid = userid;
	this.pw = pw;
	this.name = name;
	this.phone = phone;
	this.address = address;
	this.email = email;
}
public MemberDTO() {
	super();
}
public String getUserid() {
	return userid;
}
public void setUserid(String userid) {
	this.userid = userid;
}
public String getPw() {
	return pw;
}
public void setPw(String pw) {
	this.pw = pw;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
  

  
}
