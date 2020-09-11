package com.spring.alltion.productList;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.alltion.productRegistration.ProductVO;
import com.spring.mapper.ProductListMapper;

@Service
public class ProductlistServiceImpl implements ProductlistService {

	@Autowired(required=false)
	private SqlSession sqlSession;
	
	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		int res = productListMapper.getListCount();
		return res;
	}

	@Override
	public List<ProductVO> getfamousPricelist(String product_category_2) {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		List<ProductVO> productlist = productListMapper.getfamousPricelist(product_category_2);
		return productlist;
	}
	@Override
	public List<ProductVO> getfamousParticipantslist(String product_category_2) {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		List<ProductVO> productlist = productListMapper.getfamousParticipantslist(product_category_2);
		return productlist;
	}
	@Override
	public List<ProductVO> getfamousViewslist(String product_category_2) {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		List<ProductVO> productlist = productListMapper.getfamousViewslist(product_category_2);
		return productlist;
	}
	@Override
	public List<ProductVO> getfamousPricelist2() {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		List<ProductVO> productlist = productListMapper.getfamousPricelist2();
		return productlist;
	}
	@Override
	public List<ProductVO> getfamousParticipantslist2() {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		List<ProductVO> productlist = productListMapper.getfamousParticipantslist2();
		return productlist;
	}
	@Override
	public List<ProductVO> getfamousViewslist2() {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		List<ProductVO> productlist = productListMapper.getfamousViewslist2();
		return productlist;
	}
	@Override
	public List<ProductVO> getMainlist(HashMap<String, String> hashmap) {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		//entrySet을 이용하여 앞서 받아온 key값과 value 값을 둘 다 가져올 예정
		Set set = hashmap.entrySet();
        Iterator iterator = set.iterator();
        List<ProductVO> productlist = null;
        String key = null;
        String value = null;
        // hashmap에 있는 데이터만큼 반복
        while(iterator.hasNext()){
            Entry<String,String> entry = (Entry)iterator.next();
            // 키값 확인
            key = (String)entry.getKey();
            // value값 확인
            value = (String)entry.getValue();
            // 키가 sort인 value값에 따라 mapping
            if(key.equals("sort") && value.equals("1")) {
            	// 최신 순 
            	productlist = productListMapper.getMainlist1(hashmap);
            }else if(key.equals("sort") && value.equals("2")) {
            	// 조회수 높은 순
            	productlist = productListMapper.getMainlist2(hashmap);
            }else if(key.equals("sort") && value.equals("3")) {
            	// 낮은 가격 순
            	productlist = productListMapper.getMainlist3(hashmap);
            }else if(key.equals("sort") && value.equals("4")) {
            	// 높은 가격 순
            	productlist = productListMapper.getMainlist4(hashmap);
            }else {
            	//System.out.println("key값이 sort가 아닌 경우");
            }
        }
		return productlist;
	}
	
	@Override
	public int getCategorylistCount(String product_category_2) {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		int res = productListMapper.getCategorylistCount(product_category_2);
		return res;
	}

	@Override
	public List<ProductVO> getCategorylist(HashMap<String, String> hashmap) {
		// TODO Auto-generated method stub
		ProductListMapper productListMapper = sqlSession.getMapper(ProductListMapper.class);
		//entrySet을 이용하여 앞서 받아온 hashmap의 key값과 value값을 둘 다 가져올 예정
		Set set = hashmap.entrySet();
        Iterator iterator = set.iterator();
        List<ProductVO> productlist = null;
        String key = null;
        String value = null;
     // hashmap에 있는 데이터만큼 반복
        while(iterator.hasNext()){
            Entry<String,String> entry = (Entry)iterator.next();
            // 키값 확인
            key = (String)entry.getKey();
            // value값 확인
            value = (String)entry.getValue();
            // 키가 sort인 value값에 따라 mapping
            if(key.equals("sort") && value.equals("1")) {
            	// 최신 순
            	productlist = productListMapper.getCategorylist1(hashmap);
            }else if(key.equals("sort") && value.equals("2")) {
            	// 조회수 높은 순
            	productlist = productListMapper.getCategorylist2(hashmap);
            }else if(key.equals("sort") && value.equals("3")) {
            	// 낮은 가격 순
            	productlist = productListMapper.getCategorylist3(hashmap);
            }else if(key.equals("sort") && value.equals("4")) {
            	// 높은 가격 순
            	productlist = productListMapper.getCategorylist4(hashmap);
            }else {
            	//System.out.println("key값이 sort가 아닌 경우");
            }
        }
		return productlist;
	}
}
