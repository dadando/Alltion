package com.spring.alltion.admin;

public class AdminProductVO {
	
    String adminProductNumber; // 상품번호
    String adminProductSubject; // 상품제목
    String adminProductId; // 판매자 아이디
    String adminProductCate; // 상품분류(카테고리)
    String adminProductStartDate; // 등록기간 시작일
    String adminProductEndDate; // 등록기간 종료일
    int adminProductStatus; // 상품 상태
    int adminProductSort; // 정렬
    
    int page; // 페이징처리 - 현재페이지 번호
    int startrow; // 페이징처리 - 시작번호
    int endrow; // 페이징처리 - 끝번호
    
	public String getAdminProductNumber() {
		return adminProductNumber;
	}
	public void setAdminProductNumber(String adminProductNumber) {
		this.adminProductNumber = adminProductNumber;
	}
	public String getAdminProductSubject() {
		return adminProductSubject;
	}
	public void setAdminProductSubject(String adminProductSubject) {
		this.adminProductSubject = adminProductSubject;
	}
	public String getAdminProductId() {
		return adminProductId;
	}
	public void setAdminProductId(String adminProductId) {
		this.adminProductId = adminProductId;
	}
	public String getAdminProductCate() {
		return adminProductCate;
	}
	public void setAdminProductCate(String adminProductCate) {
		this.adminProductCate = adminProductCate;
	}
	public String getAdminProductStartDate() {
		return adminProductStartDate;
	}
	public void setAdminProductStartDate(String adminProductStartDate) {
		this.adminProductStartDate = adminProductStartDate;
	}
	public String getAdminProductEndDate() {
		return adminProductEndDate;
	}
	public void setAdminProductEndDate(String adminProductEndDate) {
		this.adminProductEndDate = adminProductEndDate;
	}
	public int getAdminProductStatus() {
		return adminProductStatus;
	}
	public void setAdminProductStatus(int adminProductStatus) {
		this.adminProductStatus = adminProductStatus;
	}
	public int getAdminProductSort() {
		return adminProductSort;
	}
	public void setAdminProductSort(int adminProductSort) {
		this.adminProductSort = adminProductSort;
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
	@Override
	public String toString() {
		return "AdminProductVO [adminProductNumber=" + adminProductNumber + ", adminProductSubject="
				+ adminProductSubject + ", adminProductId=" + adminProductId + ", adminProductCate=" + adminProductCate
				+ ", adminProductStartDate=" + adminProductStartDate + ", adminProductEndDate=" + adminProductEndDate
				+ ", adminProductStatus=" + adminProductStatus + ", adminProductSort=" + adminProductSort + ", page="
				+ page + ", startrow=" + startrow + ", endrow=" + endrow + "]";
	}
	
}
