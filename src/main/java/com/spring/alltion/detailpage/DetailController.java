package com.spring.alltion.detailpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.alltion.login.MemberService;
import com.spring.alltion.login.MemberVO;
import com.spring.alltion.productRegistration.ProductVO;

@Controller
public class DetailController {
	
	@Autowired
	private DetailServiceImpl detailService;
	
	@Autowired
	private CommentServiceImpl commentService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BidServiceImpl bidService;
	
	//상세페이지로 들어가기위한 작업
	//필요함 지우면안됨. 받아올때 파라미터 product_number값 같이 받아와야됨 
	@RequestMapping("/boarddetail.hs")
	public String boardDetail(@RequestParam(value="product_number")int product_number,Model model) {
		
		// 상품번호를 통해서 상품 상세 정보를 얻는다.
		ProductVO productvo = detailService.getDetail(product_number,model);
		model.addAttribute("productvo",productvo);
		
		// 판매자 정보를 얻는다.
		MemberVO membervo = memberService.selectMember(productvo.getProduct_id());
		model.addAttribute("membervo",membervo);
		
		// 판매자 신용도관련 정보를 얻는다.
		Seller_Credit_Score_TestVO scstvo = detailService.seller_credit_score_test(membervo.getMember_id());
		int sale_credit_score = scstvo.getSale_credit_score();
		String sale_credit = translateSale_credit(sale_credit_score);
		
		model.addAttribute("scstvo",scstvo);
		model.addAttribute("sale_credit",sale_credit); // 판매자 등급제
		
		// 응찰 리스트 갯수를 얻는다.
		int bid_listcount = bidService.getBid_listcountService(product_number);
		model.addAttribute("bid_listcount",bid_listcount);
		
		// 최고응찰자의 정보(아이디)를 얻는다.
		String top_bidder_id = bidService.getTop_bidderService(product_number);
		model.addAttribute("top_bidder_id",top_bidder_id);
		
		// 상품 번호와 응찰리스트 페이지 수를 얻어서 응찰 리스트 페이징을 한다.
		int bno = product_number;
		int bid_page = (int)(double)(bid_listcount/10+0.9);
		bidService.bidListService(bno, bid_page, model);
		
		// 댓글 리스트 갯수를 얻는다.
		int comment_listcount = commentService.getCount_comment(product_number)-1;
		model.addAttribute("comment_listcount",comment_listcount);
		
		// 상품 번호와 응찰리스트 페이지 수를 얻어서 응찰 리스트 페이징을 한다.
		int comment_product_number = product_number;
		int comment_page = (int)(double)(comment_listcount/10+0.9);
		commentService.commentListService(comment_product_number, comment_page, model);
		
		// 초기 (페이지1)리뷰 리스트를 얻는다.
		String review_id = productvo.getProduct_id();
		int review_page = 1;
		detailService.reviewListService(review_id, review_page, model);
		
		// 상세 페이지 클릭시 조회수 +1
		detailService.ViewCountService(product_number);
		
		return "detail_page/board_detail";
	}
	
	public String translateSale_credit(int sale_credit_score) {
		String sale_credit = "";
		
		if(sale_credit_score >= 180) {
			sale_credit = "다이아몬드";
		}else if(sale_credit_score >= 150){
			sale_credit = "플레티넘";
		}else if(sale_credit_score >= 120){
			sale_credit = "골드";
		}else if(sale_credit_score >= 100) {
			sale_credit = "실버";
		}else if(sale_credit_score >= 60) {
			sale_credit = "브론즈";
		}else {
			sale_credit = "등급 없음";
		}
		
		return sale_credit;
	}
	
	@RequestMapping(value="/review_list.hs",produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<ReviewVO> reviewList(@RequestParam String review_id,@RequestParam int page,Model model)throws Exception{
		List<ReviewVO> review_list = detailService.reviewListService(review_id,page,model);
		
		return review_list;
	}
	
	@RequestMapping(value="/wish_list.hs",produces="application/json; charset=UTF-8")
	@ResponseBody
	public int wishList(@RequestParam int wish_product_number,@RequestParam String wish_id)throws Exception{
		int res = detailService.insertWishListService(wish_product_number,wish_id);
		
		return res;
	}
	
	/*
	@RequestMapping(value="/update_product_progress.hs",produces="application/json;charset=UTF-8")
	@ResponseBody
	public int update_Product_Progress(@RequestParam(value="product_number")int product_number) {
		
		int res = detailService.update_product_progress(product_number);
		
		return res;
	}
	*/
}
