package com.spring.alltion.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.alltion.login.MemberServiceImpl;
import com.spring.alltion.login.MemberVO;

@Controller
public class AdminController {
	
	@Autowired
	private MemberServiceImpl memberServiceImpl;
	
	// 관리자페이지 홈으로 이동
	@RequestMapping(value = "adminHome.yb")
	public String adminHome(HttpSession session, MemberVO membervo) {
		String userId = (String)session.getAttribute("userId");
		int managerCheck = memberServiceImpl.check_manager(userId);
        if (managerCheck == 1) {
        	return "admin/admin_home";
        }
        
        return "redirect:/";
	}
	
	// 관리자페이지 회원관리로 이동
	@RequestMapping(value = "adminMember.yb")
	public String adminMember(HttpSession session, MemberVO membervo) {
		String userId = (String)session.getAttribute("userId");
		int managerCheck = memberServiceImpl.check_manager(userId);
        if (managerCheck == 1) {
        	return "admin/admin_member";
        }
        
        return "redirect:/";
	}
	
	// 관리자페이지 상품관리로 이동
	@RequestMapping(value = "adminProduct.yb")
	public String adminProduct(HttpSession session, MemberVO membervo) {
		String userId = (String)session.getAttribute("userId");
		int managerCheck = memberServiceImpl.check_manager(userId);
        if (managerCheck == 1) {
        	return "admin/admin_product";
        }
        
        return "redirect:/";
	}
	
	// 관리자페이지 거래관리로 이동
	@RequestMapping(value = "adminTrading.yb")
	public String adminTrading(HttpSession session, MemberVO membervo) {
		String userId = (String)session.getAttribute("userId");
		int managerCheck = memberServiceImpl.check_manager(userId);
        if (managerCheck == 1) {
        	return "admin/admin_trading";
        }
        
        return "redirect:/";
	}
	
	// 관리자페이지 거래관리로 이동
	@RequestMapping(value = "adminPay.yb")
	public String adminPay(HttpSession session, MemberVO membervo) {
		String userId = (String)session.getAttribute("userId");
		int managerCheck = memberServiceImpl.check_manager(userId);
        if (managerCheck == 1) {
        	return "admin/admin_pay";
        }
        
        return "redirect:/";
	}
}
