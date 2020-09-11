package com.spring.alltion.productRegistration;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.alltion.creditScore.SaleCreditScoreVO;
import com.spring.mapper.CreditScoreMapper;
import com.spring.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private SqlSession sqlSession;
	
	// 상품객체 추가
	@Override
	public void ProductInsert(ProductVO productVO) {
		ProductMapper productMapper; // 마이바티스 상품맵퍼
		CreditScoreMapper creditScoreMapper; // 마이바티스 신용도맵퍼
		
		String saleId; // 판매자아이디
		int saleCreditScore; // 판매자 신용도
		SaleCreditScoreVO saleCreditScoreVO; // 판매신용도 객체
		
		try {
			productMapper = sqlSession.getMapper(ProductMapper.class);
			creditScoreMapper = sqlSession.getMapper(CreditScoreMapper.class);
			
			// 경매종료일을 sql문의 to_date에 맞는 형식으로 변환한다
			productVO.transformEndDate();
			
			// 직거래가 없으면 "none"으로 변환한다
			productVO.changeTransactionAreaToNone();
			
			// 판매자의 신용정보에서 신용점수를 가져와 set 해준다
			saleId = productVO.getProduct_id();
			saleCreditScoreVO = creditScoreMapper.getSaleCreditScore(saleId);
			saleCreditScore = saleCreditScoreVO.getSale_credit_score();
			productVO.setProduct_credit_score(saleCreditScore);
			
			// 상품데이터를 insert한다
			productMapper.productInsert(productVO);
		} catch(Exception e) {
			System.out.println("ProductInsert 에러");
			e.printStackTrace();
		}
	}
	
	// 에디터 이미지 업로드
	@Override
	public void editorImgUpload(MultipartFile file, 
			HttpServletResponse response, HttpSession session) {
		String realFolder; // 이미지가 저장될 실제 경로
		UUID uuid; // 실제 저장될 파일명에 들어갈 랜덤값
		String originalFilename; // 원본 이미지 파일명
		String userId; // 로그인한 아이디
		String savedFilename; // 이미지가 저장될 실제 파일명
		
		long size; // 파일용량
		String extension; // 확장자
		Image image; // 이미지가 할당될 객체
		int imageWidth; // 이미지 가로폭
		
		String filepath;// 원본 이미지 경로 + 파일명
		File f; // 저장경로와 함께 파일을 담을 객체 생성
		
		PrintWriter out = null; // 출력
		
		try {
			// 출력값 셋팅
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			out = response.getWriter();
			
			// 업로드할 폴더 경로
			// Servers 폴더의 server.xml <host>태그 안에 아래 문구 삽입(하단쪽)
			// <Context docBase="C:\AlltionUpload"  path="alltion/AlltionUpload" reloadable="true"/>
			// 실제 폴더도 직접 생성해주자
			realFolder = "C:\\AlltionUpload";
			uuid = UUID.randomUUID();

			// 업로드할 파일 이름
			originalFilename = file.getOriginalFilename();
			userId = (String) session.getAttribute("userId");
			savedFilename = uuid + "_" + userId + "_" + originalFilename;
			
			// 파일용량 유효성 검사, 3MB가 넘으면 리턴
			size = file.getSize();
			if (size > 30145728) {
				out.println(1);
				out.close();
				return;
			}
			
			// 확장자 유효성 검사, jpg가 아니면 리턴
			extension = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
			if(!(extension.equals("jpg"))) {
				out.println(0);
				out.close();
				return;
			}

			// 이미지 가로폭 할당
			image = ImageIO.read(file.getInputStream());
			imageWidth = image.getWidth(null);
			
			
			// 원본 이미지 경로 + 파일명
			filepath = realFolder + "\\" + savedFilename;
			
			// 파일 저장
			f = new File(filepath);
			if (!f.exists()) {
				f.mkdirs();
			}
			file.transferTo(f);
			
			// 이미지 가로폭 유효성 검사
			if (imageWidth > 1000) {
				savedFilename = imageResize(filepath, image, savedFilename);
			}
			
			// 에디터에 이미지 경로 출력
			out.println("/alltion/AlltionUpload/" + savedFilename);
			
		} catch (Exception e) {
			System.out.println("editorImgUpload 에러");
			e.printStackTrace();
		} finally {
			out.close();
		}
	}
	
	// 썸네일 이미지 업로드
	@Override
	public List<String> thumbnailsUpload(MultipartHttpServletRequest mtfRequest,
			HttpSession session) {
		List<MultipartFile> fileList; // 이미지들을 받을 리스트
		
		String realFolder; // 이미지가 저장될 실제 경로
		UUID uuid; // 실제 저장될 파일명에 들어갈 랜덤값
		String originalFilename; // 원본 이미지 파일명
		String userId; // 로그인한 아이디
		String savedFilename; // 이미지가 저장될 실제 파일명
		
		String filepath;// 원본 이미지 경로 + 파일명
		File f; // 저장경로와 함께 파일을 담을 객체 생성
		
		List<String> imgSrcList = new ArrayList<String>(); // 이미지 경로를 담을 배열
		String imgSrc; // 이미지 경로
		
		try {
			// 등록된 이미지가 없으면 리턴
			if (mtfRequest.getContentLength() <= 44) {
				return null;
			}
			
			// 이미지가 저장될 실제 경로
			realFolder = "C:\\AlltionUpload";

			// 로그인한 아이디
			userId = (String) session.getAttribute("userId");
			
			// 이미지 파일의 갯수만큼 반복
			fileList = mtfRequest.getFiles("file");
			for (MultipartFile file : fileList) {
				// 실제 파일이 저장될 파일이름
				uuid = UUID.randomUUID();
				originalFilename = file.getOriginalFilename();
				savedFilename = uuid + "_" + userId + "_" + originalFilename;
				
				// 실제 파일이 저장될 경로 + 파일이름
				filepath = realFolder + "\\" + savedFilename;
				
				// 파일 저장
				f = new File(filepath);
				if (!f.exists()) {
					f.mkdirs();
				}
				file.transferTo(f);
				
				// 이미지 경로 배열에 추가
				imgSrc = "/alltion/AlltionUpload/" + savedFilename;
				imgSrcList.add(imgSrc);
	        }
		} catch (Exception e) {
			System.out.println("thumbnailsUpload 에러");
			e.printStackTrace();
		}
		
		// 이미지 경로 리스트 반환
		return imgSrcList;
	}
	
	// 이미지 리사이즈
	@Override
	public String imageResize(String filepath, Image image, String savedFilename) throws Exception {
		// resize 경로  + 파일명
        String resizeSavedFilename = 
        		new StringBuffer(filepath).insert(filepath.lastIndexOf("."), "_resize").toString();
        int width = 1000; // 넓이 기준
        
        int imageWidth; // 원본 이미지 가로
        int imageHeight; // 원본 이미지 세로
        double ratio; // 이미지 축소 비율
        int newWidth; // resize 된 가로
        int newHeight; // resize 된 세로
        
        String newSavedFilename = null; // 새로운 resize 파알명
        
        // 원본 이미지 사이즈 가져오기
        imageWidth = image.getWidth(null);
        imageHeight = image.getHeight(null);
        
        // 넓이 기준 비율로 이미지 사이즈 조절
        ratio = (double)width/(double)imageWidth;
        newWidth = (int)(imageWidth * ratio);
        newHeight = (int)(imageHeight * ratio);
 
        // 이미지 리사이즈
        // Image.SCALE_DEFAULT : 기본 이미지 스케일링 알고리즘 사용
        // Image.SCALE_FAST    : 이미지 부드러움보다 속도 우선
        // Image.SCALE_REPLICATE : ReplicateScaleFilter 클래스로 구체화 된 이미지 크기 조절 알고리즘
        // Image.SCALE_SMOOTH  : 속도보다 이미지 부드러움을 우선
        // Image.SCALE_AREA_AVERAGING  : 평균 알고리즘 사용
        Image resizeImage = image.getScaledInstance(newWidth, newHeight, Image.SCALE_SMOOTH);
 
        // 새 이미지  저장하기
        BufferedImage newImage = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);
        Graphics g = newImage.getGraphics();
        g.drawImage(resizeImage, 0, 0, null);
        g.dispose();
        ImageIO.write(newImage, "jpg", new File(resizeSavedFilename));
        
        // 새로운 resize 파알명
        newSavedFilename = new StringBuffer(savedFilename)
        		.insert(savedFilename.lastIndexOf("."), "_resize").toString();
        
        // 리사이즈된 새로운 파일명 반환
		return newSavedFilename;
    }
}
