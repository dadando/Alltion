package com.spring.alltion.productRegistration;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/*
-- 상품정보
CREATE TABLE product (
		product_number number primary key, -- 상품번호
		product_id varchar2(1000) not null, -- 아이디
        
		product_category_1 varchar2(1000) not null, -- 카테고리 1차
		product_category_2 varchar2(1000) not null, -- 카테고리 2차
        
		product_subject varchar2(1000) not null, -- 상품제목
		product_content varchar2(4000) not null, -- 상품내용
        product_img_1 varchar2(1000) not null, -- 이미지(썸네일)_1
        product_img_2 varchar2(1000), -- 이미지(썸네일)_2
        product_img_3 varchar2(1000), -- 이미지(썸네일)_3
        product_img_4 varchar2(1000), -- 이미지(썸네일)_4
        product_img_5 varchar2(1000), -- 이미지(썸네일)_5
        
		product_starting_price number not null, -- 경매시작가
        product_bidding_unit number not null, -- 입찰단위
        product_end_date date not null, -- 경매종료일
        
        product_delivery varchar2(1000) not null, -- 택배거래(비용) : before = 선불, after = 착불, none = 불가능
		product_transaction_area varchar2(1000) not null, -- 거래가능지역 : none = 불가능, 사용자입력값
        
        product_purchase_price number not null, -- 즉시구매가격
		product_re_auction number not null, -- 재경매 : 0 = 불가능, 1 = 가능
        
		product_current_price number not null, -- 경매현재가
		product_bids number not null, -- 입찰수
		product_participants number not null, -- 참가자수
		product_credit_score number not null, -- 신용도
		product_views number not null, -- 조회수
		product_progress number not null -- 진행상태 : 진행중 = 0, 낙찰 = 1
		product_issue_date date not null, -- 등록일
);
*/

public class ProductVO {
	int product_number; // 상품번호
	String product_id; // 아이디
	String product_category_1; // 카테고리 1차
	String product_category_2; // 카테고리 2차
	
	String product_subject; // 상품제목
	String product_content; // 상품내용
	String product_img_1; // 이미지(썸네일)_1
	String product_img_2; // 이미지(썸네일)_2
	String product_img_3; // 이미지(썸네일)_3
	String product_img_4; // 이미지(썸네일)_4
	String product_img_5; // 이미지(썸네일)_5

	int product_starting_price; // 경매시작가
	int product_bidding_unit; // 입찰단위
	String product_end_date; // 경매종료일
    
	String product_delivery; // 택배거래(비용)
	String product_transaction_area; // 거래가능지역 

	int product_purchase_price; // 즉시구매가격
	int product_re_auction; // 재경매
	
	int product_current_price; // 경매현재가
	int product_bids; // 입찰수
	int product_participants; // 참가자수
	int product_credit_score; // 신용도
	int product_views; // 조회수
	String product_issue_date; // 등록일
	int product_progress; // 진행상태
	
	// 기존 경매종료일과 등록일을 비교하여 경매기간을 구한 다음 새로운 경매종료일을 적용시킨다
	public void newEndDate() throws Exception {
		DateFormat format; // 날짜형식
		Date endDate; // 포맷 지정된 마감일
		Date issueDate; // 포맷 지정된 등록일
		
		double auctionPeriod; // 경매기간(마감일 - 등록일)
		int auctionPeriodForDay; // 경매기간(일단위)

		Calendar cal; // 캘린더객체
		
		// 포맷형식을 지정하고 마감일과 등록일에 적용한다
		format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		endDate = format.parse(product_end_date);
		issueDate = format.parse(product_issue_date);
		
		// 마감시간에서 등록일을 차감 -> 일단위 -> 올림처리 -> int로 형변환
		// 경매기간(일단위)를 구하는 작업
		auctionPeriod = endDate.getTime() - issueDate.getTime();
		auctionPeriodForDay = (int) Math.ceil(auctionPeriod / (24*60*60*1000));
		
		// 기존 상품의 마감일에  + 경매기간(일단위)하여 새로운 마감일을 할당한다
		cal = Calendar.getInstance();
		cal.setTime(endDate);
		cal.add(Calendar.DATE, auctionPeriodForDay);
		product_end_date = format.format(cal.getTime());
	}
    
