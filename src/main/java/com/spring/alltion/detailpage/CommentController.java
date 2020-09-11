package com.spring.alltion.detailpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CommentController {
	
	@Autowired
	private CommentServiceImpl commentService;
	
	@RequestMapping(value="commentlist.hs",produces="application/json;charset=UTF-8")
	public List<CommentVO> commentlist(@RequestParam int comment_product_number,@RequestParam int page,Model model)throws Exception{
		List<CommentVO> comment_list = commentService.commentListService(comment_product_number,page,model);
		
		return comment_list;
	}
	
	@RequestMapping(value="commentinsert.hs",produces="application/json;charset=UTF-8")
	public int commentinsert(CommentVO commentvo)throws Exception{
		int res = commentService.commentInsertService(commentvo);
		
		return res;
	}
	
	@RequestMapping(value="commentdelete.hs",produces="application/json;charset=UTF-8")
	public int commentdelete(CommentVO commentvo)throws Exception{
		int res = commentService.commentDeleteService(commentvo);
		
		return res;
	}
	
	@RequestMapping(value="commentupdate.hs",produces="application/json;charset=UTF-8")
	public int commentupdate(CommentVO commentvo)throws Exception{
		int res = commentService.commentupdateService(commentvo);
		
		return res;
	}
	
	@RequestMapping(value="commentreply.hs",produces="application/json;charset=UTF-8")
	public int commentreply(CommentVO commentvo,@RequestParam int comment_original_number)throws Exception{
		int res = commentService.commentReplyService(commentvo,comment_original_number);
		
		return res;
	}
	
	@RequestMapping(value="commentreport.hs",produces="application/json;charset=UTF-8")
	public int commentreport(CommentVO commentvo)throws Exception{
		int res = commentService.commentReportService(commentvo);
		
		return res;
	}
}
