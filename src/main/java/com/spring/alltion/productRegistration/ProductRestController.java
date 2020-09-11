package com.spring.alltion.productRegistration;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@RestController
public class ProductRestController {
	
	@Autowired
	private ProductServiceImpl productServiceImpl;
	
	// 상품(경매) 등록
	@RequestMapping(value = "productInsert.yb", produces="application/json;charset=UTF-8")
	public void productInsert(ProductVO productVO) {
		productServiceImpl.ProductInsert(productVO);
	}
	
	// 에디터 이미지 업로드
	@RequestMapping(value = "editorImgUpload.yb", produces="application/json;charset=UTF-8")
	public void editorImgUpload(MultipartFile file, HttpServletResponse response, 
			HttpSession session) {
		productServiceImpl.editorImgUpload(file, response, session);
	}
	
	// 썸네일 이미지 업로드
	@RequestMapping(value = "thumbnailsUpload.yb", produces="application/json;charset=UTF-8")
	public List<String> thumbnailsUpload(MultipartHttpServletRequest mtfRequest, 
			HttpSession session) {
		List<String> imgSrcList = new ArrayList<String>(); // 이미지 경로를 담을 배열
		
		imgSrcList = productServiceImpl.thumbnailsUpload(mtfRequest, session);
		
		return imgSrcList;
	}
}