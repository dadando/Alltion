package com.spring.alltion.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BiddingController {
	
	@Autowired
	private BiddingServiceImpl biddingService;
	
	@RequestMapping("/bidding.hs")
	public String bidding_page(HttpSession session,Model model,HttpServletRequest request)throws Exception{
		String userId = (String)session.getAttribute("userId");
		biddingService.getBidding_Product_Info(userId, model,request);
		model.addAttribute("page",Integer.parseInt(request.getParameter("page")));
  
		return "mypage/bidding";
	}
}
