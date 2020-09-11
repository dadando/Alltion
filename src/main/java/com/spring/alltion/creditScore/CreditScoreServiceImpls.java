package com.spring.alltion.creditScore;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.CreditScoreMapper;

@Service
public class CreditScoreServiceImpls implements CreditScoreService {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 판매
	/* 판매 모든 항목 불러오기 */
	public SaleCreditScoreVO getSaleCreditScore(String sale_id) {
		SaleCreditScoreVO saleCreditScorevo = new SaleCreditScoreVO();
		CreditScoreMapper scoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
		saleCreditScorevo = scoreMapper.getSaleCreditScore(sale_id);
		saleCreditScorevo.saleCreditScoreProcess();
		saleCreditScorevo.saleSuccessRateProcess();
		scoreMapper.saleRateScoreCount(saleCreditScorevo);
		
		return saleCreditScorevo;
	}
	
	/* 정상 구매, 구매 거부, 반품, 미배송 불러오기 */
	public SaleCreditScoreVO getSaleScoreInfo(SaleCreditScoreVO salevo) {
		SaleCreditScoreVO saleCreditScorevo = new SaleCreditScoreVO();
		CreditScoreMapper scoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
		saleCreditScorevo = scoreMapper.getSaleScoreInfo(salevo);
		
		return saleCreditScorevo;
	}
	
	
	/* 정상 구매 업데이트 */
	public int saleNormalCount(SaleCreditScoreVO salevo) {
		CreditScoreMapper scoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
		
		// 아이디값 얻어오기
		String sale_id = salevo.getSale_id();
		
		// 노말 업데이트
		scoreMapper.saleNormalCount(salevo);
		
		// 전체 데이터 가지고 오기
		salevo = scoreMapper.getSaleCreditScore(sale_id);

		// 가져온 데이터 재계산
		salevo.saleCreditScoreProcess();
		salevo.saleSuccessRateProcess();
		
		// 재계산된 객체를 업데이트
		return scoreMapper.saleRateScoreCount(salevo);
	}
	
	/* 판매 거부 업데이트 */
	public int saleDenialCount(SaleCreditScoreVO salevo) {
		CreditScoreMapper scoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
		
		// 아이디값 얻어오기
		String sale_id = salevo.getSale_id();
		
		// 판매 거부 업데이트
		scoreMapper.saleDenialCount(salevo);
		 
		// 전체 데이터 가지고 오기
		salevo = scoreMapper.getSaleCreditScore(sale_id);

		// 가져온 데이터 재계산
		salevo.saleCreditScoreProcess();
		salevo.saleSuccessRateProcess();
		
		// 재계산된 객체를 업데이트
		return scoreMapper.saleRateScoreCount(salevo);
	}
	
	/* 반품 업데이트  */
	public int saleReturnCount(SaleCreditScoreVO salevo) {
		CreditScoreMapper scoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
		
		// 아이디값 얻어오기
		String sale_id = salevo.getSale_id();
		
		//  업데이트
		scoreMapper.saleReturnCount(salevo);
		
		// 전체 데이터 가지고 오기
		salevo = scoreMapper.getSaleCreditScore(sale_id);

		// 가져온 데이터 재계산
		salevo.saleCreditScoreProcess();
		salevo.saleSuccessRateProcess();
		
		// 재계산된 객체를 업데이트
		return scoreMapper.saleRateScoreCount(salevo);
	}
	
	/* 미배송 업데이트  */
	public int saleUndeliveredCount(SaleCreditScoreVO salevo) {
		CreditScoreMapper scoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
		
		// 아이디값 얻어오기
		String sale_id = salevo.getSale_id();
		
		// 미배송 업데이트
		scoreMapper.saleUndeliveredCount(salevo);
		
		// 전체 데이터 가지고 오기
		salevo = scoreMapper.getSaleCreditScore(sale_id);

		// 가져온 데이터 재계산
		salevo.saleCreditScoreProcess();
		salevo.saleSuccessRateProcess();
		
		// 재계산된 객체를 업데이트
		return scoreMapper.saleRateScoreCount(salevo);
	}
	
