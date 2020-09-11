package com.spring.alltion.admin;

public class AdminMemberVO {
	
    String adminMemberId; // 아이디
    String adminMemberName; // 이름
    String adminMemberEmail; // 이메일
    String adminMemberPhone; // 연락처
    String adminMemberStartDate; // 가입기간 시작일
    String adminMemberEndDate; // 가입기간 종료일
    int adminMemberStatus; // 계정 상태
    int adminMemberSort; // 정렬
    
    int page; // 페이징처리 - 현재페이지 번호
    int startrow; // 페이징처리 - 시작번호
    int endrow; // 페이징처리 - 끝번호
    
	public String getAdminMemberId() {
		return adminMemberId;
	}
	public void setAdminMemberId(String adminMemberId) {
		this.adminMemberId = adminMemberId;
	}
	public String getAdminMemberName() {
		return adminMemberName;
	}
	public void setAdminMemberName(String adminMemberName) {
		this.adminMemberName = adminMemberName;
	}
	public String getAdminMemberEmail() {
		return adminMemberEmail;
	}
	public void setAdminMemberEmail(String adminMemberEmail) {
		this.adminMemberEmail = adminMemberEmail;
	}
	public String getAdminMemberPhone() {
		return adminMemberPhone;
	}
	public void setAdminMemberPhone(String adminMemberPhone) {
		this.adminMemberPhone = adminMemberPhone;
	}
	public String getAdminMemberStartDate() {
		return adminMemberStartDate;
	}
	public void setAdminMemberStartDate(String adminMemberStartDate) {
		this.adminMemberStartDate = adminMemberStartDate;
	}
	public String getAdminMemberEndDate() {
		return adminMemberEndDate;
	}
	public void setAdminMemberEndDate(String adminMemberEndDate) {
		this.adminMemberEndDate = adminMemberEndDate;
	}
	public int getAdminMemberStatus() {
		return adminMemberStatus;
	}
	public void setAdminMemberStatus(int adminMemberStatus) {
		this.adminMemberStatus = adminMemberStatus;
	}
	public int getAdminMemberSort() {
		return adminMemberSort;
	}
	public void setAdminMemberSort(int adminMemberSort) {
		this.adminMemberSort = adminMemberSort;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
}
