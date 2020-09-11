package com.spring.alltion.detailpage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.alltion.productRegistration.ProductVO;
import com.spring.mapper.DetailMapper;

@Service
public class DetailServiceImpl {

	@Autowired
	private SqlSession sqlSession;
	
	//경매 상품 정보 불러오기
	public ProductVO getDetail(int product_number,Model model) {
		DetailMapper detailmapper = sqlSession.getMapper(DetailMapper.class);
		ProductVO productvo = detailmapper.getDetail(product_number);
		// 1차 카테고리 다듬기
		String product_category_1 = productvo.getProduct_category_1();
		productvo.setProduct_category_1(TranslateCate_1(product_category_1));
		
		// 2차 카테고리 다듬기
		String product_category_2 = productvo.getProduct_category_2();
		model.addAttribute("category_2_eng",product_category_2);
		productvo.setProduct_category_2(TranslateCate_2(product_category_2));
		
		// 거래방법 한글로 다듬기 (택배)
		String product_delivery = productvo.getProduct_delivery();
		if(product_delivery.equals("before")) {
			product_delivery = "선불";
		}else if(product_delivery.equals("after")) {
			product_delivery = "착불";
		}else{
			product_delivery = "불가능";
		}
		productvo.setProduct_delivery(product_delivery);
		
		// 거래방법 한글로 다듬기 (직거래)
		String product_transaction_area = productvo.getProduct_transaction_area();
		if(product_transaction_area.equals("none")) {
			product_transaction_area = "불가능";
		}
		
		productvo.setProduct_transaction_area(product_transaction_area);
		
		return productvo;
	}
	
	// 판매자 신용정보 불러오기
	public Seller_Credit_Score_TestVO seller_credit_score_test(String sale_id) {
		DetailMapper detailmapper = sqlSession.getMapper(DetailMapper.class);
		Seller_Credit_Score_TestVO scstvo = detailmapper.sellerTest(sale_id);
		
		return scstvo;
	}
	
	/*
	// 남은 시간이 완료되었을때 경매가 종료되고
	// product테이블의 product_progress 가 1로바뀜 (경매진행중일때는 0임)
	public int update_product_progress(int product_number) {
		DetailMapper detailmapper = sqlSession.getMapper(DetailMapper.class);
		
		return detailmapper.update_product_progress(product_number);
	}
	*/
	// 1차 카테고리 한글 변환 (저장은 영어로되어있음)
	public String TranslateCate_1(String product_category_1) {
		
		switch(product_category_1) {
			case "cate01":
				product_category_1 = "패션";
				break;
			case "cate02":
				product_category_1 = "뷰티";
				break;
			case "cate03":
				product_category_1 = "출산/유아동";
				break;
			case "cate04":
				product_category_1 = "전자기기";
				break;
			case "cate05":
				product_category_1 = "가전제품";
				break;
			case "cate06":
				product_category_1 = "가구/인테리어";
				break;
			case "cate07":
				product_category_1 = "반려동물/취미";
				break;
			case "cate08":
				product_category_1 = "도서/음반/문구";
				break;
			case "cate09":
				product_category_1 = "티켓/쿠폰";
				break;
			case "cate10":
				product_category_1 = "스포츠";
				break;
			case "cate11":
				product_category_1 = "공구/산업";
				break;
			case "cate12":
				product_category_1 = "기타잡화";
				break;
			default:
				product_category_1 = "기타잡화";
				break;
		}
		
		return product_category_1;
	}
	
