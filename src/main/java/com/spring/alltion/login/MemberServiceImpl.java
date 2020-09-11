package com.spring.alltion.login;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alltion.creditScore.PurchaseCreditScoreVO;
import com.spring.alltion.creditScore.SaleCreditScoreVO;
import com.spring.mapper.MemberMapper;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertMember(MemberVO membervo) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);		
		//if문은 네이버 아이디 연동시 이메일
		//getEmail에 값이 있다
		if(membervo.getEmail() != null) {
			int res = memberMapper.insertMember(membervo);
			return res;
		}
		//일반 회원가입
		else{
		String email = "";
		email = membervo.getEmail1() + "@" + membervo.getEmail2();
		membervo.setEmail(email);
		}
		int res = memberMapper.insertMember(membervo);
		return res;
	}

	@Override
	public int userCheck(MemberVO membervo) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int res = memberMapper.userCheck(membervo);
		if(res==1) {
			String userId = membervo.getMember_id();
			int result = check_manager(userId);
			if(result == 1) {
				//result가 1이면 관리자.
				res = 3;
			}
		}
		//res = 0 : 회원 x , res = 1: 일반회원 , res = 3: 관리자
		return res;
	}

	@Override
	public ArrayList<MemberVO> getMemberlist() {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		ArrayList<MemberVO> list = memberMapper.getMemberlist();
		return list;
	}

	@Override
	public MemberVO selectMember(String userId) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);		
		MemberVO vo = memberMapper.selectMember(userId);
		//회원 가입시 주소를 기입 하지 않아
		//회원 정보에 null값이 떠서 null 이면 공백으로 보이게함
		if(vo.getSample4_postcode() == null) {
			vo.setSample4_postcode("");
			vo.setSample4_roadAddress("");
			vo.setSample4_jibunAddress("");
			vo.setSample4_detailAddress("");
		}
		return vo;
	}


	@Override
	public int updateEmail(MemberVO membervo) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);	
		
		return memberMapper.updateEmail(membervo);
	}

	@Override
	public int idCheckService(String member_id) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.idCheckService(member_id);
	}

	@Override
	public int updatePassword(MemberVO membervo) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		
		return memberMapper.updatePassword(membervo);
	}

	@Override
	public int updatePhone(MemberVO membervo) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		
		return memberMapper.updatePhone(membervo);
	}

	@Override
	public int updateAddress(MemberVO membervo) {
		
		
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		
		return memberMapper.updateAddress(membervo);
	}

	@Override
	public int member_delete(MemberVO membervo) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		
		return memberMapper.member_delete(membervo);
	}

	@Override
	public int insertpurchase(PurchaseCreditScoreVO PurchaseCreditScorevo, String purchase_id) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int purchase = memberMapper.insertpurchase(PurchaseCreditScorevo,purchase_id);
		return purchase;
	}

	@Override
	public int insertsale(SaleCreditScoreVO SaleCreditScorevo ,String sale_id) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int sale = memberMapper.insertsale(SaleCreditScorevo,sale_id);
		return sale;
	}
	
	// 관리자 인지 일반회원인지 체크. by.Hong
	public int check_manager(String userId) {
		MemberMapper membermapper = sqlSession.getMapper(MemberMapper.class);
		int res = membermapper.getMember_manager(userId);
		// res가 0이면 일반회원 res가 1이면 관리자.
		return res;
	}
}
