package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.productRegistration.ProductVO;

public interface BiddingMapper {

	List<Integer> getProduct_numberList(String userId);

	List<ProductVO> getBidding_productvo(List<Integer> product_numberList);

	List<Integer> getBidding_bidvo(@Param(value="list")List<Integer> product_numberList,@Param(value = "userId") String userId);

	List<Integer> getBid_product_numberList(String userId);

}
