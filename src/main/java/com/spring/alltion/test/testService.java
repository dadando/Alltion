package com.spring.alltion.test;


import java.util.List;

import com.spring.alltion.login.MemberVO;
import com.spring.alltion.detailpage.*;

public interface testService {
	
		public List<Product_kjVO> getProductlist(String userId);
		public List<Product_kjVO> getdelivery_before(String userId);
		public int after_deposit(Product_kjVO Product_kjvo, int trading_product_number,String trading_buyer_id);
		
		public List<Product_kjVO> getdeposit_before(String userId);
		
		public List<Product_kjVO> getSalelist(String userId);
		public int updateWaybill(Product_kjVO Product_kjvo);
		
		public List<Product_kjVO> getdeliveryList(String userId);
		
		public List<Product_kjVO> getdealcomplete_buyer(String userId);
		public List<Product_kjVO> getdealcomplete_seller(String userId);
		
		
		public Test_emoneyVO selectEmoney(String userId);
		public Product_kjVO selectProduct(String userId, int product_number);	
		
		
		public Product_kjVO Waybill(String userId,int product_number);
		public int update_deal_address(MemberVO membervo);
		public int deliverycomplete(Product_kjVO Product_kjvo,int product_number);	
		
		public int insertReview(ReviewVO Reviewvo, int trading_product_number);		
		public String findSubjectFromNum(int product_number);		
		public int updatetrading_transaction_method(Product_kjVO Product_kjvo, String trading_transaction_method, int product_number);
		
		public int update_trading_address(Product_kjVO Product_kjvo);
		

}
