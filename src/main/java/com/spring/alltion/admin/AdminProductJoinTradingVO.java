package com.spring.alltion.admin;

import com.spring.alltion.productRegistration.ProductVO;
import com.spring.alltion.trading.TradingVO;

public class AdminProductJoinTradingVO {
	
    TradingVO tradingVO; // 거래
    ProductVO productVO; // 상품
    
	public TradingVO getTradingVO() {
		return tradingVO;
	}
	public void setTradingVO(TradingVO tradingVO) {
		this.tradingVO = tradingVO;
	}
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}
	
}
