package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.detailpage.CommentVO;

public interface CommentMapper {

	List<CommentVO> commentlist(@Param(value="comment_product_number")int comment_product_number,@Param(value="comment_startrow") int comment_startrow,@Param(value="comment_endrow") int comment_endrow);

	int commentinsert(CommentVO commentvo);

	int countcommentList(int comment_product_number);

	int commentdelete(CommentVO commentvo);

	int commentupdate(CommentVO commentvo);

	int commentreply(CommentVO commentvo);

	CommentVO getOriginalInfo(int comment_original_number);

	void makereplylistno(int comment_list_no);

	int commentReport(CommentVO commentvo);

}
