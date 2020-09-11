package com.spring.mapper;

import java.util.List;

import com.spring.alltion.detailpage.ReviewVO;

public interface ReviewMapper {

	List<ReviewVO> getReviewList(String userId);

}
