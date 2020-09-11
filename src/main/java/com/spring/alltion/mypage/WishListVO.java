package com.spring.alltion.mypage;

/*
-- 찜목록
create table wish_list (
    wish_product_number number, -- 상품번호
    wish_id varchar2(1000), -- 아이디
    wish_date Date -- 등록일
);
*/

public class WishListVO {
    int wish_product_number; // 상품번호
    String wish_id; // 아이디
    String trading_date; // 등록일
    
	public int getWish_product_number() {
		return wish_product_number;
	}
	public void setWish_product_number(int wish_product_number) {
		this.wish_product_number = wish_product_number;
	}
	public String getWish_id() {
		return wish_id;
	}
	public void setWish_id(String wish_id) {
		this.wish_id = wish_id;
	}
	public String getTrading_date() {
		return trading_date;
	}
	public void setTrading_date(String trading_date) {
		this.trading_date = trading_date;
	}
	
}
