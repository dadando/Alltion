package com.spring.alltion.login;
/*
create table member(
member_name varchar2(15),
member_id varchar2(20) primary key,
member_password varchar2(20) not null,
email varchar2(50) not null,
member_phone varchar2(11) not null,
sample4_postcode varchar2(30),
sample4_roadAddress varchar2(50),
sample4_jibunAddress varchar2(50),
sample4_detailAddress varchar2(50),
member_delete number default 0,   -- 회원탈퇴시 값이 1으로 바뀌면서 로그인 불가
member_manager number default 0,  --0은 일반회원 1은 관리자
member_date date not null
);
 */
public class MemberVO {
	String member_name;
	String member_id;
	String member_password;
	String email;
	String member_phone;
	String sample4_postcode;
	String sample4_roadAddress;
	String sample4_jibunAddress;
	String sample4_detailAddress;
	String email1;
	String email2;
	int member_delete;
	int member_manager;
	String member_date;
	
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getSample4_postcode() {
		return sample4_postcode;
	}
	public void setSample4_postcode(String sample4_postcode) {
		this.sample4_postcode = sample4_postcode;
	}
	public String getSample4_roadAddress() {
		return sample4_roadAddress;
	}
	public void setSample4_roadAddress(String sample4_roadAddress) {
		this.sample4_roadAddress = sample4_roadAddress;
	}
	public String getSample4_jibunAddress() {
		return sample4_jibunAddress;
	}
	public void setSample4_jibunAddress(String sample4_jibunAddress) {
		this.sample4_jibunAddress = sample4_jibunAddress;
	}
	public String getSample4_detailAddress() {
		return sample4_detailAddress;
	}
	public void setSample4_detailAddress(String sample4_detailAddress) {
		this.sample4_detailAddress = sample4_detailAddress;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public int getMember_delete() {
		return member_delete;
	}
	public void setMember_delete(int member_delete) {
		this.member_delete = member_delete;
	}
	public int getMember_manager() {
		return member_manager;
	}
	public void setMember_manager(int member_manager) {
		this.member_manager = member_manager;
	}
	public String getMember_date() {
		return member_date;
	}
	public void setMember_date(String member_date) {
		this.member_date = member_date;
	}
	
}
