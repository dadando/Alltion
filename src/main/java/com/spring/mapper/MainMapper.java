package com.spring.mapper;

import java.util.List;

import com.spring.alltion.productRegistration.ProductVO;

public interface MainMapper {
	// 인기 경매
	public List<ProductVO> getPopularList();
	// 실시간 경매
	public List<ProductVO> getRecentList();
	// 마감 임박 경매
	public List<ProductVO> getCloseDeadlineList();
}