	public int saleRateScoreCount(SaleCreditScoreVO salevo) {
		CreditScoreMapper scoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
		return scoreMapper.saleRateScoreCount(salevo);
	}
	
	
	// 구매
	public PurchaseCreditScoreVO getPurchaseCreditScore(String purchase_id) {
		PurchaseCreditScoreVO purchaseCreditScorevo = new PurchaseCreditScoreVO();
		CreditScoreMapper scoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
		purchaseCreditScorevo = scoreMapper.getPurchaseCreditScore(purchase_id);
		purchaseCreditScorevo.purchaseCreditScoreProcess();
		purchaseCreditScorevo.purchaseSuccessRateProcess();
		scoreMapper.purchaseRateScoreCount(purchaseCreditScorevo);
		
		return purchaseCreditScorevo;
	}
	
	public PurchaseCreditScoreVO getPurchaseScoreInfo(PurchaseCreditScoreVO purchasevo) {
		PurchaseCreditScoreVO purchaseCreditScorevo = new PurchaseCreditScoreVO();
		CreditScoreMapper scoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
		purchaseCreditScorevo = scoreMapper.getPurchaseScoreInfo(purchasevo);
		
		return purchaseCreditScorevo;
	}
	
	/* 정상 구매 업데이트 */
	public int purchaseNormalCount(PurchaseCreditScoreVO purchasevo) {
		CreditScoreMapper scoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
		
		// 아이디값 얻어오기
		String purchase_id = purchasevo.getPurchase_id();
		
		// 정상 거래 업데이트
		scoreMapper.purchaseNormalCount(purchasevo);
		
		// 전체 데이터 가지고 오기
		purchasevo = scoreMapper.getPurchaseCreditScore(purchase_id);

		// 가져온 데이터 재계산
		purchasevo.purchaseCreditScoreProcess();
		purchasevo.purchaseSuccessRateProcess();
		
		// 재계산된 객체를 업데이트
		return scoreMapper.purchaseRateScoreCount(purchasevo);
	}
	
	/* 구매 거부 업데이트 */
	public int purchaseDenialCount(PurchaseCreditScoreVO purchasevo) {
		CreditScoreMapper scoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
		
		// 아이디값 얻어오기
		String purchase_id = purchasevo.getPurchase_id();
		
		// 정상 거래 업데이트
		scoreMapper.purchaseDenialCount(purchasevo);
		
		// 전체 데이터 가지고 오기
		purchasevo = scoreMapper.getPurchaseCreditScore(purchase_id);

		// 가져온 데이터 재계산
		purchasevo.purchaseCreditScoreProcess();
		purchasevo.purchaseSuccessRateProcess();
		
		// 재계산된 객체를 업데이트
		return scoreMapper.purchaseRateScoreCount(purchasevo);
	}
	
	/* 반품 업데이트 */
	public int purchaseReturnCount(PurchaseCreditScoreVO purchasevo) {
		CreditScoreMapper scoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
		
		// 아이디값 얻어오기
		String purchase_id = purchasevo.getPurchase_id();
		
		// 정상 거래 업데이트
		scoreMapper.purchaseReturnCount(purchasevo);
		
		// 전체 데이터 가지고 오기
		purchasevo = scoreMapper.getPurchaseCreditScore(purchase_id);

		// 가져온 데이터 재계산
		purchasevo.purchaseCreditScoreProcess();
		purchasevo.purchaseSuccessRateProcess();
		
		// 재계산된 객체를 업데이트
		return scoreMapper.purchaseRateScoreCount(purchasevo);
	}
	
	/* 미배송 업데이트 */
	public int purchaseUndeliveredCount(PurchaseCreditScoreVO purchasevo) {
		CreditScoreMapper scoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
		
		// 아이디값 얻어오기
		String purchase_id = purchasevo.getPurchase_id();
		
		// 정상 거래 업데이트
		scoreMapper.purchaseUndeliveredCount(purchasevo);
		
		// 전체 데이터 가지고 오기
		purchasevo = scoreMapper.getPurchaseCreditScore(purchase_id);

		// 가져온 데이터 재계산
		purchasevo.purchaseCreditScoreProcess();
		purchasevo.purchaseSuccessRateProcess();
		
		// 재계산된 객체를 업데이트
		return scoreMapper.purchaseRateScoreCount(purchasevo);
	}
	
	public int purchaseRateScoreCount(PurchaseCreditScoreVO purchasevo) {
		CreditScoreMapper scoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
		return scoreMapper.purchaseRateScoreCount(purchasevo);
	}
}
