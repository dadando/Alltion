package com.spring.alltion.pay;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.PayMapper;

@Service("payservice")
public class PayServiceImpl implements PayService {

	@Autowired
	private SqlSession sqlSession;


	@Override
	public void insertPay(PayVO vo) {
		// TODO Auto-generated method stub
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		payMapper.insertPay(vo);
	}
	
	@Override
	public void deletePay(String buyer_email) {
		// TODO Auto-generated method stub

	}

	@Override
	public PayVO charge(PayVO payVO) {
		// TODO Auto-generated method stub
		payVO.setPay_amount(payVO.getPay_amount());
		payVO.setPay_id(payVO.getPay_id());
		return payVO;
	}

	@Override
	public PayVO getPayList(String merchant_uid) {
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		PayVO payVO = new PayVO();
		payVO.setPay_merchant_uid(merchant_uid);
		payVO = payMapper.getPayList(payVO.getPay_merchant_uid());
		payVO.setPay_status(payVO.getPay_status());
		payVO.setPay_amount(payVO.getPay_amount());
		payVO.setPay_id(payVO.getPay_id());
		return payVO;
	}

	@Override
	public void chargePay(String convertChargeMoney, String pay_id) {
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		payMapper.chargePay(convertChargeMoney, pay_id);
		
	}

	@Override
	public void cancelPay(String convertCancelMoney, String pay_id) {
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		payMapper.cancelPay(convertCancelMoney, pay_id);
	}

	@Override
	public void insertPaylist(String pay_id) {
		// TODO Auto-generated method stub
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		payMapper.insertPaylist(pay_id);
	}

	@Override
	public String findCurrentMoney(String pay_id) {
		// TODO Auto-generated method stub
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		String currentMoney = payMapper.findCurrentMoney(pay_id);
		return currentMoney;
	}

	@Override
	public String findPayid(String pay_id) {
		// TODO Auto-generated method stub
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		String id = payMapper.findPayid(pay_id);
		return id;
	}

	@Override
	public List<PayVO> findChargelist(String pay_id, String pay_status, int startrow1, int endrow1) {
		// TODO Auto-generated method stub
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		List<PayVO> vo = payMapper.findChargelist(pay_id, pay_status, startrow1, endrow1);
		return vo;
	}
	
	@Override
	public List<PayVO> findCancellist(String pay_id, String pay_status, int startrow2, int endrow2) {
		// TODO Auto-generated method stub
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		List<PayVO> vo = payMapper.findCancellist(pay_id, pay_status, startrow2, endrow2);
		return vo;
	}

	@Override
	public int getPaycount(String pay_status, String pay_id) {
		// TODO Auto-generated method stub
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		int res = payMapper.getPaycount(pay_status, pay_id);
		return res;
	}

	@Override
	public void changeMoney(String pay_id, String amount) {
		// TODO Auto-generated method stub
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		payMapper.changeMoney(pay_id, amount);
	}

	@Override
	public void insertPayment(PaymentVO vo) {
		// TODO Auto-generated method stub
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		payMapper.insertPayment(vo);
	}

	@Override
	public List<PaymentVO> getPaymentlist(String userId, int startrow3, int endrow3) {
		// TODO Auto-generated method stub
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		List<PaymentVO> vo = payMapper.getPaymentlist(userId, startrow3, endrow3);
		return vo;
	}

	@Override
	public int getPaymentcount(String payment_userId) {
		// TODO Auto-generated method stub
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		int res = payMapper.getPaymentcount(payment_userId);
		return res;
	}

	@Override
	public PaymentVO getPayment(String payment_userId) {
		// TODO Auto-generated method stub
		PayMapper payMapper = sqlSession.getMapper(PayMapper.class);
		PaymentVO vo = payMapper.getPayment(payment_userId);
		return vo;
	}
}
