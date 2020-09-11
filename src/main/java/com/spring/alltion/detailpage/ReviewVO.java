/*
create table review(
    review_number number primary key,  -- 리뷰테이블 고유번호
    review_id varchar2(20) references member(member_id), -- 판매자 아이디
    review_evaluator varchar2(20) references member(member_id), -- 구매자 아이디(리뷰달 아이디)
    review_evaluate varchar2(20) check(review_evaluate in('매우 만족','만족','보통','불만족','매우 불만족')), -- 평가
    review_image varchar2(1000), -- 썸네일 이미지 (1번이미지 사용)
    review_subject varchar2(1000), -- 상품 제목
    review_content varchar2(4000), -- 상품 내용
    review_date date default sysdate, -- 리뷰 작성 날짜
    review_no number -- 리뷰 넘버링 (페이징용)
);
*/

package com.spring.alltion.detailpage;

public class ReviewVO {
	private int review_number;
	private String review_id;
	private String review_evaluator;
	private String review_evaluate;
	private String review_image;
	private String review_subject;
	private String review_content;
	private String review_date;
	private int review_no;
	
	public int getReview_number() {
		return review_number;
	}
	public void setReview_number(int review_number) {
		this.review_number = review_number;
	}
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	public String getReview_evaluator() {
		return review_evaluator;
	}
	public void setReview_evaluator(String review_evaluator) {
		this.review_evaluator = review_evaluator;
	}
	public String getReview_evaluate() {
		return review_evaluate;
	}
	public void setReview_evaluate(String review_evaluate) {
		this.review_evaluate = review_evaluate;
	}
	public String getReview_image() {
		return review_image;
	}
	public void setReview_image(String review_image) {
		this.review_image = review_image;
	}
	public String getReview_subject() {
		return review_subject;
	}
	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
}
