package com.spring.alltion.admin;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.alltion.productRegistration.ProductVO;
import com.spring.alltion.trading.TradingVO;

@RestController
public class AdminRestController {
	
	@Autowired
	private AdminServiceImpl adminServiceImpl;
	
	// 관리자페이지 홈화면 데이터 가져오기
	@RequestMapping(value = "getAdminHomeData.yb", produces="application/json;charset=UTF-8")
	public HashMap<String, Object> getAdminHomeData() {
		HashMap<String, Object> adminHomeData = adminServiceImpl.getAdminHomeData();
		return adminHomeData;
	}
	
	// 관리자페이지 회원관리 화면 데이터 가져오기
	@RequestMapping(value = "getAdminMemberDate.yb", produces="application/json;charset=UTF-8")
	public HashMap<String, Object> getAdminMemberDate(AdminMemberVO adminMemberVO) {
		HashMap<String, Object> adminMemberDate = adminServiceImpl.getAdminMemberDate(adminMemberVO);
		return adminMemberDate;
	}
	
	// 관리자페이지 회원정보 수정하기
	@RequestMapping(value = "adminMemberUpdate.yb", produces="application/json;charset=UTF-8")
	public void adminMemberUpdate(AdminMemberVO adminMemberVO) {
		adminServiceImpl.adminMemberUpdate(adminMemberVO);
	}
	
	// 관리자페이지 상품관리 화면 데이터 가져오기
	@RequestMapping(value = "getAdminProductDate.yb", produces="application/json;charset=UTF-8")
	public HashMap<String, Object> getAdminProductDate(AdminProductVO adminproductVO) {
		HashMap<String, Object> adminProductDate = adminServiceImpl.getAdminProductDate(adminproductVO);
		return adminProductDate;
	}
	
	// 관리자페이지 상품마감 시키기
	@RequestMapping(value = "adminProductEnd.yb", produces="application/json;charset=UTF-8")
	public ProductVO adminProductEnd(ProductVO productVO) {
		adminServiceImpl.adminProductEnd(productVO);
		return productVO;
	}
	
	// 관리자페이지 거래관리 화면 데이터 가져오기
	@RequestMapping(value = "getAdminTradingDate.yb", produces="application/json;charset=UTF-8")
	public HashMap<String, Object> getAdminTradingDate(AdminTradingVO adminTradingVO) {
		HashMap<String, Object> adminTradingDate = adminServiceImpl.getAdminTradingtDate(adminTradingVO);
		return adminTradingDate;
	}
	
	// 관리자페이지 거래기한 연장
	@RequestMapping(value = "adminDeadlineExtension.yb", produces="application/json;charset=UTF-8")
	public TradingVO adminDeadlineExtension(TradingVO tradingVO, int target) {
		TradingVO newTradingVO = adminServiceImpl.adminDeadlineExtension(tradingVO, target);
		return newTradingVO;
	}
	
	// 관리자페이지 거래 초기화
	@RequestMapping(value = "adminTradingReset.yb", produces="application/json;charset=UTF-8")
	public TradingVO adminTradingReset(TradingVO tradingVO) {
		adminServiceImpl.adminTradingReset(tradingVO);
		return tradingVO;
	}
	
	// 관리자페이지 결제관리 화면 데이터 가져오기
	@RequestMapping(value = "getAdminPayDate.yb", produces="application/json;charset=UTF-8")
	public HashMap<String, Object> adminPayDate(AdminPayVO adminPayVO) {
		HashMap<String, Object> adminPayDate = adminServiceImpl.getAdminPayDate(adminPayVO);
		
		return adminPayDate;
	}
}