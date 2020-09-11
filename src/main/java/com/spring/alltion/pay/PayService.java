package com.spring.alltion.pay;

import java.util.HashMap;
import java.util.List;

public interface PayService {
	void insertPay(PayVO vo);
	void deletePay(String buyer_email);
	PayVO getPayList(String merchant_uid);
	PayVO charge(PayVO payVO);
	void cancelPay(String convertCancelMoney, String pay_id);
	void chargePay(String convertChargeMoney, String pay_id);
	void insertPaylist(String pay_id);
	String findCurrentMoney(String pay_id);
	String findPayid(String pay_id);
	int getPaycount(String pay_status, String pay_id);
	List<PayVO> findChargelist(String userId, String paid, int startrow1, int endrow1);
	List<PayVO> findCancellist(String userId, String paid, int startrow2, int endrow2);
	void changeMoney(String userId, String amount);
	void insertPayment(PaymentVO vo);
	List<PaymentVO> getPaymentlist(String userId, int startrow3, int endrow3);
	int getPaymentcount(String payment_userId);
	PaymentVO getPayment(String payment_userId);
}