    // 재경매시 기존 경매시작가에서 차감된 경매시작가로 변경한다
 	public void newStartingPrice() {
 		if (product_starting_price <= 10000) {
 			product_starting_price -= 1000;
 		} else if (product_starting_price <= 30000) {
 			product_starting_price -= 3000;
 		} else if (product_starting_price <= 50000) {
 			product_starting_price -= 5000;
 		} else if (product_starting_price <= 100000) {
 			product_starting_price -= 10000;
 		} else if (product_starting_price <= 300000) {
 			product_starting_price -= 20000;
 		} else if (product_starting_price <= 500000) {
 			product_starting_price -= 30000;
 		} else {
 			product_starting_price -= 40000;
 		}
 		
 		// 최저 시작가는 1,000원이다
 		if (product_starting_price < 1000) {
 			product_starting_price = 1000;
 		}
 	}

	// 경매종료일을 sql문의 to_date에 맞는 형식으로 변환한다
	public void transformEndDate() {
		product_end_date = product_end_date.replace("년 ", "/");
		product_end_date = product_end_date.replace("월 ", "/");
		product_end_date = product_end_date.replace("일", "");
		product_end_date = product_end_date.replace("시 ", ":");
		product_end_date = product_end_date.replace("분", "");
	}
	
	// 직거래가 없으면 "none"으로 변환한다
	public void changeTransactionAreaToNone() {
		if (product_transaction_area.equals("")) {
			product_transaction_area = "none";
		}
	}
	
	// 카테고리, 택배, 직거래 한글로 다듬기
	public void changeToKorean() {
		changeTranslateCategoryToKorean();
		changeDeliveryToKorean();
		changeTransactionAreaToKorean();
	}
	
	// 카테고리 한글로 다듬기
	public void changeTranslateCategoryToKorean() {
		// 1차 카테고리 다듬기
		changeTranslateCate_1ToKorean();
		
		// 2차 카테고리 다듬기
		changeTranslateCate_2ToKorean();
	}
	
	// 택배 한글로 다듬기
	public void changeDeliveryToKorean() {
		// 아래 조건에 맞게 변형시킨다(한글로)
		if (product_delivery.equals("before")) {
			product_delivery = "선불";
		} else if (product_delivery.equals("after")) {
			product_delivery = "착불";
		} else {
			product_delivery = "불가능";
		}
	}
	
	// 직거래 한글로 다듬기
	public void changeTransactionAreaToKorean() {
		// 아래 조건에 맞게 변형시킨다(한글로)
		if (product_transaction_area.equals("none")) {
			product_transaction_area = "불가능";
		}
	}
	
	// 1차 카테고리 한글 변환 (저장은 영어로되어있음)
	public void changeTranslateCate_1ToKorean() {
		switch(product_category_1) {
			case "cate01":
				product_category_1 = "패션";
				break;
			case "cate02":
				product_category_1 = "뷰티";
				break;
			case "cate03":
				product_category_1 = "출산/유아동";
				break;
			case "cate04":
				product_category_1 = "전자기기";
				break;
			case "cate05":
				product_category_1 = "가전제품";
				break;
			case "cate06":
				product_category_1 = "가구/인테리어";
				break;
			case "cate07":
				product_category_1 = "반려동물/취미";
				break;
			case "cate08":
				product_category_1 = "도서/음반/문구";
				break;
			case "cate09":
				product_category_1 = "티켓/쿠폰";
				break;
			case "cate10":
				product_category_1 = "스포츠";
				break;
			case "cate11":
				product_category_1 = "공구/산업";
				break;
			case "cate12":
				product_category_1 = "기타잡화";
				break;
			default:
				product_category_1 = "기타잡화";
				break;
		}
	}
	
