package com.spring.mapper;

import com.spring.alltion.trading.TradingVO;

public interface TradingMapper {
	// 경매마감된 상품을 거래중테이블에 삽입한다
	int tradingInsertTheProductEnd(TradingVO tradingVO);
}
