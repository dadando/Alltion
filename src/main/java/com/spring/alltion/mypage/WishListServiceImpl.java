package com.spring.alltion.mypage;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alltion.productRegistration.ProductVO;
import com.spring.mapper.ProductMapper;
import com.spring.mapper.WishListMapper;

@Service
public class WishListServiceImpl implements WishListService {
	
	@Autowired
	private SqlSession sqlSession;
	
	// wishList페이지에 필요한 정보를 HashMap에 할당하여 리턴한다
	@Override
	public HashMap<String, Object> getContentData(String userId, int page) {
		WishListMapper wishListMapper; // 마이바티스 찜목록맵퍼
		ProductMapper productMapper; // 마이바티스 상품맵퍼
		
		int listcount; // 찜몰록 갯수
		Pagination pagination; // 페이징처리 객체
		List<ProductVO> wishList = null; // 상품정보 리스트
		
		int startrow; // 화면에 나올 첫번째 글번호
		int endrow; // 화면에 나올 마지막 글번호
		
		HashMap<String, Object> contentsData = null; // veiw로 보낼 데이터를 담을 객체
		
		try {
			wishListMapper = sqlSession.getMapper(WishListMapper.class);
			productMapper = sqlSession.getMapper(ProductMapper.class);
			
			// 찜몰록 리스트 수를 받아옴
			listcount = wishListMapper.getWishListCount(userId);
			
			// 페이징 처리 실행
			pagination = new Pagination(page, listcount, 5, 5);
			pagination.setPageInfo();
			
			// 화면에 나올 첫번째 글번호와 마지막 글번호를 할당한다 
			startrow = pagination.getStartrow();
			endrow = pagination.getEndrow();
			
			// 글번호에 따른 상품리스트를 가져온다
			wishList = productMapper.getProductForWishList(userId, startrow, endrow);
			
			// 찜목록이 한개 이상이라면 실행
			if (wishList.size() != 0) {
				// DB형식으로 저장되었는 것들을 변환시켜준다 예) cate0101 -> 여성의류
				for (ProductVO productVO : wishList) {
					productVO.changeToKorean(); // 카테고리, 택배, 직거래 한글로 다듬기
				}
			}
			
			// veiw로 보낼 데이터를 할당한다
			contentsData = new HashMap<String, Object>();
			contentsData.put("pagination", pagination);
			contentsData.put("listcount", listcount);
			contentsData.put("wishList", wishList);
			
		} catch(Exception e) {
			System.out.println("getContentData에러");
			e.printStackTrace();
		}
		
		return contentsData;
	}
	
	// 찜목록 삭제
	@Override
	public void deleteWishList(List<String> deleteWishList, String userId) {
		WishListMapper wishListMapper; // 마이바티스 찜목록맵퍼
		HashMap<String, Object> paramList; // sql문에 들어갈 파라미터List 객체
		
		try {
			wishListMapper = sqlSession.getMapper(WishListMapper.class);
			
			// 로그인아이디와 삭제할 상품번호(복수가능)를 파라미터로 설정후 sql문을 실행한다
			paramList = new HashMap<String, Object>();
			paramList.put("userId", userId);
			paramList.put("deleteWishList", deleteWishList);
			wishListMapper.deleteWishList(paramList);
			
		} catch(Exception e) {
			System.out.println("deleteWishList에러");
			e.printStackTrace();
		}
		
	}
}
