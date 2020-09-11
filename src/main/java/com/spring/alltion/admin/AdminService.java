package com.spring.alltion.admin;

import java.util.HashMap;

import com.spring.alltion.productRegistration.ProductVO;
import com.spring.alltion.trading.TradingVO;

public interface AdminService {
	
	public HashMap<String, Object> getAdminHomeData();
	
	public HashMap<String, Object> getAdminMemberDate(AdminMemberVO searchMemberVO);
	
	public void adminMemberUpdate(AdminMemberVO adminMemberVO);
	
	public HashMap<String, Object> getAdminProductDate(AdminProductVO adminproductVO);
	
	public void adminProductEnd(ProductVO productVO);
	
	HashMap<String, Object> getAdminTradingtDate(AdminTradingVO adminTradingVO);
	
	TradingVO adminDeadlineExtension(TradingVO tradingVO, int target);
	
	TradingVO adminTradingReset(TradingVO tradingVO);
	
	HashMap<String, Object> getAdminPayDate(AdminPayVO adminPayVO);
}
