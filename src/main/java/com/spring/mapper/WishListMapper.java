package com.spring.mapper;

import java.util.HashMap;

public interface WishListMapper {
	// 해당 아이디의 위시리스트 갯수를 가져온다
	int getWishListCount(String userId);
	
	// 위시리스트를 삭제한다
	void deleteWishList(HashMap<String, Object> hm);
}
