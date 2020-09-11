package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.admin.AdminMemberVO;
import com.spring.alltion.admin.AdminPayVO;
import com.spring.alltion.admin.AdminProductJoinTradingVO;
import com.spring.alltion.admin.AdminProductVO;
import com.spring.alltion.admin.AdminTradingVO;
import com.spring.alltion.login.MemberVO;
import com.spring.alltion.pay.PayVO;
import com.spring.alltion.pay.PaymentVO;
import com.spring.alltion.productRegistration.ProductVO;
import com.spring.alltion.trading.TradingVO;

public interface AdminMapper {
	// 회원수
	int getMemberCount();
	
	// 경매건수
	int getProductCount();
	
	// 거래건수
	int getTradingCount();
	
	// 입찰건수
	int getBidCount();
	
	// 결제금액
	int getPaySum();
	
	// 최근 일주일 경매등록수
	int getDailyAuction(int period);
	
	// 카테고리별 상품수
	int getCateCount(String cate);
	
	// 최근 일주일 가입자수
	int getDailySubscribers(int period);
	
	// 멤버리스트 검색결과 갯수
	int getMemberListCount(AdminMemberVO adminMemberVO);
	
	// 멤버리스트 검색결과
	List<MemberVO> getMemberList(AdminMemberVO adminMemberVO);
	
	// 멤버정보 수정
	void adminMemberUpdate(AdminMemberVO adminMemberVO);
	
	// 상품리스트 검색결과 갯수
	int getProductListCount(AdminProductVO adminProductVO);
	
	// 상품리스트 검색결과
	List<ProductVO> getProductList(AdminProductVO adminProductVO);
	
	// 상품마감처리
	void adminProductEnd(ProductVO productVO);
	
	// 거래리스트 검색결과 갯수
	int getTradingListCount(AdminTradingVO adminTradingVO);
	
	// 거래리스트 검색결과
	List<AdminProductJoinTradingVO> getTradingList(AdminTradingVO adminTradingVO);
	
	// 거래기한 연장
	void adminDeadlineExtension(HashMap<String, Object> hm);
	
	// 거래기한 연장 후 새로운 거래기한 가져오기
	TradingVO getTradingDeadline(TradingVO tradingVO);
	
	// 거래 초기화
	void adminTradingReset(TradingVO tradingVO);
	
	// 상품 제목 가져오기
	String getProductSubject(int productNumber);
	
	// 현재 이머니잔액 가져오기
	String findCurrentMoney(String buyerId);
	
	// 거래취소로 인한 이머니 복구
	void adminCancelPayment(PaymentVO paymentVO);
	
	// 현재 이머니잔액 변경
	void changeMoney(@Param(value = "buyerId") String buyerId,
					@Param(value = "newCurrentMoney") String newCurrentMoney);
	
	// 결제리스트 검색결과 갯수
	int getPayListCount(AdminPayVO adminPayVO);
	
	// 결제리스트 검색결과
	List<PayVO> getPayList(AdminPayVO adminPayVO);
}
