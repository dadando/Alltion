package com.spring.alltion.detailpage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.alltion.trading.TradingServiceImpl;
import com.spring.mapper.BidMapper;
import com.spring.mapper.DetailMapper;

@Service
public class BidServiceImpl {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private TradingServiceImpl tradingServiceImpl;
	
	// 응찰 리스트 구하는 서비스.
	public List<BidVO> bidListService(int bno, int page,Model model) {
		BidMapper bidmapper = sqlSession.getMapper(BidMapper.class);
		
		int bid_page = 1; // 응찰리스트 첫 페이지 = 1
		int bid_limit = 10; // 한 페이지에 뿌려줄 응찰 리스트 갯수
		if(page!=0) {
			bid_page = page;
		}
		int bid_listcount = 0;
		bid_listcount = bidmapper.countBidList(bno) - 1; // 상품번호에 대한 응찰리스트 갯수
		int bid_endrow = bid_listcount - (bid_page-1)*10;  // 읽을 마지막 응찰리스트 마지막 row번호
		int bid_startrow = bid_endrow - bid_limit + 1; // 읽기 시작할 응찰리스트 시작할 row번호
		
		int bid_maxpage = (int)((double)bid_listcount/bid_limit+0.9); // 총 페이지 수
		int bid_startpage = (((int)((double)bid_page / 10 + 0.9)) - 1) * 10 + 1; // 현재 페이지 시작 페이지수
		int bid_endpage = bid_maxpage; // 마지막 페이지 수
		if (bid_endpage > bid_startpage+10-1) {
			bid_endpage = bid_startpage + 10 - 1;
		}
		model.addAttribute("bid_page",bid_page);
		model.addAttribute("bid_maxpage",bid_maxpage);
		model.addAttribute("bid_startpage",bid_startpage);
		model.addAttribute("bid_endpage",bid_endpage);
		model.addAttribute("bid_listcount",bid_listcount);
		
		//응찰자수와 참가자수를 갱신해준다.
		bidmapper.updateProduct_bids(bno);
		bidmapper.updateProduct_participants(bno);
		
		return bidmapper.bidList(bno,bid_startrow,bid_endrow);
	}

	// 응찰 하기 서비스.
	public int bidInsertService(BidVO bidvo) {
		BidMapper bidmapper = sqlSession.getMapper(BidMapper.class);
		DetailMapper detailmapper = sqlSession.getMapper(DetailMapper.class);
		
		int bid_product_number = bidvo.getBid_product_number();
		int price = 0;
		String product_top_bidder = " ";
		// 응찰리스트의 수를 구함 =>응찰리스트 순서 정렬용.
		int res = bidmapper.countBidList(bid_product_number);
		bidvo.setBid_no(res);
		
		if(res==1) {
			// 첫 응찰시 현재가로 바로 응찰.
			price = detailmapper.selectNowPrice(bid_product_number);
			bidvo.setBid_price(price);
		}else {
			// 응찰하기 클릭시 +응찰단위 가격으로 응찰이 된다.
			// 두번째 응찰부터
			price = bidmapper.selectNowPrice(bid_product_number);
			price += bidmapper.getProduct_bidding_unit(bid_product_number);
			if(detailmapper.selectPurchasePrice(bid_product_number)!=0 && price >= detailmapper.selectPurchasePrice(bid_product_number)) {
				price = detailmapper.selectPurchasePrice(bid_product_number);
				
			}
			
			bidvo.setBid_price(price);
		}
		product_top_bidder = bidvo.getBid_id();
		
		// 낙찰되었을 때 product테이블의 product_progress 수정하기  (0: 진행중 , 1: 낙찰됨)
		int product_purchase_price = detailmapper.selectPurchasePrice(bid_product_number);
		
//		if(price == product_purchase_price) {
//			detailmapper.updateProductProgress(bid_product_number);
//			
//		}
		
		// 상세보기의 현재가 갱신
		detailmapper.updateBoard(price,bid_product_number);
		// 응찰 테이블에 입력.
		int rest = bidmapper.bidInsert(bidvo);
		if(price == product_purchase_price) {
			tradingServiceImpl.endOfAuction(bid_product_number);
			rest=2;
		}
		
		return rest;
	}

	// 즉시 구매하기 서비스.
	public int bidpurchaseService(BidVO bidvo) {
		BidMapper bidmapper = sqlSession.getMapper(BidMapper.class);
		DetailMapper detailmapper = sqlSession.getMapper(DetailMapper.class);
		
		int bid_product_number = bidvo.getBid_product_number();
		int price = 0;
		price = detailmapper.selectPurchasePrice(bid_product_number);
		
		int res = bidmapper.countBidList(bid_product_number);
		bidvo.setBid_no(res);
		bidvo.setBid_price(price);
		
		detailmapper.updateBoard(price, bid_product_number);
		
//		detailmapper.updateProductProgress(bid_product_number);
		int rest = bidmapper.bidInsert(bidvo);
		tradingServiceImpl.endOfAuction(bid_product_number);
		
		return rest;
	}

	// 응찰 리스트 갯수
	public int getBid_listcountService(int product_number) {
		BidMapper bidmapper = sqlSession.getMapper(BidMapper.class);
		int bno = product_number;
		int bid_listcount = 0;
		bid_listcount = bidmapper.countBidList(bno)-1; 
		
		return bid_listcount;
	}

	// 최고응찰자 구하기
	public String getTop_bidderService(int product_number) {
		BidMapper bidmapper = sqlSession.getMapper(BidMapper.class);
		String top_bidder_id;
		
		top_bidder_id = bidmapper.getTop_bidder_id(product_number);
		
		if(top_bidder_id==null) {
			top_bidder_id = "";
		}else {
			top_bidder_id = top_bidder_id.substring(0,3) + "***";
		}
		
		return top_bidder_id;
	}
	
}
