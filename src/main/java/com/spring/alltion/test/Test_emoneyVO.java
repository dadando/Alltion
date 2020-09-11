package com.spring.alltion.test;
/*
create table test_emoney(
emoney_id varchar2(20)references member(member_id) not null,
test_emoney number default 0
);
 */
public class Test_emoneyVO {

		String emoney_id;
		int emoney;
		String member_id;
		String pay_current_money;
		String pay_id;
		
		
		public String getMember_id() {
			return member_id;
		}
		public void setMember_id(String member_id) {
			this.member_id = member_id;
		}
		public 		String getEmoney_id() {
			return emoney_id;
		}
		public void setEmoney_id(		String emoney_id) {
			this.emoney_id = emoney_id;
		}
		public int getEmoney() {
			return emoney;
		}
		public void setEmoney(int emoney) {
			this.emoney = emoney;
		}
		public String getPay_current_money() {
			return pay_current_money;
		}
		public void setPay_current_money(String pay_current_money) {
			this.pay_current_money = pay_current_money;
		}
		public String getPay_id() {
			return pay_id;
		}
		public void setPay_id(String pay_id) {
			this.pay_id = pay_id;
		}
		
		
}
