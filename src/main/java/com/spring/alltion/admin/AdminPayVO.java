package com.spring.alltion.admin;

public class AdminPayVO {
	
    String adminPayId; // 결제 아이디
    String adminPayStartDate; // 결제기간 시작일
    String adminPayEndDate; // 결제기간 종료일
    String adminPayNumber; // 결제 번호
    int adminPayMoney; // 결제 금액
    int adminPayMoneyFilter; // 결제금액 검색조건
    String adminPayStatus; // 결제 상태
    int adminPaySort; // 정렬
    
    int page; // 페이징처리 - 현재페이지 번호
    int startrow; // 페이징처리 - 시작번호
    int endrow; // 페이징처리 - 끝번호
    
	public String getAdminPayId() {
		return adminPayId;
	}
	public void setAdminPayId(String adminPayId) {
		this.adminPayId = adminPayId;
	}
	public String getAdminPayStartDate() {
		return adminPayStartDate;
	}
	public void setAdminPayStartDate(String adminPayStartDate) {
		this.adminPayStartDate = adminPayStartDate;
	}
	public String getAdminPayEndDate() {
		return adminPayEndDate;
	}
	public void setAdminPayEndDate(String adminPayEndDate) {
		this.adminPayEndDate = adminPayEndDate;
	}
	public String getAdminPayNumber() {
		return adminPayNumber;
	}
	public void setAdminPayNumber(String adminPayNumber) {
		this.adminPayNumber = adminPayNumber;
	}
	public int getAdminPayMoney() {
		return adminPayMoney;
	}
	public void setAdminPayMoney(int adminPayMoney) {
		this.adminPayMoney = adminPayMoney;
	}
	public int getAdminPayMoneyFilter() {
		return adminPayMoneyFilter;
	}
	public void setAdminPayMoneyFilter(int adminPayMoneyFilter) {
		this.adminPayMoneyFilter = adminPayMoneyFilter;
	}
	public String getAdminPayStatus() {
		return adminPayStatus;
	}
	public void setAdminPayStatus(String adminPayStatus) {
		this.adminPayStatus = adminPayStatus;
	}
	public int getAdminPaySort() {
		return adminPaySort;
	}
	public void setAdminPaySort(int adminPaySort) {
		this.adminPaySort = adminPaySort;
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
