package com.spring.alltion.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alltion.login.MemberVO;
import com.spring.alltion.mypage.Pagination;
import com.spring.alltion.pay.PayVO;
import com.spring.alltion.pay.PaymentVO;
import com.spring.alltion.productRegistration.ProductVO;
import com.spring.alltion.trading.TradingVO;
import com.spring.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public HashMap<String, Object> getAdminHomeData() {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int memberCount =  adminMapper.getMemberCount();
//		System.out.println("memberCount = " + memberCount);
		
		int productCount =  adminMapper.getProductCount();
//		System.out.println("productCount = " + productCount);
		
		int tradingCount =  adminMapper.getTradingCount();
//		System.out.println("tradingCount = " + tradingCount);
		
		int bidCount =  adminMapper.getBidCount();
//		System.out.println("bidCount = " + bidCount);
		
		int paySum =  adminMapper.getPaySum();
//		System.out.println("paySum = " + paySum);
		
		ArrayList<Integer> dailyAuctionList = new ArrayList<Integer>();
		for (int i = 7; i >= 1; i--) {
			int dailyAuction =  adminMapper.getDailyAuction(i);
			dailyAuctionList.add(dailyAuction);
//			System.out.println("dailyAuction = " + dailyAuction);
		}
		
		ArrayList<Integer> cateCountList = new ArrayList<Integer>();
		for (int i = 1; i <= 12; i++) {
			String cateName = "cate";
			if (i < 10) {
				cateName += 0 + Integer.toString(i);
			} else {
				cateName += Integer.toString(i);
			}
			
			int cateCount =  adminMapper.getCateCount(cateName);
			cateCountList.add(cateCount);
//			System.out.println("cateCount = " + cateCount);
		}
		
		ArrayList<Integer> dailySubscribersList = new ArrayList<Integer>();
		for (int i = 7; i >= 1; i--) {
			int dailySubscribers =  adminMapper.getDailySubscribers(i);
			dailySubscribersList.add(dailySubscribers);
//			System.out.println("dailySubscribers = " + dailySubscribers);
		}
		
		HashMap<String, Object> adminHomeData = new HashMap<String, Object>();
		adminHomeData.put("memberCount", memberCount);
		adminHomeData.put("productCount", productCount);
		adminHomeData.put("tradingCount", tradingCount);
		adminHomeData.put("bidCount", bidCount);
		adminHomeData.put("paySum", paySum);
		adminHomeData.put("dailyAuctionList", dailyAuctionList);
		adminHomeData.put("cateCountList", cateCountList);
		adminHomeData.put("dailySubscribersList", dailySubscribersList);
		
		return adminHomeData;
	}
	
	@Override
	public HashMap<String, Object> getAdminMemberDate(AdminMemberVO adminMemberVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		
		int page = adminMemberVO.getPage();
		int listcount = adminMapper.getMemberListCount(adminMemberVO);
		
		Pagination pagination = new Pagination(page, listcount, 15, 10);
		pagination.setPageInfo();
		
		int startrow = pagination.getStartrow();
		int endrow = pagination.getEndrow();
		
		adminMemberVO.setStartrow(startrow);
		adminMemberVO.setEndrow(endrow);
		
		List<MemberVO> memberList = adminMapper.getMemberList(adminMemberVO);
		
		HashMap<String, Object> adminMemberDate = new HashMap<String, Object>();
		adminMemberDate.put("pagination", pagination);
		adminMemberDate.put("listcount", listcount);
		adminMemberDate.put("memberList", memberList);
		
		return adminMemberDate;
	}
	
	@Override
	public void adminMemberUpdate(AdminMemberVO adminMemberVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		adminMapper.adminMemberUpdate(adminMemberVO);
	}
	
	@Override
	public HashMap<String, Object> getAdminProductDate(AdminProductVO adminProductVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		
		int page = adminProductVO.getPage();
		int listcount = adminMapper.getProductListCount(adminProductVO);
		
		Pagination pagination = new Pagination(page, listcount, 15, 10);
		pagination.setPageInfo();
		
		int startrow = pagination.getStartrow();
		int endrow = pagination.getEndrow();
		
		adminProductVO.setStartrow(startrow);
		adminProductVO.setEndrow(endrow);
		
		List<ProductVO> productList = adminMapper.getProductList(adminProductVO);
		
		for (ProductVO vo : productList) {
			vo.changeTranslateCate_1ToKorean();
		}
		
		HashMap<String, Object> adminProductDate = new HashMap<String, Object>();
		adminProductDate.put("pagination", pagination);
		adminProductDate.put("listcount", listcount);
		adminProductDate.put("productList", productList);
		
		return adminProductDate;
	}
	
	@Override
	public void adminProductEnd(ProductVO productVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		
		adminMapper.adminProductEnd(productVO);
	}
	
	@Override
	public HashMap<String, Object> getAdminTradingtDate(AdminTradingVO adminTradingVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		
		int page = adminTradingVO.getPage();
		int listcount = adminMapper.getTradingListCount(adminTradingVO);
		
		Pagination pagination = new Pagination(page, listcount, 15, 10);
		pagination.setPageInfo();
		
		int startrow = pagination.getStartrow();
		int endrow = pagination.getEndrow();
		
		adminTradingVO.setStartrow(startrow);
		adminTradingVO.setEndrow(endrow);
		
		List<AdminProductJoinTradingVO> tradingList = adminMapper.getTradingList(adminTradingVO);
		
		HashMap<String, Object> adminTradingDate = new HashMap<String, Object>();
		adminTradingDate.put("pagination", pagination);
		adminTradingDate.put("listcount", listcount);
		adminTradingDate.put("tradingList", tradingList);
		
		return adminTradingDate;
	}
	
	@Override
	public TradingVO adminDeadlineExtension(TradingVO tradingVO, int target) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		
		HashMap<String, Object> hm = new HashMap<String,  Object>();
        hm.put("tradingVO", tradingVO);
        hm.put("target", target);
		
		adminMapper.adminDeadlineExtension(hm);
		
		TradingVO newTradingVO = adminMapper.getTradingDeadline(tradingVO);
		
		return newTradingVO;
	}
	
	@Override
	public TradingVO adminTradingReset(TradingVO tradingVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		
		adminMapper.adminTradingReset(tradingVO);
		
		int productNumber = tradingVO.getTrading_product_number();
		String buyerId = tradingVO.getTrading_buyer_id();
		String productSubject = adminMapper.getProductSubject(productNumber);
		String TradingPrice = Integer.toString(tradingVO.getTrading_price());
		String currentMoney = adminMapper.findCurrentMoney(buyerId);
		String newCurrentMoney = Integer.toString((Integer.parseInt(TradingPrice) + Integer.parseInt(currentMoney)));
		
		PaymentVO paymentVO = new PaymentVO();
		paymentVO.setPayment_userId(buyerId);
		paymentVO.setPayment_product_subject(productSubject);
		paymentVO.setPayment_amount(TradingPrice);
		paymentVO.setPayment_lastmoney(currentMoney);
		paymentVO.setPayment_nowmoney(newCurrentMoney);
		paymentVO.setPayment_status("거래취소");
		
		adminMapper.adminCancelPayment(paymentVO);
		adminMapper.changeMoney(buyerId, newCurrentMoney);
		
		return tradingVO;
	}
	
	@Override
	public HashMap<String, Object> getAdminPayDate(AdminPayVO adminPayVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		
		int page = adminPayVO.getPage();
		int listcount = adminMapper.getPayListCount(adminPayVO);
		
		Pagination pagination = new Pagination(page, listcount, 15, 10);
		pagination.setPageInfo();
		
		int startrow = pagination.getStartrow();
		int endrow = pagination.getEndrow();
		
		adminPayVO.setStartrow(startrow);
		adminPayVO.setEndrow(endrow);
		
		List<PayVO> payList = adminMapper.getPayList(adminPayVO);
		
		ArrayList<String> payDateList = new ArrayList<String>();
		for (PayVO payVO : payList) {
			Date oldPayDate = payVO.getPay_date();
			String newPayDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(oldPayDate);
			payDateList.add(newPayDate);
		}
		
		HashMap<String, Object> adminPayDate = new HashMap<String, Object>();
		adminPayDate.put("pagination", pagination);
		adminPayDate.put("listcount", listcount);
		adminPayDate.put("payList", payList);
		adminPayDate.put("payDateList", payDateList);
		
		return adminPayDate;
	}
}
