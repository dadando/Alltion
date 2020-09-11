package com.spring.alltion.pay;

import java.util.Date;

public class PayVO {
	int rnum;
	String pay_merchant_uid;
	String pay_amount;
	String pay_status;
	String pay_id;
	String pay_lastmoney;
	String pay_nowmoney;
	Date pay_date;
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getPay_merchant_uid() {
		return pay_merchant_uid;
	}
	public void setPay_merchant_uid(String pay_merchant_uid) {
		this.pay_merchant_uid = pay_merchant_uid;
	}
	public String getPay_amount() {
		return pay_amount;
	}
	public void setPay_amount(String pay_amount) {
		this.pay_amount = pay_amount;
	}
	public String getPay_status() {
		return pay_status;
	}
	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}
	public String getPay_id() {
		return pay_id;
	}
	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}
	public String getPay_lastmoney() {
		return pay_lastmoney;
	}
	public void setPay_lastmoney(String pay_lastmoney) {
		this.pay_lastmoney = pay_lastmoney;
	}
	public String getPay_nowmoney() {
		return pay_nowmoney;
	}
	public void setPay_nowmoney(String pay_nowmoney) {
		this.pay_nowmoney = pay_nowmoney;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
}
