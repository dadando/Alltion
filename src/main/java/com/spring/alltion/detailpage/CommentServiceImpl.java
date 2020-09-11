package com.spring.alltion.detailpage;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.mapper.CommentMapper;

@Service
public class CommentServiceImpl {

	@Autowired
	private SqlSession sqlSession;
	
	// 댓글 리스트 불러오기
	// 댓글 리스트 페이징 처리하기
	public List<CommentVO> commentListService(int comment_product_number, int page, Model model) {
		CommentMapper commentmapper = sqlSession.getMapper(CommentMapper.class);
		
		int comment_page = 1; // 댓글리스트 첫페이지 = 1;
		int comment_limit = 10;
		if(page!=0) {
			comment_page = page;
		}
		int comment_listcount = 0;
		comment_listcount = getCount_comment(comment_product_number) - 1;
		int comment_endrow = comment_listcount - (page-1)*10;
		int comment_startrow = comment_endrow - comment_limit + 1;
		
		int comment_maxpage = (int)((double)comment_listcount/comment_limit + 0.9);
		int comment_startpage = (((int)((double)comment_page / 10 + 0.9))-1) * 10 + 1;
		int comment_endpage = comment_maxpage;
		if(comment_endpage > comment_startpage+10-1) {
			comment_endpage = comment_startpage + 10 - 1;
		}
		
		model.addAttribute("comment_page",comment_page);
		model.addAttribute("comment_maxpage",comment_maxpage);
		model.addAttribute("comment_startpage",comment_startpage);
		model.addAttribute("comment_endpage",comment_endpage);
		model.addAttribute("comment_listcount",comment_listcount);
		
		return commentmapper.commentlist(comment_product_number,comment_startrow,comment_endrow);
	}
	
	// 댓글 입력하기.
	public int commentInsertService(CommentVO commentvo) {
		CommentMapper commentmapper = sqlSession.getMapper(CommentMapper.class);
		int comment_product_number = commentvo.getComment_product_number();
		int count = commentmapper.countcommentList(comment_product_number);
		
		commentvo.setComment_list_no(count);
		
		return commentmapper.commentinsert(commentvo);
	}
	
	// 댓글 갯수 구하기
	public int getCount_comment(int product_number) {
		CommentMapper commentmapper = sqlSession.getMapper(CommentMapper.class);
		int count = commentmapper.countcommentList(product_number);
		
		return count;
	}

	// 댓글 삭제하기
	public int commentDeleteService(CommentVO commentvo) {
		CommentMapper commentmapper = sqlSession.getMapper(CommentMapper.class);
		
		return commentmapper.commentdelete(commentvo);
	}

	// 댓글 수정하기
	public int commentupdateService(CommentVO commentvo) {
		CommentMapper commentmapper = sqlSession.getMapper(CommentMapper.class);
		
		return commentmapper.commentupdate(commentvo);
	}

	// 댓글 답변하기
	public int commentReplyService(CommentVO commentvo,int comment_original_number) {
		CommentMapper commentmapper = sqlSession.getMapper(CommentMapper.class);
		// 댓글(원글)의 정보를 얻기
		CommentVO originalvo = commentmapper.getOriginalInfo(comment_original_number);
		// 답글이 들어갈 자리만들기.
		commentmapper.makereplylistno(originalvo.getComment_list_no());
		// 만들어둔 자리에 답글 넣기.
		commentvo.setComment_list_no(originalvo.getComment_list_no());
		// 그룹 번호 지정해주기
		commentvo.setComment_group_number(originalvo.getComment_group_number());
		// 원글 정보 (아이디) 넣기
		commentvo.setComment_original_id(originalvo.getComment_id());
		// 원글 정보 (비밀글) 넣기
		commentvo.setComment_secret(originalvo.getComment_secret());
		
		return commentmapper.commentreply(commentvo);
	}

	public int commentReportService(CommentVO commentvo) {
		CommentMapper commentmapper = sqlSession.getMapper(CommentMapper.class);
		int res = commentmapper.commentReport(commentvo);
		return res;
	}

}
