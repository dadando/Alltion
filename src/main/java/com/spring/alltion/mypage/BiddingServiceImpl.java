package com.spring.alltion.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.alltion.detailpage.DetailServiceImpl;
import com.spring.alltion.productRegistration.ProductVO;
import com.spring.mapper.BiddingMapper;

@Service
public class BiddingServiceImpl {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DetailServiceImpl detailserviceImpl;
	
	public void getBidding_Product_Info(String userId,Model model,HttpServletRequest request){

		BiddingMapper biddingmapper = sqlSession.getMapper(BiddingMapper.class);
		    
		// 참여중인 경매 리스트 구하기.
		List<Integer> product_numberList = biddingmapper.getProduct_numberList(userId);
		 
		if(product_numberList.size()==0) {
		   	product_numberList.add(0,0);
		}
		     
	    List<ProductVO> Bidding_productvo = biddingmapper.getBidding_productvo(product_numberList);
	        
	    for(int i=0;i<Bidding_productvo.size();i++) {
			ProductVO productvo = Bidding_productvo.get(i);
			//카테고리 한글변환
			String product_category_1 = productvo.getProduct_category_1();
			productvo.setProduct_category_1(detailserviceImpl.TranslateCate_1(product_category_1));
			String product_category_2 = productvo.getProduct_category_2();
			productvo.setProduct_category_2(detailserviceImpl.TranslateCate_2(product_category_2));
			        
			//택배 한글 변환
			String product_delivery = productvo.getProduct_delivery();
			if(product_delivery.equals("before")) {
			   productvo.setProduct_delivery("선불");
			}else if(product_delivery.equals("after")) {
			   productvo.setProduct_delivery("착불");
			}else {
			   productvo.setProduct_delivery("불가능");
			}
			
			//직거래 변환
			String product_transaction_area = productvo.getProduct_transaction_area();
			if(product_transaction_area.equals("none")) {
			   productvo.setProduct_transaction_area("불가능");
			}
	    }
	    model.addAttribute("productvolist",Bidding_productvo);
  
	      
		// 나의 입찰가 구하기
		List<Integer> bid_product_numberList = biddingmapper.getBid_product_numberList(userId);
		
		if(bid_product_numberList.size()!=0){
			List<Integer> bidding_bidvo = biddingmapper.getBidding_bidvo(bid_product_numberList,userId);
			model.addAttribute("bidding_bidvo",bidding_bidvo);
		}
	}
}