	// 2차 카테고리 한글 변환 (저장은 영어로되어있음)
	public String TranslateCate_2(String product_category_2) {
		// 2차 카테고리 전부다 만들었음.
		switch(product_category_2) {
		case "cate0101":
			product_category_2 = "여성의류";
			break;
		case "cate0102":
			product_category_2 = "남성의류";
			break;
		case "cate0103":
			product_category_2 = "여성신발";
			break;
		case "cate0104":
			product_category_2 = "남성신발";
			break;
		case "cate0105":
			product_category_2 = "액세서리";
			break;
		case "cate0106":
			product_category_2 = "귀금속";
			break;
		case "cate0107":
			product_category_2 = "모자";
			break;
		case "cate0108":
			product_category_2 = "기타잡화/관련용품";
			break;
		case "cate0109":
			product_category_2 = "수입명품";
			break;
//---------------------------------------------------------------------------------------
		case "cate0201":
			product_category_2 = "스킨케어";
			break;
		case "cate0202":
			product_category_2 = "메이크업";
			break;
		case "cate0203":
			product_category_2 = "헤어/바디";
			break;
		case "cate0204":
			product_category_2 = "향수";
			break;
		case "cate0205":
			product_category_2 = "네일케어";
			break;
		case "cate0206":
			product_category_2 = "남성 화장품";
			break;
		case "cate0207":
			product_category_2 = "가발/기타용품";
			break;
//---------------------------------------------------------------------------------------		
		case "cate0301":
			product_category_2 = "출산/육아용품";
			break;
		case "cate0302":
			product_category_2 = "유아동안전/실내용품";
			break;
		case "cate0303":
			product_category_2 = "유아동의류";
			break;
		case "cate0304":
			product_category_2 = "유아동잡화";
			break;
		case "cate0305":
			product_category_2 = "유아동가구";
			break;
		case "cate0306":
			product_category_2 = "기타 유아동용품";
			break;
//---------------------------------------------------------------------------------------
		case "cate0401":
			product_category_2 = "모바일";
			break;
		case "cate0402":
			product_category_2 = "태블릿 PC";
			break;
		case "cate0403":
			product_category_2 = "노트북";
			break;
		case "cate0404":
			product_category_2 = "데스크탑";
			break;
		case "cate0405":
			product_category_2 = "카메라";
			break;
		case "cate0406":
			product_category_2 = "캠코더";
			break;
//---------------------------------------------------------------------------------------
		case "cate0501":
			product_category_2 = "냉장고";
			break;
		case "cate0502":
			product_category_2 = "TV";
			break;
		case "cate0503":
			product_category_2 = "세탁기/건조기";
			break;
		case "cate0504":
			product_category_2 = "주방가전";
			break;
		case "cate0505":
			product_category_2 = "스마트홈";
			break;
		case "cate0506":
			product_category_2 = "영상가전";
			break;
		case "cate0507":
			product_category_2 = "음향가전";
			break;
		case "cate0508":
			product_category_2 = "계절가전";
			break;
		case "cate0509":
			product_category_2 = "생활가전";
			break;
		case "cate0510":
			product_category_2 = "기타 가전제품";
			break;
//---------------------------------------------------------------------------------------
		case "cate0601":
			product_category_2 = "침실가구";
			break;
		case "cate0602":
			product_category_2 = "거실가구";
			break;
		case "cate0603":
			product_category_2 = "주방가구";
			break;
		case "cate0604":
			product_category_2 = "수납/선반/공간박스";
			break;
		case "cate0605":
			product_category_2 = "사무용가구";
			break;
		case "cate0606":
			product_category_2 = "기타가구";
			break;
		case "cate0607":
			product_category_2 = "침구";
			break;
		case "cate0608":
			product_category_2 = "커튼/카페트";
			break;
		case "cate0609":
			product_category_2 = "인테리어소품";
			break;
		case "cate0610":
			product_category_2 = "이벤트/파티용품";
			break;
		case "cate0611":
			product_category_2 = "리빙생활";
			break;
//---------------------------------------------------------------------------------------
		case "cate0701":
			product_category_2 = "반려동물";
			break;
		case "cate0702":
			product_category_2 = "키덜트";
			break;
		case "cate0703":
			product_category_2 = "핸드메이드/DIY";
			break;
		case "cate0704":
			product_category_2 = "악기";
			break;
		case "cate0705":
			product_category_2 = "예술작품/골동품/수집";
			break;
		case "cate0706":
			product_category_2 = "미술재료/미술도구";
			break;
		case "cate0707":
			product_category_2 = "게임";
			break;
//---------------------------------------------------------------------------------------
		case "cate0801":
			product_category_2 = "유아동도서/음반";
			break;
		case "cate0802":
			product_category_2 = "학습/교육";
			break;
		case "cate0803":
			product_category_2 = "소설/만화책";
			break;
		case "cate0804":
			product_category_2 = "여행/취미/레저";
			break;
		case "cate0805":
			product_category_2 = "문화/과학/경영";
			break;
		case "cate0806":
			product_category_2 = "예술/디자인";
			break;
		case "cate0807":
			product_category_2 = "잡지";
			break;
		case "cate0808":
			product_category_2 = "기타 도서";
			break;
		case "cate0809":
			product_category_2 = "음반/DVD/굿즈";
			break;
		case "cate0810":
			product_category_2 = "문구/사무용품";
			break;
		
//---------------------------------------------------------------------------------------
		case "cate0901":
			product_category_2 = "티켓";
			break;
		case "cate0902":
			product_category_2 = "상품권/쿠폰";
			break;
		case "cate0903":
			product_category_2 = "여행숙박/이용권";
			break;
		case "cate0904":
			product_category_2 = "기타티켓/쿠폰/이용권";
			break;
//---------------------------------------------------------------------------------------
		case "cate1001":
			product_category_2 = "골프";
			break;
		case "cate1002":
			product_category_2 = "자전거";
			break;
		case "cate1003":
			product_category_2 = "인라인/스케이트/전동";
			break;
		case "cate1004":
			product_category_2 = "축구";
			break;
		case "cate1005":
			product_category_2 = "야구";
			break;
		case "cate1006":
			product_category_2 = "농구";
			break;
		case "cate1007":
			product_category_2 = "라켓스포츠";
			break;
		case "cate1008":
			product_category_2 = "헬스/요가";
			break;
		case "cate1009":
			product_category_2 = "수상스포츠";
			break;
		case "cate1010":
			product_category_2 = "검도/격투/권투";
			break;
		case "cate1011":
			product_category_2 = "기타 스포츠";
			break;
		case "cate1012":
			product_category_2 = "레저/여행";
			break;
//---------------------------------------------------------------------------------------
		case "cate1101":
			product_category_2 = "드릴/전동공구";
			break;
		case "cate1102":
			product_category_2 = "에어/유압";
			break;
		case "cate1103":
			product_category_2 = "작업공구";
			break;
		case "cate1104":
			product_category_2 = "측정공구";
			break;
		case "cate1105":
			product_category_2 = "초경/절삭/접착윤활";
			break;
		case "cate1106":
			product_category_2 = "전기/전자";
			break;
		case "cate1107":
			product_category_2 = "배관설비/포장운송";
			break;
		case "cate1108":
			product_category_2 = "금형공작";
			break;
		case "cate1109":
			product_category_2 = "용접기자재";
			break;
		case "cate1110":
			product_category_2 = "산업/안전/공구함";
			break;
		case "cate1111":
			product_category_2 = "산업자재";
			break;
		case "cate1112":
			product_category_2 = "농기계/농업용공구";
			break;
//---------------------------------------------------------------------------------------
		default: //cate1201
			product_category_2 = "기타잡화";
			break;
		}
		
		return product_category_2;
	}
	
