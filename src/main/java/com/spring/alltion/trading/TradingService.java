package com.spring.alltion.trading;

import com.spring.alltion.productRegistration.ProductVO;
import com.spring.mapper.BidMapper;
import com.spring.mapper.ProductMapper;
import com.spring.mapper.TradingMapper;

public interface TradingService {
	
	// 상품 리스트중 마감시간이 지난것을 찾아서 설정에 따른 처리를 실행한다
	void seachEndOfProduct();
	
	// 경매현재가격이 즉시구매가에 도달했을때 실행될 함수(마감처리)
	void endOfAuction(int product_number);
	
	/* 오버로딩 */
	// 트레이딩(거래중) 테이블 삽입 - seachEndOfProduct에 의한 삽입
	void tradingInsert(ProductVO productVO, ProductMapper producMapper, 
			TradingMapper tradingMapper, BidMapper bidMapper);
	
	/* 오버로딩 */
	// 트레이딩(거래중) 테이블 삽입 - 즉시구매 혹은 즉시구매가가 경매현재가와 같아졌을때
	void tradingInsert(int product_number, ProductMapper producMapper, 
			TradingMapper tradingMapper, BidMapper bidMapper);
	
	// 상품 마감
	void finishProduct(ProductVO productVO, ProductMapper producMapper);
	
	// 재경매 등록
	void reAuction(ProductVO productVO, ProductMapper producMapper);
}
