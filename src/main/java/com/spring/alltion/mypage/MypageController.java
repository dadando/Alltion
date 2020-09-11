package com.spring.alltion.mypage;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.alltion.login.MemberService;
import com.spring.alltion.login.MemberVO;

@Controller
public class MypageController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/mypage.kj")
	public String myPage(MemberVO membervo, HttpSession session)throws Exception
	{
		String userId = (String)session.getAttribute("userId");
		if(userId == null)
		{
		return "member/login";
		}
		else
		
		return "mypage/mypage";
	}
	@RequestMapping(value = "/memberinfo.kj")
	public String updateForm(Model model,HttpSession session)throws Exception
	{	
		String userId = (String)session.getAttribute("userId");
		if(userId ==null)
		{
			return "member/login";
		}else 
		{
		MemberVO vo = memberService.selectMember(userId);
		model.addAttribute("membervo",vo);
		
		return "mypage/update";
		}
	}
	//회원 수정 이메일
	@RequestMapping(value = "/updateEmail.kj")
	public String updateEmail(MemberVO membervo, HttpServletResponse response,HttpSession session)
	throws Exception 
	{
		String userId = (String)session.getAttribute("userId");
		membervo.setMember_id(userId);
		int res = memberService.updateEmail(membervo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (res != 0)
		{
			writer.write("<script>alert('이메일 변경완료!!');"
					+ "location.href='./memberinfo.kj';</script>");
		}
		else
		{
			writer.write("<script>alert('이메일 변경실패!!');"
					+ "location.href='./memberinfo.kj';</script>");
		}
		return null;		
	}
	//회원 수정 비밀번호		
	@RequestMapping(value = "/updatePassword.kj", method = { RequestMethod.GET, RequestMethod.POST })
	public String updatePassword(MemberVO membervo, HttpServletResponse response,HttpSession session)
	throws Exception 
	{
		String userId = (String)session.getAttribute("userId");
		membervo.setMember_id(userId);
		int res = memberService.updatePassword(membervo);		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (res != 0)
		{			
			writer.write("<script>alert('비밀번호 변경 완료!!');"
			+ "location.href='./loginForm.kj';</script>");
			//비밀번호 변경시 로그아웃
			session.invalidate();
		}
		else
		{
			writer.write("<script>alert('비밀번호 변경 실패!!');"
					+ "location.href='./memberinfo.kj';</script>");
		}
		return null;	
	}	
	@RequestMapping(value = "/updatePhone.kj")
	public String updatePhone(MemberVO membervo, HttpServletResponse response,HttpSession session)
	throws Exception 
	{
		String userId = (String)session.getAttribute("userId");
		membervo.setMember_id(userId);
		int res = memberService.updatePhone(membervo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (res != 0)
		{
			writer.write("<script>alert('휴대전화 변경완료!!');"
					+ "location.href='./memberinfo.kj';</script>");
		}
		else
		{
			writer.write("<script>alert('휴대전화 변경실패!!');"
					+ "location.href='./memberinfo.kj';</script>");
		}
		return null;
		
	}
	
	@RequestMapping(value = "/updateAddress.kj")
	public String updateAddress(MemberVO membervo, HttpServletResponse response,HttpSession session)
	throws Exception 
	{
		String userId = (String)session.getAttribute("userId");
		membervo.setMember_id(userId);
		int res = memberService.updateAddress(membervo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (res != 0)
		{
			writer.write("<script>alert('주소 변경완료!!');"
					+ "location.href='./memberinfo.kj';</script>");
		}
		else
		{
			writer.write("<script>alert('주소 변경실패!!');"
					+ "location.href='./memberinfo.kj';</script>");
		}
		return null;		
	}	
	@RequestMapping(value = "/delete.kj",  method = { RequestMethod.GET, RequestMethod.POST })
	public String member_delete(MemberVO membervo, HttpServletResponse response,HttpSession session)
	throws Exception 
	{
		String userId = (String)session.getAttribute("userId");
		membervo.setMember_id(userId);
		int res = memberService.member_delete(membervo);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (res != 0)
		{
			writer.write("<script>alert('회원이 삭제 되었습니다!!');"
			+ "location.href='./main.kj';</script>");
			session.invalidate();
		}
		else
		{
			writer.write("<script>alert('회원 삭제가 실패햐였습니다!!');"
					+ "location.href='./memberinfo.kj';</script>");
		}
		return null;
		
	}
		
}