	public List<ReviewVO> reviewListService(String review_id, int page, Model model) {
		DetailMapper detailmapper = sqlSession.getMapper(DetailMapper.class);
		
		int review_page = 1;
		int review_limit = 5;
		if(page!=0) {
			review_page = page;
		}
		int review_listcount = 0;
		review_listcount = reviewListCount(review_id);
		int review_endrow = review_listcount - (review_page-1)*5;
		int review_startrow = review_endrow - review_limit +1;
		
		int review_maxpage = (int)((double)review_listcount/review_limit+0.9);
		int review_startpage = (((int)((double)review_page/10+0.9))-1)*10+1;
		int review_endpage = review_maxpage;
		if(review_endpage>review_startpage+10-1) {
			review_endpage = review_startpage+10-1;
		}
		model.addAttribute("review_page",review_page);
		model.addAttribute("review_maxpage",review_maxpage);
		model.addAttribute("review_startpage",review_startpage);
		model.addAttribute("review_endpage",review_endpage);
		model.addAttribute("review_listcount",review_listcount);
		
		return detailmapper.reviewList(review_id,review_startrow,review_endrow);
	}
	
	public int reviewListCount(String review_id) {
		DetailMapper detailmapper = sqlSession.getMapper(DetailMapper.class);
		
		return detailmapper.getReviewCount(review_id);
	}

	public void ViewCountService(int product_number) {
		DetailMapper detailmapper = sqlSession.getMapper(DetailMapper.class);
		detailmapper.viewcount(product_number);
	}

	public int insertWishListService(int wish_product_number, String wish_id) {
		DetailMapper detailmapper = sqlSession.getMapper(DetailMapper.class);
		int wishList_count = detailmapper.getWishlistCount(wish_product_number,wish_id);
		if(wishList_count == 0) {
			detailmapper.insertWishList(wish_product_number,wish_id);
		}
		
		return wishList_count;
	}
}
