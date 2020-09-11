package com.spring.alltion.detailpage;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BidController {
	
	@Autowired
	private BidServiceImpl bidService;
	
	@RequestMapping(value="/bid_list.hs",produces="application/json;charset=UTF-8")
	private List<BidVO> bidList(@RequestParam int bno,@RequestParam int page,Model model)throws Exception{
		List<BidVO> bid_list = bidService.bidListService(bno,page,model);
		
		return bid_list;
	}
	
	@RequestMapping(value="/bid_insert.hs",produces="application/json;charset=UTF-8")
	private int mbidInsert(BidVO bidvo)throws Exception{
		int res = bidService.bidInsertService(bidvo);
		
		return res;
	}
	
	@RequestMapping(value="now_purchase.hs",produces="application/json;charset=utf-8")
	private int purchase_now(BidVO bidvo)throws Exception {
		int res = bidService.bidpurchaseService(bidvo);
		
		return res;
	}

}
