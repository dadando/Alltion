package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.productRegistration.ProductVO;

public interface SellingMapper {

	List<ProductVO> getProductVOList(@Param(value="userId")String userId);

}
