package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.productRegistration.ProductVO;

public interface ProductMapper {
	// 상품(경매) 등록
	int productInsert(ProductVO productVO);
	
	// 경매마감일이 지났지만 마감처리가 되지않은 경매건들을 찾는다
	List<ProductVO> searchForDeadline();
	
	// 경매마감처리를 한다 (product_progress : 0 -> 1)
	void changePoductProgressToEnd(int productNumber);
	
	// 경매마감시간을 현재시간으로 변경한다
	void changePoductEndDateToNow(int productNumber);
	
	// 상품번호를 파라미터로 하여 상품정보를 가져온다
	ProductVO getProduct(int productNumber);
	
	// 위시리스트에 사용될 상품리스트 조회기능(페이징처리 포함)
	List<ProductVO> getProductForWishList(
			@Param(value = "userId") String userId,
			@Param(value = "startrow") int startrow,
			@Param(value = "endrow") int endrow
	);
}
