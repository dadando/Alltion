/*
-- 상품 상세 페이지의 댓글 관련 테이블
create table comment_list(
    comment_number number primary key, -- 댓글 번호
    comment_group_number number, -- 댓글 그룹 번호 원본과 답글을 묶는 역할
    comment_product_number number references product(product_number), -- 댓글 달린 상품번호
    comment_id varchar2(20) references member(member_id), -- 댓글 작성한 아이디
    comment_original_id varchar2(15), -- 답글달때 원래 댓글의 아이디
    comment_content varchar2(1000), -- 댓글 내용
    comment_lev varchar2(1) default '0' check(comment_lev in('0','1')), -- 0: 원글 ,1: 답글
    comment_secret varchar2(1) default '0' check(comment_secret in('0','1')), -- 0: 비밀x , 1: 비밀o
    comment_is_deleted varchar2(1) default '0' check(comment_is_deleted in('0','1')), -- 0: 삭제x , 1: 삭제o
    comment_date date default sysdate, -- 댓글 작성한 날짜
    comment_report number default 0 check(comment_report in(0,1)), --신고 0:일반 1: 신고접수
    comment_report_id varchar2(20), --신고한 아이디
    comment_list_no number -- 댓글 순서 넘버링, rnum과 같은효과
);  
*/

package com.spring.alltion.detailpage;

public class CommentVO {
	private int comment_number;
	private int comment_group_number;
	private int comment_product_number;
	private String comment_id;
	private String comment_original_id;
	private String comment_content;
	private String comment_lev;
	private String comment_secret;
	private String comment_is_deleted;
	private String comment_date;
	private int comment_report;
	private String comment_report_id;
	private int comment_list_no;
	public int getComment_number() {
		return comment_number;
	}
	public void setComment_number(int comment_number) {
		this.comment_number = comment_number;
	}
	public int getComment_group_number() {
		return comment_group_number;
	}
	public void setComment_group_number(int comment_group_number) {
		this.comment_group_number = comment_group_number;
	}
	public int getComment_product_number() {
		return comment_product_number;
	}
	public void setComment_product_number(int comment_product_number) {
		this.comment_product_number = comment_product_number;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_secret() {
		return comment_secret;
	}
	public void setComment_secret(String comment_secret) {
		this.comment_secret = comment_secret;
	}
	public String getComment_is_deleted() {
		return comment_is_deleted;
	}
	public void setComment_is_deleted(String comment_is_deleted) {
		this.comment_is_deleted = comment_is_deleted;
	}
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	public int getComment_list_no() {
		return comment_list_no;
	}
	public void setComment_list_no(int comment_list_no) {
		this.comment_list_no = comment_list_no;
	}
	
	public String getComment_lev() {
		return comment_lev;
	}
	public void setComment_lev(String comment_lev) {
		this.comment_lev = comment_lev;
	}
	public String getComment_original_id() {
		return comment_original_id;
	}
	public void setComment_original_id(String comment_original_id) {
		this.comment_original_id = comment_original_id;
	}
	public int getComment_report() {
		return comment_report;
	}
	public void setComment_report(int comment_report) {
		this.comment_report = comment_report;
	}
	public String getComment_report_id() {
		return comment_report_id;
	}
	public void setComment_report_id(String comment_report_id) {
		this.comment_report_id = comment_report_id;
	}
	
}
