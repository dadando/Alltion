package com.spring.alltion.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewServiceImpl reviewService;
	
	@RequestMapping("/review_view.hs")
	public String review_page(HttpSession session,Model model,HttpServletRequest request)throws Exception{
		String userId = (String)session.getAttribute("userId");
		reviewService.getReview_view(userId,model,request);
		model.addAttribute("page",Integer.parseInt(request.getParameter("page")));
		
		return "mypage/review_view";
	}
}