	// 2차 카테고리 한글 변환 (저장은 영어로되어있음)
	public void changeTranslateCate_2ToKorean() {
		// 2차 카테고리 (출산/유아동) 까지만 만들었음.
		switch(product_category_2) {
		case "cate0101":
			product_category_2 = "여성의류";
			break;
		case "cate0102":
			product_category_2 = "남성의류";
			break;
		case "cate0103":
			product_category_2 = "여성신발";
			break;
		case "cate0104":
			product_category_2 = "남성신발";
			break;
		case "cate0105":
			product_category_2 = "액세서리";
			break;
		case "cate0106":
			product_category_2 = "귀금속";
			break;
		case "cate0107":
			product_category_2 = "모자";
			break;
		case "cate0108":
			product_category_2 = "기타잡화/관련용품";
			break;
		case "cate0109":
			product_category_2 = "수입명품";
			break;
			
		case "cate0201":
			product_category_2 = "스킨케어";
			break;
		case "cate0202":
			product_category_2 = "메이크업";
			break;
		case "cate0203":
			product_category_2 = "헤어/바디";
			break;
		case "cate0204":
			product_category_2 = "향수";
			break;
		case "cate0205":
			product_category_2 = "네일케어";
			break;
		case "cate0206":
			product_category_2 = "남성 화장품";
			break;
		case "cate0207":
			product_category_2 = "가발/기타용품";
			break;
		
		case "cate0301":
			product_category_2 = "출산/육아용품";
			break;
		case "cate0302":
			product_category_2 = "유아동안전/실내용품";
			break;
		case "cate0303":
			product_category_2 = "유아동의류";
			break;
		case "cate0304":
			product_category_2 = "유아동잡화";
			break;
		case "cate0305":
			product_category_2 = "유아동가구";
			break;
		case "cate0306":
			product_category_2 = "기타 유아동용품";
			break;
		
		default:
			product_category_2 = "기타잡화";
			break;
		}
	}
	
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_category_1() {
		return product_category_1;
	}
	public void setProduct_category_1(String product_category_1) {
		this.product_category_1 = product_category_1;
	}
	public String getProduct_category_2() {
		return product_category_2;
	}
	public void setProduct_category_2(String product_category_2) {
		this.product_category_2 = product_category_2;
	}
	public String getProduct_subject() {
		return product_subject;
	}
	public void setProduct_subject(String product_subject) {
		this.product_subject = product_subject;
	}
	public String getProduct_content() {
		return product_content;
	}
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}
	public String getProduct_img_1() {
		return product_img_1;
	}
	public void setProduct_img_1(String product_img_1) {
		this.product_img_1 = product_img_1;
	}
	public String getProduct_img_2() {
		return product_img_2;
	}
	public void setProduct_img_2(String product_img_2) {
		this.product_img_2 = product_img_2;
	}
	public String getProduct_img_3() {
		return product_img_3;
	}
	public void setProduct_img_3(String product_img_3) {
		this.product_img_3 = product_img_3;
	}
	public String getProduct_img_4() {
		return product_img_4;
	}
	public void setProduct_img_4(String product_img_4) {
		this.product_img_4 = product_img_4;
	}
	public String getProduct_img_5() {
		return product_img_5;
	}
	public void setProduct_img_5(String product_img_5) {
		this.product_img_5 = product_img_5;
	}
	public int getProduct_starting_price() {
		return product_starting_price;
	}
	public void setProduct_starting_price(int product_starting_price) {
		this.product_starting_price = product_starting_price;
	}
	public int getProduct_bidding_unit() {
		return product_bidding_unit;
	}
	public void setProduct_bidding_unit(int product_bidding_unit) {
		this.product_bidding_unit = product_bidding_unit;
	}
	public String getProduct_end_date() {
		return product_end_date;
	}
	public void setProduct_end_date(String product_end_date) {
		this.product_end_date = product_end_date;
	}
	public String getProduct_delivery() {
		return product_delivery;
	}
	public void setProduct_delivery(String product_delivery) {
		this.product_delivery = product_delivery;
	}
	public String getProduct_transaction_area() {
		return product_transaction_area;
	}
	public void setProduct_transaction_area(String product_transaction_area) {
		this.product_transaction_area = product_transaction_area;
	}
	public int getProduct_purchase_price() {
		return product_purchase_price;
	}
	public void setProduct_purchase_price(int product_purchase_price) {
		this.product_purchase_price = product_purchase_price;
	}
	public int getProduct_re_auction() {
		return product_re_auction;
	}
	public void setProduct_re_auction(int product_re_auction) {
		this.product_re_auction = product_re_auction;
	}
	public int getProduct_current_price() {
		return product_current_price;
	}
	public void setProduct_current_price(int product_current_price) {
		this.product_current_price = product_current_price;
	}
	public int getProduct_bids() {
		return product_bids;
	}
	public void setProduct_bids(int product_bids) {
		this.product_bids = product_bids;
	}
	public int getProduct_participants() {
		return product_participants;
	}
	public void setProduct_participants(int product_participants) {
		this.product_participants = product_participants;
	}
	public int getProduct_credit_score() {
		return product_credit_score;
	}
	public void setProduct_credit_score(int product_credit_score) {
		this.product_credit_score = product_credit_score;
	}
	public int getProduct_views() {
		return product_views;
	}
	public void setProduct_views(int product_views) {
		this.product_views = product_views;
	}
	public String getProduct_issue_date() {
		return product_issue_date;
	}
	public void setProduct_issue_date(String product_issue_date) {
		this.product_issue_date = product_issue_date;
	}
	public int getProduct_progress() {
		return product_progress;
	}
	public void setProduct_progress(int product_progress) {
		this.product_progress = product_progress;
	}
}
