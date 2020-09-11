package com.spring.alltion.pay;

import java.util.Date;

public class PaymentVO {
	int rnum;
	String payment_userId;
	String payment_product_subject;
	String payment_amount;
	String payment_status;
	String payment_lastmoney;
	String payment_nowmoney;
	Date payment_date;
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getPayment_userId() {
		return payment_userId;
	}
	public void setPayment_userId(String payment_userId) {
		this.payment_userId = payment_userId;
	}
	public String getPayment_product_subject() {
		return payment_product_subject;
	}
	public void setPayment_product_subject(String payment_product_subject) {
		this.payment_product_subject = payment_product_subject;
	}
	public String getPayment_amount() {
		return payment_amount;
	}
	public void setPayment_amount(String payment_amount) {
		this.payment_amount = payment_amount;
	}
	public String getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
	public String getPayment_lastmoney() {
		return payment_lastmoney;
	}
	public void setPayment_lastmoney(String payment_lastmoney) {
		this.payment_lastmoney = payment_lastmoney;
	}
	public String getPayment_nowmoney() {
		return payment_nowmoney;
	}
	public void setPayment_nowmoney(String payment_nowmoney) {
		this.payment_nowmoney = payment_nowmoney;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	
}
