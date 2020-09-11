package com.spring.alltion.login;

import java.util.ArrayList;

import com.spring.alltion.creditScore.PurchaseCreditScoreVO;
import com.spring.alltion.creditScore.SaleCreditScoreVO;

public interface MemberService {

		public int insertMember(MemberVO membervo);
		public int userCheck(MemberVO membervo);
		public ArrayList<MemberVO> getMemberlist();
		public MemberVO selectMember(String userId);
		int idCheckService(String member_id);
		public int updateEmail(MemberVO membervo);
		public int updatePassword(MemberVO membervo);
		public int updatePhone(MemberVO membervo);
		public int updateAddress(MemberVO membervo);
		public int member_delete(MemberVO membervo);
		public int insertpurchase(PurchaseCreditScoreVO PurchaseCreditScorevo, String purchase_id);
		public int insertsale(SaleCreditScoreVO SaleCreditScorevo,String sale_id);
		//public int AdminCheck(MemberVO membervo);
}
