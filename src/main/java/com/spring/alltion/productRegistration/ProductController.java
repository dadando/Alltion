package com.spring.alltion.productRegistration;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.alltion.login.MemberVO;

@Controller
public class ProductController {
	
	// 상품(경매) 등록 페이지로 이동
	@RequestMapping(value = "/registration.yb")
	public String registration(HttpSession session, MemberVO membervo) {
		String userId = (String)session.getAttribute("userId");
        if(userId ==null)
        {
           return "member/login";
        }
        
		return "productRegistration/productRegistration";
	}
}
