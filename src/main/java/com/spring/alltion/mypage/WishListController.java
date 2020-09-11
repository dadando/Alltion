package com.spring.alltion.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WishListController {
	
	@RequestMapping(value = "wishList.yb")
	public String home(HttpSession session) {
		String userId = (String)session.getAttribute("userId");
        if(userId ==null)
        {
           return "member/login";
        }
        
		return "mypage/wishList";
	}
	
}
