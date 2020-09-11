package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.alltion.productRegistration.ProductVO;

public interface ProductListMapper {
	public int getCategorylistCount(String product_category_2);
	public List<ProductVO> getfamousPricelist(String product_category_2);
	public List<ProductVO> getfamousParticipantslist(String product_category_2);
	public List<ProductVO> getfamousViewslist(String product_category_2);
	public List<ProductVO> getfamousPricelist2();
	public List<ProductVO> getfamousParticipantslist2();
	public List<ProductVO> getfamousViewslist2();
	public int getListCount();
	public List<ProductVO> getMainlist1(HashMap<String, String> hashmap);
	public List<ProductVO> getMainlist2(HashMap<String, String> hashmap);
	public List<ProductVO> getMainlist3(HashMap<String, String> hashmap);
	public List<ProductVO> getMainlist4(HashMap<String, String> hashmap);
	public List<ProductVO> getCategorylist1(HashMap<String, String> hashmap);
	public List<ProductVO> getCategorylist2(HashMap<String, String> hashmap);
	public List<ProductVO> getCategorylist3(HashMap<String, String> hashmap);
	public List<ProductVO> getCategorylist4(HashMap<String, String> hashmap);
}
