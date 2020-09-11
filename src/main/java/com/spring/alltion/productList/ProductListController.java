package com.spring.alltion.productList;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.alltion.productRegistration.ProductVO;

@Controller
public class ProductListController {
	
	@Autowired
	private ProductlistService productlistService;

	@RequestMapping(value = "/Mainlist.ms", method = RequestMethod.GET)
	public String getMainlist(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int page, @RequestParam(value = "sort", required = false, defaultValue = "1") String sort) {
		// 화면에 출력할 수(한 페이지)
		int limit = 6;
		// 가져올 상품 전체 수
		int listcount = productlistService.getListCount();
		String startrow = Integer.toString((page - 1) * 6 + 1); // 1 7  13 19
		String endrow = Integer.toString(Integer.parseInt(startrow) + limit - 1); // 6 12 18 24
		
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		hashmap.put("sort", sort);
		List<ProductVO> mainlist = productlistService.getMainlist(hashmap);
		// 최대 페이지
		int maxpage = listcount / limit;
		// 화면에 보여질 페이지 나눔 수( 1 2 3 4 5 ) ( 6 7 8 9 10 )...
		int countPage = 5;
		if (listcount % limit > 0) {
			maxpage++;
		}
		if (maxpage < page) {
		    page = maxpage;
		}

		int startpage = ((page - 1) / 5) * 5 + 1;  
		int endpage = startpage + countPage - 1;  
		
		// 마지막 페이지를 보정
		if (endpage > maxpage) {
			endpage = maxpage;
		}
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("mainlist", mainlist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("pricelist", productlistService.getfamousPricelist2());
		model.addAttribute("participantslist", productlistService.getfamousParticipantslist2());
		model.addAttribute("viewslist", productlistService.getfamousViewslist2());
		model.addAttribute("sort", sort);
		
		return "productList/mainlist";
	}
	
	@RequestMapping(value = "/goDetail.ms")
	public String goDetail() {
		
		return "/boardetail.hs";
	}
	
	@RequestMapping(value = "/getCategorylist.ms", method = RequestMethod.GET)
	public String getCategorylist(@RequestParam(value="page" , required=false, defaultValue="1") int page, @RequestParam(value = "product_category_2") String product_category_2, @RequestParam(value = "sort", required = false, defaultValue = "1") String sort, Model model) {
		List<ProductVO> categorylist = null;
		List<ProductVO> pricelist = null;
		List<ProductVO> participantslist = null;
		List<ProductVO> viewslist = null;
		
		int limit = 6;
		int listcount = productlistService.getCategorylistCount(product_category_2);
		String startrow = Integer.toString((page - 1) * 6 + 1); // 1 7  13 19
		String endrow = Integer.toString(Integer.parseInt(startrow) + limit - 1); // 6 12 18 24
		
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		hashmap.put("product_category_2", product_category_2);
		hashmap.put("sort", sort); // 이 값으로 Order by에 필요한 데이터 넘겨짐.
		
		categorylist = productlistService.getCategorylist(hashmap);

		int maxpage = listcount / limit;
		int countPage = 5;
		if (listcount % limit > 0) {
			maxpage++;
		}
		if (maxpage < page) {
		    page = maxpage;
		}

		int startpage = ((page - 1) / 5) * 5 + 1;  
		int endpage = startpage + countPage - 1;  
		
		// 마지막 페이지를 보정
		if (endpage > maxpage) {
			endpage = maxpage;
		}
		pricelist = productlistService.getfamousPricelist(product_category_2);
		participantslist = productlistService.getfamousParticipantslist(product_category_2);
		viewslist = productlistService.getfamousViewslist(product_category_2);
		
		model.addAttribute("categorylist", categorylist);
		model.addAttribute("pricelist", pricelist);
		model.addAttribute("participantslist", participantslist);
		model.addAttribute("viewslist", viewslist);
		
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		String category1 = TranslateCate_1(product_category_2.substring(0, 6));
		String category2 = TranslateCate_2(product_category_2);
		model.addAttribute("category1", category1);
		model.addAttribute("category2", category2);
		model.addAttribute("product_category_2", product_category_2);
		model.addAttribute("sort", sort);

		return "productList/productList";
	}
	
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
	
	public String TranslateCate_2(String product_category_2) {
		
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
			
		default:
			product_category_2 = "기타잡화";
			break;
		}
		
		return product_category_2;
	}
}
