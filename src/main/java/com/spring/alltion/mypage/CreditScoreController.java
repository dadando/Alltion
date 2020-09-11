package com.spring.alltion.mypage;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.alltion.creditScore.CreditScoreService;
import com.spring.alltion.creditScore.PurchaseCreditScoreVO;
import com.spring.alltion.creditScore.SaleCreditScoreVO;



@Controller
public class CreditScoreController  {
	
	@Autowired
	private CreditScoreService creditScoreService;
	
	@RequestMapping(value = "creditScore.hn")
	public String checkCreditScore(Model model, HttpSession session) throws Exception {
		
		String userId = (String)session.getAttribute("userId");
		
        if(userId == null) {
        	return "member/login";
        } else {
        	SaleCreditScoreVO salevo = creditScoreService.getSaleCreditScore(userId);
        	model.addAttribute("saleCreditVO", salevo);
        	
        	PurchaseCreditScoreVO purchasevo = creditScoreService.getPurchaseCreditScore(userId);
        	model.addAttribute("purchaseCreditVO", purchasevo);
        
        	return "mypage/creditScore";
        }
	}
	
	
	// 구매 카운트
	@RequestMapping(value = "/saleNormalCount.hn")
	public void saleNormalCount(SaleCreditScoreVO salevo, HttpServletResponse response, HttpSession session) throws Exception {
		
		String userId = (String)session.getAttribute("userId");
		salevo.setSale_id(userId);

		int result = creditScoreService.saleNormalCount(salevo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if (result != 0) {
			writer.write("<script>location.href='./creditScore.hn';</script>");
		} else {
			writer.write("<script>alert('다시 시도해 주십시오');location.href='./mypage.kj';</script>");
		}
	}
	
	/* 구매 및 판매 신용도 테스트 */
	@RequestMapping(value = "/saleDenialCount.hn")
	public void saleDenialCount(SaleCreditScoreVO salevo, HttpServletResponse response, HttpSession session) throws Exception {
		
		String userId = (String)session.getAttribute("userId");
		salevo.setSale_id(userId);

		int result = creditScoreService.saleDenialCount(salevo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if (result != 0) {
			writer.write("<script>location.href='./creditScore.hn';</script>");
		} else {
			writer.write("<script>alert('다시 시도해 주십시오');location.href='./mypage.kj';</script>");
		}
	}
	
	@RequestMapping(value = "/saleReturnCount.hn")
	public void saleReturnCount(SaleCreditScoreVO salevo, HttpServletResponse response, HttpSession session) throws Exception {
		
		String userId = (String)session.getAttribute("userId");
		salevo.setSale_id(userId);

		int result = creditScoreService.saleReturnCount(salevo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if (result != 0) {
			writer.write("<script>location.href='./creditScore.hn';</script>");
		} else {
			writer.write("<script>alert('다시 시도해 주십시오');location.href='./mypage.kj';</script>");
		}
	}
	
	@RequestMapping(value = "/saleUndeliveredCount.hn")
	public void saleUndeliveredCount(SaleCreditScoreVO salevo, HttpServletResponse response, HttpSession session) throws Exception {
		
		String userId = (String)session.getAttribute("userId");
		salevo.setSale_id(userId);

		int result = creditScoreService.saleUndeliveredCount(salevo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if (result != 0) {
			writer.write("<script>location.href='./creditScore.hn';</script>");
		} else {
			writer.write("<script>alert('다시 시도해 주십시오');location.href='./mypage.kj';</script>");
		}
	}
	
	@RequestMapping(value = "/purchaseNormalCount.hn")
	public void purchaseNormalCount(PurchaseCreditScoreVO purchasevo, HttpServletResponse response, HttpSession session) throws Exception {
		
		String userId = (String)session.getAttribute("userId");
		purchasevo.setPurchase_id(userId);

		int result = creditScoreService.purchaseNormalCount(purchasevo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if (result != 0) {
			writer.write("<script>location.href='./creditScore.hn';</script>");
		} else {
			writer.write("<script>alert('다시 시도해 주십시오');location.href='./mypage.kj';</script>");
		}
	}
	
	@RequestMapping(value = "/purchaseDenialCount.hn")
	public void purchaseDenialCount(PurchaseCreditScoreVO purchasevo, HttpServletResponse response, HttpSession session) throws Exception {
		
		String userId = (String)session.getAttribute("userId");
		purchasevo.setPurchase_id(userId);

		int result = creditScoreService.purchaseDenialCount(purchasevo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if (result != 0) {
			writer.write("<script>location.href='./creditScore.hn';</script>");
		} else {
			writer.write("<script>alert('다시 시도해 주십시오');location.href='./mypage.kj';</script>");
		}
	}
	
	@RequestMapping(value = "/purchaseReturnCount.hn")
	public void purchaseReturnCount(PurchaseCreditScoreVO purchasevo, HttpServletResponse response, HttpSession session) throws Exception {
		
		String userId = (String)session.getAttribute("userId");
		purchasevo.setPurchase_id(userId);

		int result = creditScoreService.purchaseReturnCount(purchasevo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if (result != 0) {
			writer.write("<script>location.href='./creditScore.hn';</script>");
		} else {
			writer.write("<script>alert('다시 시도해 주십시오');location.href='./mypage.kj';</script>");
		}
	}
	
	@RequestMapping(value = "/purchaseUndeliveredCount.hn")
	public void purchaseUndeliveredCount(PurchaseCreditScoreVO purchasevo, HttpServletResponse response, HttpSession session) throws Exception {
		
		String userId = (String)session.getAttribute("userId");
		purchasevo.setPurchase_id(userId);

		int result = creditScoreService.purchaseUndeliveredCount(purchasevo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if (result != 0) {
			writer.write("<script>location.href='./creditScore.hn';</script>");
		} else {
			writer.write("<script>alert('다시 시도해 주십시오');location.href='./mypage.kj';</script>");
		}
	}
}
