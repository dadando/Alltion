package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.pay.PayVO;
import com.spring.alltion.pay.PaymentVO;

public interface PayMapper {
	int insertPay(PayVO vo);
	void deletePay(String imp_uid);
	PayVO getPayList(String merchant_uid);
	void chargePay(@Param("convertChargeMoney")String convertChargeMoney, @Param("pay_id")String pay_id);
	void cancelPay(@Param("convertCancelMoney")String convertCancelMoney, @Param("pay_id")String pay_id);
	void insertPaylist(String pay_id);
	String findCurrentMoney(String pay_id);
	String findPayid(String pay_id);
	List<PayVO> findChargelist(@Param("pay_id")String pay_id, @Param("pay_status")String pay_status);
	List<PayVO> findCancellist(@Param("pay_id")String pay_id, @Param("pay_status")String pay_status);
	int getPaycount(@Param("pay_status")String pay_status, @Param("pay_id")String pay_id);
	List<PayVO> findChargelist(@Param("pay_id")String pay_id, @Param("pay_status")String pay_status, @Param("startrow1")int startrow1, @Param("endrow1")int endrow1);
	List<PayVO> findCancellist(@Param("pay_id")String pay_id, @Param("pay_status")String pay_status, @Param("startrow2")int startrow2, @Param("endrow2")int endrow2);
	void changeMoney(@Param("userId")String userId, @Param("amount")String amount);
	void insertPayment(PaymentVO vo);
	List<PaymentVO> getPaymentlist(@Param("payment_userId")String payment_userId, @Param("startrow3")int startrow3, @Param("endrow3")int endrow3);
	int getPaymentcount(String payment_userId);
	PaymentVO getPayment(String payment_userId);
}
