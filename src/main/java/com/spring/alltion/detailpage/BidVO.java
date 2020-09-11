/*
-- 응찰하기 기능 관련 테이블
create table bid_list(
    bid_number number primary key, -- 응찰번호
    bid_product_number number references product(product_number), -- 응찰한 상품번호
    bid_id varchar2(20) references member(member_id), -- 응찰자 아이디
    bid_price number, -- 응찰 가격
    bid_date date default sysdate, -- 응찰한 시간
    bid_no number -- 응찰 순서 넘버링, rnum 과 같은 효과
);
*/

package com.spring.alltion.detailpage;


public class BidVO {
	private int bid_number;
	private int bid_product_number;
	private String bid_id;
	private int bid_price;
	private String bid_date;
	private int bid_no;
	public int getBid_number() {
		return bid_number;
	}
	public void setBid_number(int bid_number) {
		this.bid_number = bid_number;
	}
	public int getBid_product_number() {
		return bid_product_number;
	}
	public void setBid_product_number(int bid_product_number) {
		this.bid_product_number = bid_product_number;
	}
	public String getBid_id() {
		return bid_id;
	}
	public void setBid_id(String bid_id) {
		this.bid_id = bid_id;
	}
	public int getBid_price() {
		return bid_price;
	}
	public void setBid_price(int bid_price) {
		this.bid_price = bid_price;
	}
	public int getBid_no() {
		return bid_no;
	}
	public void setBid_no(int bid_no) {
		this.bid_no = bid_no;
	}
	public String getBid_date() {
		return bid_date;
	}
	public void setBid_date(String bid_date) {
		this.bid_date = bid_date;
	}
}
