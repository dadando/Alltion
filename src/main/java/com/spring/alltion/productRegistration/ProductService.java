package com.spring.alltion.productRegistration;

import java.awt.Image;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ProductService {
	// 상품객체 추가
	public void ProductInsert(ProductVO productVO);
	
	// 에디터 이미지 업로드
	public void editorImgUpload(MultipartFile file, HttpServletResponse response, 
			HttpSession session);
	
	// 썸네일 이미지 업로드
	public List<String> thumbnailsUpload(MultipartHttpServletRequest mtfRequest, 
			HttpSession session);
	
	// 이미지 리사이즈
	public String imageResize(String filepath, Image image, 
			String savedFilename) throws Exception;
}
