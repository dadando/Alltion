package com.spring.alltion.mypage;

import java.util.HashMap;
import java.util.List;

public interface WishListService {
	// wishList페이지에 필요한 정보를 HashMap에 할당하여 리턴한다
	HashMap<String, Object> getContentData(String userId, int page);
	
	// 찜목록 삭제
	void deleteWishList(List<String> deleteWishList, String userId);
}
