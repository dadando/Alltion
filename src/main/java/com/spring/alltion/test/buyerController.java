package com.spring.alltion.test;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.alltion.creditScore.CreditScoreService;
import com.spring.alltion.creditScore.PurchaseCreditScoreVO;
import com.spring.alltion.creditScore.SaleCreditScoreVO;
import com.spring.alltion.detailpage.ReviewVO;
import com.spring.alltion.login.MemberService;
import com.spring.alltion.login.MemberVO;
import com.spring.alltion.pay.PayService;
import com.spring.alltion.pay.PaymentVO;
@Controller
public class buyerController {

   @Autowired
   private MemberService memberService;
   @Autowired
   private testService testservice;
   @Autowired
   private CreditScoreService creditScoreService;
   @Autowired
   private PayService payService;
   
   //구매 페이지 리스트
   @RequestMapping(value = "/buyer.kj")
   public String getProductlist(Model model, HttpSession session,HttpServletRequest request)
   throws Exception
   {
      String userId = (String)session.getAttribute("userId");
      //model.addAttribute("product_page",Integer.parseInt(request.getParameter("product_page")));
         
      if(userId == null)
      {
         return "member/login";
      }
      else
      {
      List<Product_kjVO> product_list = testservice.getProductlist(userId);
      model.addAttribute("product_list", product_list);
      
      List<Product_kjVO> delivery_before_list = testservice.getdelivery_before(userId);
      model.addAttribute("delivery_before_list", delivery_before_list);
      
      List<Product_kjVO> delivery_list = testservice.getdeliveryList(userId);
      model.addAttribute("delivery_list", delivery_list);
      
      List<Product_kjVO> dealcomplete_list = testservice.getdealcomplete_buyer(userId);
      model.addAttribute("dealcomplete_list", dealcomplete_list);
      return  "mypage/buyer";
      }
   }
   //구매 페이지 구매중인 경매 ajax
   @RequestMapping(value = "product_page.bo", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
   @ResponseBody
   public List<Product_kjVO> product_list_page(int page, HttpSession session) {
      List<Product_kjVO> product_list = testservice.getProductlist((String)session.getAttribute("userId"));
      return product_list;
   }
   //구매 페이지 운송장 번호 받기전 배송대기 경매 ajax
   @RequestMapping(value = "before_page.bo", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
   @ResponseBody
   public List<Product_kjVO> delivery_before_page(int page, HttpSession session){
      List<Product_kjVO> delivery_before_list = testservice.getdelivery_before((String)session.getAttribute("userId"));
      return delivery_before_list;
   }
   //판매 페이지 판매 대기경매 ajax
   @RequestMapping(value = "wait_sell.bo", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
   @ResponseBody
   public List<Product_kjVO> wait_sell_page(int page, HttpSession session)
   {
      List<Product_kjVO> getdeposit_before_list = testservice.getdeposit_before((String)session.getAttribute("userId"));
      return getdeposit_before_list;
   }
   //판매중인 경매 ajax
   @RequestMapping(value = "sell.bo", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
   @ResponseBody
   public List<Product_kjVO> sell_page(int page, HttpSession session)
   {
      List<Product_kjVO> sell_list = testservice.getSalelist((String)session.getAttribute("userId"));
      return sell_list;
   }
   //구매 페이지 운송장 번호 확인 ajax
   @RequestMapping(value = "delivery_complete.bo", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
   @ResponseBody
   public List<Product_kjVO> complete_page(int page, HttpSession session)
   {
      List<Product_kjVO> complete_list = testservice.getdeliveryList((String)session.getAttribute("userId"));
      return complete_list;
   }
   //구매 페이지 최종 구매확인 ajax
   @RequestMapping(value = "complete_buyer.bo", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
   @ResponseBody
   public List<Product_kjVO> complete_buyer(int page, HttpSession session)
   {
      List<Product_kjVO> delivery_complete_list = testservice.getdealcomplete_buyer((String)session.getAttribute("userId"));
      return delivery_complete_list;
   }
   //판매 페이지 최종 판매확인 ajax
   @RequestMapping(value = "sale_complete.bo", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
   @ResponseBody
   public List<Product_kjVO> sale_complete_page(int page, HttpSession session)
   {
      List<Product_kjVO> sale_complete_list = testservice.getdealcomplete_seller((String)session.getAttribute("userId"));
      return sale_complete_list;
   }
   
   
   //판매 페이지 리스트
   @RequestMapping(value = "/seller.kj")
   public String getSeller(Model model, HttpSession session)
   throws Exception
   {
      String userId = (String)session.getAttribute("userId");
      if(userId == null)
      {
         return "member/login";
      }
      else
      {
      List<Product_kjVO> getdeposit_before_list = testservice.getdeposit_before(userId);
      model.addAttribute("getdeposit_before_list", getdeposit_before_list);
      
      List<Product_kjVO> getSale_list = testservice.getSalelist(userId);
      model.addAttribute("getSale_list", getSale_list);
      
      List<Product_kjVO> dealcompleteseller_list = testservice.getdealcomplete_seller(userId);
      model.addAttribute("dealcompleteseller_list", dealcompleteseller_list);
      return  "mypage/seller";
      }
   }
   
   
   
   @RequestMapping(value = "/waybill.kj")
   public String waybillpage(Model model, HttpSession session, HttpServletRequest request)
         throws Exception
         {
            String userId = (String)session.getAttribute("userId");
            int product_number = Integer.parseInt(request.getParameter("product_number"));
            if(userId == null)
            {
               return "member/login";
            }
            else
            {
               Product_kjVO  Product_kjvo = testservice.Waybill(userId, product_number);
               model.addAttribute("Product_kjvo", Product_kjvo);
            return "mypage/waybill";
            }
      
   }
   
   //판매 페이지 운송장 번호 입력 
   @RequestMapping(value = "/insert_waybill.kj")
   public String insertwaybill(Product_kjVO Product_kjvo , HttpServletResponse response,  HttpSession session) 
         throws Exception
   {
      String userId = (String)session.getAttribute("userId");
      response.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      PrintWriter writer = response.getWriter();
      int res = testservice.updateWaybill(Product_kjvo);
      if(userId == null)
      {
         return "member/login";
      }
      else
      {
      if(res != 0)
      {
         
         writer.write("<script>alert('운송장 번호 입력 완료되었습니다');"
         + "location.href='/alltion/seller.kj';</script>");
      }
       else 
      {
         writer.write("<script>alert('운송장 번호 입력이 실패하였습니다!!');location.href='./waybill.kj';</script>");
      }
      return null;
      }
   }
   //구매 페이지 운송장 번호 확인후 최종 구매 
   @RequestMapping(value = "/delivery.kj")
   public String deliverycomplete(Product_kjVO Product_kjvo , HttpServletResponse response,  HttpSession session,HttpServletRequest request,
		   PurchaseCreditScoreVO purchasevo, SaleCreditScoreVO salevo,@RequestParam(value="product_id")String product_id,@RequestParam(value="product_number")int product_number)
   throws Exception
   {
      String userId = (String)session.getAttribute("userId");
      purchasevo.setPurchase_id(userId);
      System.out.println("Product_kjvo.getProduct_id : " + product_id);
      
      String sale_id = Product_kjvo.getProduct_id();
      salevo.setSale_id(sale_id);    
      response.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      PrintWriter writer = response.getWriter();
  
      int res = testservice.deliverycomplete(Product_kjvo,product_number); // 거래중 -> 거래완료
      int sale = creditScoreService.saleNormalCount(salevo);
      int purchase = creditScoreService.purchaseNormalCount(purchasevo);
      if(userId == null)
      {
         return "member/login";
      }
      else
      {
      if(res != 0)
      {
         List<Product_kjVO> delivery_list = testservice.getdealcomplete_buyer(userId);
         String id = delivery_list.get(0).getProduct_id();
         int amount = delivery_list.get(0).getTrading_price();
         String subject = delivery_list.get(0).getProduct_subject();
         String result = plusMoney(id, amount, subject);
         if(sale != 0) {
        	 if(purchase != 0) {
         writer.write("<script>alert('구매가 완료되었습니다');"
         + "location.href='/alltion/buyer.kj';</script>");
        	 					}
       else 
       		{
         writer.write("<script>alert('구매가  실패하였습니다!!');location.href='./waybill.kj';</script>");
       		}
         }
      }
      return null;
      }
   }
   //구매 페이지 거래 방식 선택
   @RequestMapping(value = "/trading_transaction.kj")
    public String trading_transaction(Product_kjVO  Product_kjvo, HttpSession session ,HttpServletResponse response,HttpServletRequest request)throws Exception
    {
       String userId = (String)session.getAttribute("userId");
       String trading_transaction_method = request.getParameter("trading_transaction_method");   
       int product_number = Integer.parseInt(request.getParameter("product_number"));
       int res = testservice.updatetrading_transaction_method(Product_kjvo,trading_transaction_method, product_number);
       System.out.println("trading_transaction_method" + trading_transaction_method);
       System.out.println("res" + res);
       response.setCharacterEncoding("utf-8");
       response.setContentType("text/html; charset=utf-8");
       PrintWriter writer = response.getWriter();
       if(userId == null)
       {
       return "member/login";
       }
       else
          {   
       if(res != 0)
       {
          writer.write("<script>alert('거래방식 선택');"
                + "location.href='./buyer.kj';</script>");
       }
       else
       {
          writer.write("<script>alert('거래방식 선택실패!!');"
                + "location.href='./buyer.kj';</script>");
       }
       }
       
       return null;
    }
   //구매 페이지 자신의 이머니 정보를 불러옴
   @RequestMapping(value = "/buyer_emoney.kj")
   public String emoney(Model model,HttpSession session,HttpServletRequest request)
   throws Exception
   {
      String userId = (String)session.getAttribute("userId");
      int product_number = Integer.parseInt(request.getParameter("product_number"));
      if(userId == null)
      {
         return "member/login";
      }
      else
      {
         Test_emoneyVO emoneyvo = testservice.selectEmoney(userId);
         model.addAttribute("emoneyvo", emoneyvo); 
         
         Product_kjVO  Product_kjvo = testservice.selectProduct(userId,product_number);
         
         String product_subject = testservice.findSubjectFromNum(product_number);
         Product_kjvo.setProduct_subject(product_subject);
         model.addAttribute("Product_kjvo", Product_kjvo);
         
         MemberVO membervo = memberService.selectMember(userId);
         model.addAttribute("membervo", membervo);
         
         String pmvo = payService.findCurrentMoney(userId);
          if (pmvo == null) {
             pmvo = "0";
            }
         model.addAttribute("pmvo", pmvo);
          return "mypage/buyer_emoney";
      }
   }   
   //구매 페이지 이머니를 통한 구매 결재
   @RequestMapping(value = "/buyer_deal.kj")
   public String deal(Product_kjVO  Product_kjvo, Model model, HttpSession session, HttpServletResponse response ,HttpServletRequest request)throws Exception
   {
      
      response.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      PrintWriter writer = response.getWriter();
      int address = testservice.update_trading_address(Product_kjvo);
      String userId = (String)session.getAttribute("userId");
      int trading_product_number = Integer.parseInt(request.getParameter("trading_product_number"));
      String trading_buyer_id = (String)request.getParameter("trading_buyer_id");
      Test_emoneyVO emoneyvo = testservice.selectEmoney(userId);
      int currentMoney = Integer.parseInt(payService.findCurrentMoney(userId));
      //int res_emoney = testservice.update_emoney(userId);
      if(userId == null)
      {
         return "member/login";
      }
      else 
      {
         if(currentMoney >= Product_kjvo.getTrading_price())
         {
            int res = testservice.after_deposit(Product_kjvo,trading_product_number,trading_buyer_id);
            if(res != 0)
            {   
            	if(address != 0) {
               String result = minusMoney(userId, Product_kjvo.getTrading_price(), Product_kjvo.getProduct_subject());
               session.setAttribute("currentMoney", result);
               writer.write("<script>alert('결제가 완료되었습니다');"
               + "location.href='/alltion/buyer.kj?product_page=1';</script>");
            	}
            }
         }
         else
         {
            writer.write("<script>alert('이머니가 부족합니다 충전해주세요!!');location.href='./buyer.kj';</script>");
            
         }
            
      }            
         return null;
      }
   	  //구매 페이지 구매자의 주소 변경
      @RequestMapping(value = "/buyer_deal_update.kj") 
      public String address_update(MemberVO membervo, HttpSession session ,HttpServletResponse response)throws Exception
      {
         
         String userId = (String)session.getAttribute("userId");
         membervo.setMember_id(userId);
         int  res = testservice.update_deal_address(membervo);
         if(userId == null)
         {
         return "member/login";
         }
         else
         {         
         response.setCharacterEncoding("utf-8");
         response.setContentType("text/html; charset=utf-8");
         PrintWriter writer = response.getWriter();
         if(res != 0)
         {
            writer.write("<script>alert('주소가 변경되었습니다');"
                  + "location.href='./buyer.kj';</script>");
         }
         else
         {
            writer.write("<script>alert('주소 변경실패!!');"
                  + "location.href='./buyer_emoney.kj';</script>");
         }
         return null;
      }
      
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
      //구매 페이지 리뷰 작성
      @RequestMapping("/review.kj")
      public String insertReview(ReviewVO Reviewvo, HttpServletResponse response,HttpSession session,HttpServletRequest request,@RequestParam(value="trading_product_number")int trading_product_number)
      throws Exception{
         
         int res = testservice.insertReview(Reviewvo,trading_product_number);
         response.setCharacterEncoding("utf-8");
         response.setContentType("text/html; charset=utf-8");
         PrintWriter writer = response.getWriter();
         if (res != 0)
         {
        	 
             writer.write("<script>alert('리뷰 작성!!');"
                  + "location.href='./buyer.kj';</script>");
        	 
         }
         else
         {
            writer.write("<script>alert('리뷰작성 실패!!');"
                  + "location.href='./buyer.kj';</script>");
         }
         
         return null;
      }


}