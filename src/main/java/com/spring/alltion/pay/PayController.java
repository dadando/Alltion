package com.spring.alltion.pay;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//import com.spring.mybatismember.MemberService;
//import com.spring.mybatismember.MemberVO;

@Controller
public class PayController {

	@Autowired
	private PayService payService;
	// private MemberService memberService;

	@RequestMapping(value = "/pay.ms")
	public String home(HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		if (userId == null) {
			return "member/login";
		}
		String currentMoney = payService.findCurrentMoney(userId);
		if (currentMoney == null) {
			currentMoney = "0";
		}
		session.setAttribute("currentMoney", currentMoney);
		return "pay/pay";
	}

	@RequestMapping(value = "/cancel.bo", method = RequestMethod.POST)
	@ResponseBody
	public String cancel(@RequestParam(value = "pay_merchant_uid") String pay_merchant_uid) { // 결제번호 : merchant_uid
		PaymentCheck obj = new PaymentCheck();
		String token = obj.getImportToken();
		int res = obj.cancelPayment(token, pay_merchant_uid);
		if (res == 1) {
			return "Success";
		} else
			return "Failure";
	}

	@RequestMapping(value = "/getSuccessData.bo", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public void goOracle(PayVO payVO) {
		try {
			PayVO vo = new PayVO();
			vo.setPay_merchant_uid(payVO.getPay_merchant_uid());
			vo.setPay_amount(payVO.getPay_amount());
			vo.setPay_status(payVO.getPay_status());
			vo.setPay_id(payVO.getPay_id());

			String id = payService.findPayid(vo.getPay_id());

			if (id == null) {
				payService.insertPaylist(vo.getPay_id());
			}
			// payService.insertPay(vo);

			String pay_id = vo.getPay_id();
			String currentMoney = payService.findCurrentMoney(pay_id);
			if (currentMoney == null) {
				currentMoney = "0";
			}
			vo.setPay_lastmoney(currentMoney);
			String plusMoney = payVO.getPay_amount();
			Integer chargeMoney = Integer.parseInt(currentMoney) + Integer.parseInt(plusMoney);
			String convertChargeMoney = Integer.toString(chargeMoney);
			vo.setPay_nowmoney(convertChargeMoney);
			payService.insertPay(vo);
			payService.chargePay(convertChargeMoney, pay_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/cancelData.bo", method = RequestMethod.POST)
	@ResponseBody
	public void cancelOracle(HttpSession session, @RequestParam(value = "pay_merchant_uid") String pay_merchant_uid) {
		PayVO vo = new PayVO();
		vo = payService.getPayList(pay_merchant_uid);
		vo.setPay_merchant_uid(vo.getPay_merchant_uid());
		// vo.setName(vo.getName());
		vo.setPay_amount(vo.getPay_amount());
		vo.setPay_status("결제취소");
		// vo.setBuyer_email(vo.buyer_email);
		vo.setPay_id(vo.getPay_id());
		// vo.setBuyer_tel(vo.getBuyer_tel());

		String currentMoney = payService.findCurrentMoney(vo.getPay_id());
		if (currentMoney == null) {
			currentMoney = "0";
		}
		vo.setPay_lastmoney(currentMoney);
		String minusMoney = vo.getPay_amount();
		Integer cancelMoney = Integer.parseInt(currentMoney) - Integer.parseInt(minusMoney);
		String convertCancelMoney = Integer.toString(cancelMoney);
		vo.setPay_nowmoney(convertCancelMoney);
		payService.insertPay(vo);
		String pay_id = vo.getPay_id();
		payService.cancelPay(convertCancelMoney, pay_id);
		session.setAttribute("currentMoney", convertCancelMoney);
	}

	@RequestMapping(value = "/charge.ms", method = RequestMethod.POST)
	public String gocharge() {

		return "pay/payfnc";
	}

	@RequestMapping(value = "/drawback.ms", method = RequestMethod.POST)
	public String gocancel() {

		return "pay/cancelfnc";
	}

	@RequestMapping(value = "/goPaylist.ms")
	public String goPaylist(HttpSession session, Model model,
			@RequestParam(value = "page1", required = false, defaultValue = "1") int page1,
			@RequestParam(value = "page2", required = false, defaultValue = "1") int page2,
			@RequestParam(value = "page3", required = false, defaultValue = "1") int page3,
			@RequestParam(value = "tab", required = false, defaultValue = "1") String tab) {
		String userId = (String) session.getAttribute("userId");
		if (userId == null) {
			return "member/login";
		}
		String currentMoney = payService.findCurrentMoney(userId);
		if (currentMoney == null) {
			currentMoney = "0";
		}
		session.setAttribute("currentMoney", currentMoney);
		String paid = "paid";
		String cancel = "결제취소";

		// List<PayVO> chargevo = payService.findChargelist(userId, paid);
		// List<PayVO> cancelvo = payService.findCancellist(userId, cancel);

		// model.addAttribute("chargevo", chargevo);
		// model.addAttribute("cancelvo", cancelvo);

		// 충전 내역 페이지
		int limit = 10;

		int listcount1 = payService.getPaycount(paid, userId);
		int startrow1 = (page1 - 1) * 10 + 1;
		int endrow1 = startrow1 + limit - 1;

		List<PayVO> chargevo = payService.findChargelist(userId, paid, startrow1, endrow1);
		int maxpage1 = (int) ((double) listcount1 / limit + 0.95);
		int startpage1 = (((int) ((double) page1 / 10 + 0.9)) - 1) * 10 + 1;
		int endpage1 = maxpage1;

		if (endpage1 > startpage1 + 10 - 1)
			endpage1 = startpage1 + 10 - 1;

		model.addAttribute("page1", page1);
		model.addAttribute("listcount1", listcount1);
		model.addAttribute("chargevo", chargevo);
		model.addAttribute("maxpage1", maxpage1);
		model.addAttribute("startpage1", startpage1);
		model.addAttribute("endpage1", endpage1);

		// 환불 내역 페이지-----------------------------------------------
		int listcount2 = payService.getPaycount(cancel, userId);
		int startrow2 = (page2 - 1) * 10 + 1;
		int endrow2 = startrow2 + limit - 1;

		List<PayVO> cancelvo = payService.findCancellist(userId, cancel, startrow2, endrow2);
		int maxpage2 = (int) ((double) listcount2 / limit + 0.95);
		int startpage2 = (((int) ((double) page2 / 10 + 0.9)) - 1) * 10 + 1;
		int endpage2 = maxpage2;

		if (endpage2 > startpage2 + 10 - 1)
			endpage2 = startpage2 + 10 - 1;

		model.addAttribute("page2", page2);
		model.addAttribute("listcount2", listcount2);
		model.addAttribute("cancelvo", cancelvo);
		model.addAttribute("maxpage2", maxpage2);
		model.addAttribute("startpage2", startpage2);
		model.addAttribute("endpage2", endpage2);	

		// 거래내역 페이지-------------------------------------------------
		int listcount3 = payService.getPaymentcount(userId);
		int startrow3 = (page3 - 1) * 10 + 1;
		int endrow3 = startrow3 + limit - 1;

		List<PaymentVO> paymentvo = payService.getPaymentlist(userId, startrow3, endrow3);
		int maxpage3 = (int) ((double) listcount3 / limit + 0.95);
		int startpage3 = (((int) ((double) page3 / 10 + 0.9)) - 1) * 10 + 1;
		int endpage3 = maxpage3;

		if (endpage3 > startpage3 + 10 - 1)
			endpage3 = startpage3 + 10 - 1;

		model.addAttribute("page3", page3);
		model.addAttribute("listcount3", listcount3);
		model.addAttribute("paymentvo", paymentvo);
		model.addAttribute("maxpage3", maxpage3);
		model.addAttribute("startpage3", startpage3);
		model.addAttribute("endpage3", endpage3);

		model.addAttribute("tab", tab);
		return "pay/paylist";
	}
	
	@RequestMapping(value = "/plus.ms")
	public String plus(HttpSession session, String userId, int amount, String product_subject) {
		String res = plusMoney(userId, amount, product_subject);
		session.setAttribute("currentMoney", res); //currentMoney = 해당 유저가 보유 중인 사이버머니
		return "pay/paylist";
	}
	
	@RequestMapping(value = "/minus.ms")
	public String minus(HttpSession session, String userId, int amount, String product_subject) {
		String res = minusMoney(userId, amount, product_subject);
		session.setAttribute("currentMoney", res); //currentMoney = 해당 유저가 보유 중인 사이버머니
		return "pay/paylist";
	}
	
	@RequestMapping(value = "outMoney.ms")
	public String outMoney(HttpSession session, @RequestParam(value = "money") String money,
			Model model,
			@RequestParam(value = "page1", required = false, defaultValue = "1") int page1,
			@RequestParam(value = "page2", required = false, defaultValue = "1") int page2,
			@RequestParam(value = "page3", required = false, defaultValue = "1") int page3,
			@RequestParam(value = "tab", required = false, defaultValue = "1") String tab
			) {
		
		String userId = (String) session.getAttribute("userId");
		if (userId == null) {
			return "member/login";
		}
		String currentMoney = payService.findCurrentMoney(userId);
		if (currentMoney == null) {
			currentMoney = "0";
		}
		session.setAttribute("currentMoney", currentMoney);
		String paid = "paid";
		String cancel = "결제취소";

		// List<PayVO> chargevo = payService.findChargelist(userId, paid);
		// List<PayVO> cancelvo = payService.findCancellist(userId, cancel);

		// model.addAttribute("chargevo", chargevo);
		// model.addAttribute("cancelvo", cancelvo);

		// 충전 내역 페이지
		int limit = 10;

		int listcount1 = payService.getPaycount(paid, userId);
		int startrow1 = (page1 - 1) * 10 + 1;
		int endrow1 = startrow1 + limit - 1;

		List<PayVO> chargevo = payService.findChargelist(userId, paid, startrow1, endrow1);
		int maxpage1 = (int) ((double) listcount1 / limit + 0.95);
		int startpage1 = (((int) ((double) page1 / 10 + 0.9)) - 1) * 10 + 1;
		int endpage1 = maxpage1;

		if (endpage1 > startpage1 + 10 - 1)
			endpage1 = startpage1 + 10 - 1;

		model.addAttribute("page1", page1);
		model.addAttribute("listcount1", listcount1);
		model.addAttribute("chargevo", chargevo);
		model.addAttribute("maxpage1", maxpage1);
		model.addAttribute("startpage1", startpage1);
		model.addAttribute("endpage1", endpage1);

		// 환불 내역 페이지-----------------------------------------------
		int listcount2 = payService.getPaycount(cancel, userId);
		int startrow2 = (page2 - 1) * 10 + 1;
		int endrow2 = startrow2 + limit - 1;

		List<PayVO> cancelvo = payService.findCancellist(userId, cancel, startrow2, endrow2);
		int maxpage2 = (int) ((double) listcount2 / limit + 0.95);
		int startpage2 = (((int) ((double) page2 / 10 + 0.9)) - 1) * 10 + 1;
		int endpage2 = maxpage2;

		if (endpage2 > startpage2 + 10 - 1)
			endpage2 = startpage2 + 10 - 1;

		model.addAttribute("page2", page2);
		model.addAttribute("listcount2", listcount2);
		model.addAttribute("cancelvo", cancelvo);
		model.addAttribute("maxpage2", maxpage2);
		model.addAttribute("startpage2", startpage2);
		model.addAttribute("endpage2", endpage2);	

		// 거래내역 페이지-------------------------------------------------
		int listcount3 = payService.getPaymentcount(userId);
		int startrow3 = (page3 - 1) * 10 + 1;
		int endrow3 = startrow3 + limit - 1;

		List<PaymentVO> paymentvo = payService.getPaymentlist(userId, startrow3, endrow3);
		int maxpage3 = (int) ((double) listcount3 / limit + 0.95);
		int startpage3 = (((int) ((double) page3 / 10 + 0.9)) - 1) * 10 + 1;
		int endpage3 = maxpage3;

		if (endpage3 > startpage3 + 10 - 1)
			endpage3 = startpage3 + 10 - 1;

		model.addAttribute("page3", page3);
		model.addAttribute("listcount3", listcount3);
		model.addAttribute("paymentvo", paymentvo);
		model.addAttribute("maxpage3", maxpage3);
		model.addAttribute("startpage3", startpage3);
		model.addAttribute("endpage3", endpage3);

		model.addAttribute("tab", tab);
		
		if(money == "" || money == null || money == "undefined") {
			money = "0";
		}
		if(Integer.parseInt(currentMoney) >= Integer.parseInt(money.trim())) {
		// outMoney = 출금 후 금액, amount = 출금할 금액
		String outMoney = Integer.toString(Integer.parseInt(currentMoney) - Integer.parseInt(money.trim()));
		payService.changeMoney(userId, outMoney);
		session.setAttribute("currentMoney", outMoney);
		
		return "pay/paylist";
		}else {
		return "pay/pay";
		}
	}
	
	// 입금될 경우 쓰는 메소드(userId에 amount만큼 입금, product_subject: 상품 이름)
	public String plusMoney(String userId, int amount, String product_subject) {
		// userId가 존재하는지 체크
		if (userId == null) {
			return "member/login";
		}
		// userId의 결제내역이 존재하는지 체크
		String id = payService.findPayid(userId);
		// 없으면 결제내역 테이블 만들어주기
		if (id == null) {
			payService.insertPaylist(userId);
		}
		// currentMoney = 해당 아이디가 가진 보유 사이버머니
		String currentMoney = payService.findCurrentMoney(userId);
		if (currentMoney == null) {
			currentMoney = "0";
		}
		// result = 결제 후 금액, amount = 결제할 금액
		String result = Integer.toString(Integer.parseInt(currentMoney) + amount);
		if (Integer.parseInt(result) < 0) {
			System.out.println("결제 실패");
		} else {
			// userId가 보유한 사이버머니를 result값으로 바꿈
			payService.changeMoney(userId, result);
			// 거래내역 추가
			PaymentVO vo = new PaymentVO();
			vo.setPayment_userId(userId);
			vo.setPayment_product_subject(product_subject);
			vo.setPayment_amount(Integer.toString(amount));
			vo.setPayment_lastmoney(currentMoney);
			vo.setPayment_nowmoney(result);
			vo.setPayment_status("판매입금");
			payService.insertPayment(vo);
		}
		return result;
	}
	
	// 출금할 경우 쓰는 메소드(userId에 amount만큼 출금)
	public String minusMoney(String userId, int amount, String product_subject) {
		// userId가 존재하는지 체크
		if (userId == null) {
			return "member/login";
		}
		// userId의 결제내역이 존재하는지 체크
		String id = payService.findPayid(userId);
		// 없으면 결제내역 테이블 만들어주기
		if (id == null) {
			payService.insertPaylist(userId);
		}
		// currentMoney = 해당 아이디가 가진 보유 사이버머니
		String currentMoney = payService.findCurrentMoney(userId);
		if (currentMoney == null) {
			currentMoney = "0";
		}
		// result = 결제 후 금액, amount = 결제할 금액
		String result = Integer.toString(Integer.parseInt(currentMoney) - amount);
		if (Integer.parseInt(result) < 0) {
			// 결제 실패 -> 충전페이지로 연결
			return "pay/pay";
		} else {
			// userId가 보유한 사이버머니를 result값으로 바꿈
			payService.changeMoney(userId, result);
			// 거래내역 추가
			PaymentVO vo = new PaymentVO();
			vo.setPayment_userId(userId);
			vo.setPayment_product_subject(product_subject);
			vo.setPayment_amount(Integer.toString(amount));
			vo.setPayment_lastmoney(currentMoney);
			vo.setPayment_nowmoney(result);
			vo.setPayment_status("상품결제");
			payService.insertPayment(vo);
		}
		return result;
	}
}
