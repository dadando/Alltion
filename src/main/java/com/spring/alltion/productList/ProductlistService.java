package com.spring.alltion.productList;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.productRegistration.ProductVO;


public interface ProductlistService {
	public int getListCount();
	public List<ProductVO> getfamousPricelist(String product_category_2);
	public List<ProductVO> getfamousParticipantslist(String product_category_2);
	public List<ProductVO> getfamousViewslist(String product_category_2);
	public List<ProductVO> getfamousPricelist2();
	public List<ProductVO> getfamousParticipantslist2();
	public List<ProductVO> getfamousViewslist2();
	public List<ProductVO> getMainlist(HashMap<String, String> hashmap);
	public int getCategorylistCount(String product_category_2);
	public List<ProductVO> getCategorylist(HashMap<String, String> hashmap);
}	
