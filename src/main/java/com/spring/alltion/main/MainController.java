package com.spring.alltion.main;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.alltion.productRegistration.ProductVO;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;
	
	@RequestMapping(value = "/getPopularList.hn", method = RequestMethod.GET)
	public void getPopularList(Model model) {
		List<ProductVO> popularList = mainService.getPopularList();
		
		model.addAttribute("popularList", popularList);
	}
	
	@RequestMapping(value = "/getRecentList.hn", method = RequestMethod.GET)
	public void getRecentList(Model model) {
		List<ProductVO> recentList = mainService.getRecentList(); 
		
		model.addAttribute("recentList", recentList);
	}
	
	@RequestMapping(value = "/getCloseDeadlineList.hn", method = RequestMethod.GET)
	public void getCloseDeadlineList(Model model) {	
		List<ProductVO> closeDeadlineList = mainService.getCloseDeadlineList(); 
		
		model.addAttribute("closeDeadlineList", closeDeadlineList);
	}
}