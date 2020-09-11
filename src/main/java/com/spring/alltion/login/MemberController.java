package com.spring.alltion.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import com.spring.alltion.creditScore.PurchaseCreditScoreVO;
import com.spring.alltion.creditScore.SaleCreditScoreVO;

import com.spring.alltion.main.MainController;
import com.spring.alltion.pay.PayService;




@Controller
public class MemberController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO)
	{
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MainController mainController;
	
	@Autowired
	private PayService payService;
	
	// 탭 메뉴에 목록 페이지 끌고 오기	
	@RequestMapping(value = "/")
	public String main(Model model)
	{
		mainController.getPopularList(model);
		mainController.getRecentList(model);
		mainController.getCloseDeadlineList(model);
		
		return "main/index";
	}
	
	@RequestMapping("/main.kj")
	public String mainPage()
	{
		return "main/index";
	}

	@RequestMapping(value = "/loginForm.kj")
	public String loginPage()
	{
		return "member/login";
	}
	
	@RequestMapping("/login.kj")
	public String userCheck(MemberVO membervo, HttpSession session,
			HttpServletResponse response,HttpServletRequest request) throws Exception
	{
		
		int res = memberService.userCheck(membervo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (res == 1)
		{
			session.setAttribute("userId",membervo.getMember_id());

			String userId = membervo.getMember_id();
			// currentMoney = 로그인한 사람이 보유한 사이버머니
			String currentMoney = payService.findCurrentMoney(userId);
			if (currentMoney == null) {
				currentMoney = "0";
			}
			session.setAttribute("currentMoney", currentMoney);

			return "redirect:/";
		}else if(res ==3) {
			String userId = membervo.getMember_id();
			session.setAttribute("userId", userId);
			
			return "redirect:/adminHome.yb";
		}
		else 	
		{
				
			writer.write("<script>alert('해당 아이디와 비밀번호를 확인해 주세요!!');location.href='./loginForm.kj';</script>");
			
		}
		return null;
	}

	//로그아웃
	@RequestMapping(value = "/logout.kj", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
	session.invalidate();
	return "redirect:/";
	}
	
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/naverjoin.kj", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버 : " + naverAuthUrl);
		//네이버
		model.addAttribute("url", naverAuthUrl);
		
		return "member/join";
	}
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback.kj", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
		throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		//response의 nickname값 파싱
		String email = (String) response_obj.get("email");
		System.out.println(email);
		//4.파싱 닉네임 세션으로 저장
		session.setAttribute("email", email); // 세션 생성
		model.addAttribute("result", apiResult);
		
		return "member/joinForm";
	}
	
	@RequestMapping(value = "/joinForm.kj")
	public String joinFormPage()
	{
		return "member/joinForm";
	}
    @RequestMapping("/joinprocess.kj") 
    public String insertMember(MemberVO membervo, PurchaseCreditScoreVO PurchaseCreditScorevo, SaleCreditScoreVO SaleCreditScorevo, 
				HttpServletRequest request,HttpServletResponse response) 
			throws Exception { 
			//파라미터에는 form 양식의 name에 따라 값이 저장된다.\
			int res = memberService.insertMember(membervo);
			
			String purchase_id = request.getParameter("member_id");
			String sale_id = request.getParameter("member_id");
			int purchase = memberService.insertpurchase(PurchaseCreditScorevo,purchase_id);
			int sale = memberService.insertsale(SaleCreditScorevo,sale_id);
			String pay_id = request.getParameter("member_id");
			String findPay_id = payService.findPayid(pay_id);
			if (findPay_id == null) {
				payService.insertPaylist(pay_id);
			}
			String currentMoney = payService.findCurrentMoney(pay_id);
			if (currentMoney == null) {
				currentMoney = "0";
				payService.changeMoney(pay_id, currentMoney);
			}
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			if (res != 0)
			{
				if(purchase != 0)
				{
					if(sale != 0)
					{
							writer.write("<script>alert('회원가입 성공!!');"
							+ "location.href='./loginForm.kj';</script>");
					}
					else
					{
				writer.write("<script>alert('회원가입 실패!!');"
						+ "location.href='./joinForm.kj';</script>");
					}
				}
			}
			return null;
		}

	@RequestMapping(value="/user_check.kj", produces= "application/json; charset=utf-8")
	private @ResponseBody int idCheck(String member_id)throws Exception
	{
		int res = memberService.idCheckService(member_id);
		return res;
	}

	//상세페이지에서 로그인한뒤 상세페이지로 되돌아오는것.
	
	@RequestMapping(value = "/loginForm1.kj")
	public String login2Page(@RequestParam(value="product_number")int product_number,Model model)throws Exception
	{
		model.addAttribute("product_number",product_number);
		return "detail_page/login2";
	}
	
	@RequestMapping("/login1.kj")
	public String user2Check(MemberVO membervo, HttpSession session,
			HttpServletResponse response,@RequestParam(value="product_number")String product_number) throws Exception
	{
		
        int res = memberService.userCheck(membervo);
			
        response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (res == 1)
		{
            session.setAttribute("userId",membervo.getMember_id());
            String userId = membervo.getMember_id();
            // currentMoney = 로그인한 사람이 보유한 사이버머니
            String currentMoney = payService.findCurrentMoney(userId);
            if (currentMoney == null) {
                currentMoney = "0";
            }
            session.setAttribute("currentMoney", currentMoney);
            return "redirect:/boarddetail.hs?product_number="+product_number;
		}
		else 	
		{
            writer.write("<script>alert('해당 아이디와 비밀번호를 확인해 주세요!!');location.href='./loginForm1.kj?product_number="+product_number+"';</script>");
		}
		return null;
	}

}
