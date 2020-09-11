package com.spring.alltion.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.alltion.detailpage.ReviewVO;
import com.spring.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl {
	
	@Autowired
	private SqlSession sqlSession;

	public void getReview_view(String userId, Model model, HttpServletRequest request) {
		ReviewMapper reviewmapper = sqlSession.getMapper(ReviewMapper.class);
		List<ReviewVO> reviewlist = reviewmapper.getReviewList(userId);
		model.addAttribute("reviewlist",reviewlist);
		
	}
}
