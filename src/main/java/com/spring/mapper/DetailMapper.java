package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.detailpage.ReviewVO;
import com.spring.alltion.detailpage.Seller_Credit_Score_TestVO;
import com.spring.alltion.productRegistration.ProductVO;

public interface DetailMapper {

	ProductVO getDetail(int product_number);

	int selectNowPrice(int bid_product_number);

	void updateBoard(@Param("price")int price,@Param(value="bid_product_number") int bid_product_number);

	int selectPurchasePrice(int bid_product_number);

	Seller_Credit_Score_TestVO sellerTest(String sale_id);

//	void updateProductProgress(@Param(value="bid_product_number") int bid_product_number);

	int getReviewCount(String review_id);

	List<ReviewVO> reviewList(@Param(value="review_id")String review_id,@Param(value="review_startrow") int review_startrow,@Param(value="review_endrow") int review_endrow);

	void viewcount(int product_number);

	int getWishlistCount(@Param(value="wish_product_number") int wish_product_number, @Param(value="wish_id") String wish_id);

	void insertWishList(@Param(value="wish_product_number") int wish_product_number, @Param(value="wish_id") String wish_id);
	
//	int update_product_progress(int product_number);

}
