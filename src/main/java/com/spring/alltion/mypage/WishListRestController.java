package com.spring.alltion.mypage;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WishListRestController {
	
	@Autowired
	private WishListServiceImpl wishListServiceImpl;
	
	// 찜목록 가져오기
	@RequestMapping(value = "getWishList.yb")
	public HashMap<String, Object> getWishList(HttpSession session, int page) {
		String userId = (String)session.getAttribute("userId");
		
		// pagination 페이지 정보, listcount 찜몰록 갯수, wishList 찜목록의 상품내용
		HashMap<String, Object> contentsData = wishListServiceImpl.getContentData(userId, page);
        
		return contentsData;
	}
	
	// 찜목록 삭제
	@RequestMapping(value = "wishListDelete.yb")
	public void wishListDelete(HttpSession session, @RequestParam(value="deleteWishList[]") List<String> deleteWishList) {
		String userId = (String)session.getAttribute("userId");
		wishListServiceImpl.deleteWishList(deleteWishList, userId);
	}
}
