package com.spring.alltion.mypage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.alltion.detailpage.BidServiceImpl;
import com.spring.alltion.detailpage.DetailServiceImpl;
import com.spring.alltion.productRegistration.ProductVO;
import com.spring.mapper.SellingMapper;

@Service
public class SellingServiceImpl {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BidServiceImpl bidService;
	
	@Autowired
	private DetailServiceImpl detailserviceImpl;
	
	public List<ProductVO> getSelling_product_Info(String userId, Model model) {
		SellingMapper sellingmapper = sqlSession.getMapper(SellingMapper.class);
		
		List<ProductVO> productvolist = sellingmapper.getProductVOList(userId);
		List<String> top_bidder_idlist = new ArrayList<String>();
		
		for(int i=0;i<productvolist.size();i++) {
			ProductVO productvo = productvolist.get(i);
			
			int product_number = productvo.getProduct_number();
			
			//최고응찰자 구하기.
			String top_bidder_id = bidService.getTop_bidderService(product_number);
			top_bidder_idlist.add(i,top_bidder_id); 
			
			//카테고리 한글 변환
			String product_category_1 = productvo.getProduct_category_1();
			productvo.setProduct_category_1(detailserviceImpl.TranslateCate_1(product_category_1));
			String product_category_2 = productvo.getProduct_category_2();
			productvo.setProduct_category_2(detailserviceImpl.TranslateCate_2(product_category_2));
			
			//택배 한글 변환
			String product_delivery = productvo.getProduct_delivery();
			if(product_delivery.equals("before")) {
				productvo.setProduct_delivery("선불");
			}else if(product_delivery.equals("after")) {
				productvo.setProduct_delivery("착불");
			}else {
				productvo.setProduct_delivery("불가능");
			}
			
			//직거래 변환
			String product_transaction_area = productvo.getProduct_transaction_area();
			if(product_transaction_area.equals("none")) {
				productvo.setProduct_transaction_area("불가능");
			}
		}
		
		model.addAttribute("top_bidder_idlist",top_bidder_idlist);
		
		return productvolist;
	}

}
