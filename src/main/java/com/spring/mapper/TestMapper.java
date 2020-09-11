package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.login.MemberVO;
import com.spring.alltion.test.Product_kjVO;
import com.spring.alltion.test.Test_emoneyVO;
import com.spring.alltion.detailpage.ReviewVO;

public interface TestMapper {
	public List<Product_kjVO> getProductlist(@Param(value="userId")String userId);
	public List<Product_kjVO> getdelivery_before(@Param(value="userId")String userId);
	public int after_deposit(Product_kjVO Product_kjvo, @Param(value="trading_product_number")int trading_product_number, @Param(value="trading_buyer_id") String trading_buyer_id);	
	public List<Product_kjVO> getdeposit_before(@Param(value="userId")String userId);
	public List<Product_kjVO> getSalelist(@Param(value="userId")String userId);
	public List<Product_kjVO> getdealcomplete_seller(@Param(value="userId")String userId);
	
	public List<Product_kjVO> getdeliveryList(@Param(value="userId")String userId);
	
	public List<Product_kjVO> getdealcomplete_buyer(@Param(value="userId")String userId);
	public int deliverycomplete(Product_kjVO Product_kjvo, @Param(value="product_number")int product_number);
	
	
	public Test_emoneyVO selectEmoney(@Param(value="userId")String userId);
	public Product_kjVO selectProduct(@Param(value="userId")String userId, @Param(value="product_number")int product_number);
	public Product_kjVO Waybill(@Param(value="userId")String userId, @Param(value="product_number")int product_number);
	public int update_deal_address(MemberVO membervo);	
	public int updateWaybill(Product_kjVO Product_kjvo);
	
	public int insertReview(ReviewVO Reviewvo);
	
	public String findSubjectFromNum(@Param(value="product_number")int product_number);
	public int updatetrading_transaction_method(Product_kjVO Product_kjvo, @Param(value="trading_transaction_method") String trading_transaction_method, @Param(value="product_number")int product_number);
	public void update_trading_progress(int trading_product_number);
	
	public int update_trading_address(Product_kjVO Product_kjvo);
	
	

}
