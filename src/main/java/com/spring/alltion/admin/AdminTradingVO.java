package com.spring.alltion.admin;

public class AdminTradingVO {
	
    String adminTradingNumber; // 상품번호
    String adminTradingBuyerId; // 구매자 아이디
    String adminTradingSellerId; // 판매자 아이디
    String adminTradingSystem; // 거래방식
    String adminTradingStartDate; // 등록기간 시작일
    String adminTradingEndDate; // 등록기간 종료일
    String adminTradingStatus; // 진행 상태
    int adminTradingSort; // 정렬
    
    int page; // 페이징처리 - 현재페이지 번호
    int startrow; // 페이징처리 - 시작번호
    int endrow; // 페이징처리 - 끝번호
    
	public String getAdminTradingNumber() {
		return adminTradingNumber;
	}
	public void setAdminTradingNumber(String adminTradingNumber) {
		this.adminTradingNumber = adminTradingNumber;
	}
	public String getAdminTradingBuyerId() {
		return adminTradingBuyerId;
	}
	public void setAdminTradingBuyerId(String adminTradingBuyerId) {
		this.adminTradingBuyerId = adminTradingBuyerId;
	}
	public String getAdminTradingSellerId() {
		return adminTradingSellerId;
	}
	public void setAdminTradingSellerId(String adminTradingSellerId) {
		this.adminTradingSellerId = adminTradingSellerId;
	}
	public String getAdminTradingSystem() {
		return adminTradingSystem;
	}
	public void setAdminTradingSystem(String adminTradingSystem) {
		this.adminTradingSystem = adminTradingSystem;
	}
	public String getAdminTradingStartDate() {
		return adminTradingStartDate;
	}
	public void setAdminTradingStartDate(String adminTradingStartDate) {
		this.adminTradingStartDate = adminTradingStartDate;
	}
	public String getAdminTradingEndDate() {
		return adminTradingEndDate;
	}
	public void setAdminTradingEndDate(String adminTradingEndDate) {
		this.adminTradingEndDate = adminTradingEndDate;
	}
	public String getAdminTradingStatus() {
		return adminTradingStatus;
	}
	public void setAdminTradingStatus(String adminTradingStatus) {
		this.adminTradingStatus = adminTradingStatus;
	}
	public int getAdminTradingSort() {
		return adminTradingSort;
	}
	public void setAdminTradingSort(int adminTradingSort) {
		this.adminTradingSort = adminTradingSort;
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
