<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.spring.alltion.productList.*" %>
<%@ page import="com.spring.alltion.login.*" %>
<%@ page import="com.spring.alltion.productRegistration.ProductVO" %>
<%
 	List<ProductVO> popularList = (List<ProductVO>)request.getAttribute("popularList");
	List<ProductVO> recentList = (List<ProductVO>)request.getAttribute("recentList");
	List<ProductVO> closeDeadlineList = (List<ProductVO>)request.getAttribute("closeDeadlineList");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/index_main.css?after">
    <link rel="stylesheet" href="./resources/css/main_style.css?after">
    <link href="https://fonts.googleapis.com/css2?
    family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>All-tion</title>
</head>
<body>
    <!-- 모든 페이지 공통 영역 by 하나  -->
    <!-- 광고 배너 및 헤더 -->
    <div class="ad__banner"> 	
        <a href="https://coupa.ng/bEUWFN" target="_blank">
            <img src="https://ads-partners.coupang.com/banners/263827?subId=&traceId=V0-301-969b06e95b87326d-I263827&w=728&h=90" >
        </a>
        <button style="background:url(./resources/img/header/close_btn.png);" class="ad__banner--closeBtn"></button>
    </div>
    <div class="header">
        <jsp:include page="../header/main_header.jsp"></jsp:include>
    </div>
    <!-- 배너 영역 -->
    <div class="banner">
        <div class="banner_slide current">
            <img src="./resources/img/banner/01.jpg">
        </div>
        <div class="banner_slide">
            <img src="./resources/img/banner/02.jpg">
        </div>
        <div class="banner_slide">
            <img src="./resources/img/banner/03.jpg">
        </div>
        <button class="bannerBtn prev">
        	<span class="material-icons">
			arrow_back_ios
			</span>
        </button>
        <button class="bannerBtn next">
        	<span class="material-icons">
			arrow_forward_ios
			</span>
        </button>
    </div>
    <!--  메뉴 카테고리  -->
    
    <div class="menu">
        <div class="menu__tab">
            <input type="radio" name="menu--name" id="popular-items" checked>
            <label for="popular-items">인기 경매</label>
            <input type="radio" name="menu--name" id="recent-items">
            <label for="recent-items">실시간 경매</label>
            <input type="radio" name="menu--name" id="deadline-items">
            <label for="deadline-items">마감 임박</label>
            <!-- 
            <input type="radio" name="menu--name" id="premium-items">
            <label for="premium-items">프리미엄관</label>
             -->
            <!--  인기 경매  -->
            <div class="menu-box content1">
                <ul class="items__list popular">
                <% if(!popularList.isEmpty()){
            		loop : for(int i = 0; i < popularList.size(); i++){%>	       	
		            <%for(int j = i; j < i + 4; j++) {
						if(j == popularList.size()) {
							break loop;
						}
						
						ProductVO popularVo = (ProductVO)popularList.get(j);
		            %> 
                 	 <li>
                    	<a href="/alltion/boarddetail.hs?product_number=<%=popularVo.getProduct_number() %>">
                            <div class="product-box">
                               <img src=<%=popularVo.getProduct_img_1() %>><br>
                            </div>
                            <div class="items__product--info popular">
                                <p class="product_name"><%=popularVo.getProduct_subject() %></p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown"><%=popularVo.getProduct_end_date() %></span>
                                <span class="view_count_text">입찰</span>
                                <span class="view_count"><%=popularVo.getProduct_bids() %> 건</span>
                                <div class="price-txt">
                                    <span class="price_text">현재가</span>
                                    <span class="current_price"><%=popularVo.getProduct_current_price() %> 원</span><br>
                                    <span class="price_text">즉구가</span>
                                    <%if (popularVo.getProduct_purchase_price() == 0) {%>
                                        <span class="direct_price">없음</span><br>
                                    <%}else { %>    
                                        <span class="direct_price"><%=popularVo.getProduct_purchase_price() %> 원</span><br>
                                    <%} %> 
                                </div>
                            </div>
                        </a>
                    </li>
	                <% if(j == i + 3){
	                    i = j;
	                    break;
	                	}
                	}%>
                 <%} 
            	}%>
                </ul>
            </div>
            <!--  실시간 경매  -->
            <div class="menu-box content2">
                <ul class="items__list recent">
                <% if(!recentList.isEmpty()){
            		loop : for(int i = 0; i < recentList.size(); i++){%>	   
			            <%for(int j = i; j < i + 4; j++) {
							if(j == recentList.size()) {
								break loop;
							}
							
							ProductVO recentVo = (ProductVO)recentList.get(j);
			            %>
                 	 <li>
                    	<a href="/alltion/boarddetail.hs?product_number=<%=recentVo.getProduct_number() %>">
                            <div class="product-box">
                               <img src=<%=recentVo.getProduct_img_1() %>><br>
                            </div>
                            <div class="items__product--info recent">
                                <p class="product_name"><%=recentVo.getProduct_subject() %></p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown"><%=recentVo.getProduct_end_date() %></span>
                                <span class="view_count_text">입찰</span>
                                <span class="view_count"><%=recentVo.getProduct_bids() %> 건</span>
                                <div class="price-txt">
									<span class="price_text">현재가</span>
                                    <span class="current_price"><%=recentVo.getProduct_current_price() %> 원</span><br>
                                    <span class="price_text">즉구가</span>
                                    <%if (recentVo.getProduct_purchase_price() == 0) {%>
                                        <span class="direct_price">없음</span><br>
                                    <%}else { %>    
                                        <span class="direct_price"><%=recentVo.getProduct_purchase_price() %> 원</span><br>
                                    <%} %> 
                                </div>
                            </div>
                        </a>
                    </li>
	                <% if(j == i + 3){
		                    i = j;
		                    break;
	                	}
                	}%>
              	<%} 
            	}%>
                </ul>

            </div>
            <!--  마감 임박  -->
            <div class="menu-box content3">
                <ul class="items__list deadline">
                <% if(!closeDeadlineList.isEmpty()){
            		loop : for(int i = 0; i < closeDeadlineList.size(); i++){%>	       	
		            <%for(int j = i; j < i + 4; j++) {
						if(j == closeDeadlineList.size()) {
							break loop;
						}
						
						ProductVO closeDeadlineVo = (ProductVO)closeDeadlineList.get(j);
		            %> 
	            	<li>
                    	<a href="/alltion/boarddetail.hs?product_number=<%=closeDeadlineVo.getProduct_number() %>">
                            <div class="product-box">
                               <img src=<%=closeDeadlineVo.getProduct_img_1() %>><br>
                            </div>
                            <div class="items__product--info deadline">
                                <p class="product_name"><%=closeDeadlineVo.getProduct_subject() %></p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown"><%=closeDeadlineVo.getProduct_end_date() %></span>
                                <span class="view_count_text">입찰</span>
                                <span class="view_count"><%=closeDeadlineVo.getProduct_bids() %> 건</span>
                                <div class="price-txt">
                                    <span class="price_text">현재가</span>
                                    <span class="current_price"><%=closeDeadlineVo.getProduct_current_price() %> 원</span><br>
                                    <span class="price_text">즉시 구매가</span>
                                    <%if (closeDeadlineVo.getProduct_purchase_price() == 0) {%>
                                        <span class="direct_price">없음</span><br>
                                    <%}else { %>    
                                        <span class="direct_price"><%=closeDeadlineVo.getProduct_purchase_price() %> 원</span><br>
                                    <%} %>                 
                            </div>
                        </a>
                    </li>
	                <% if(j == i + 3){
	                    i = j;
	                    break;
	                	}
                	}%>
                <%} 
                }%>
                </ul>
              
            </div>
        </div>
    </div>
    <!-- 푸터 영역 -->
    <div class="footer">
        <div class="upper_footer">
            <ul class="upper_footer--list">
                <li>
                    <a href="#">
                        올션소개
                    </a>
                </li>
                <li>
                    <a href="#">
                        채용정보
                    </a>
                </li>
                <li>
                    <a href="#">
                        공지사항
                    </a>
                </li>
                <li>
                    <a href="#">
                        이용약관
                    </a>
                </li>
                <li>
                    <a href="#">
                        개인정보처리방침
                    </a>
                </li>
                <li>
                    <a href="#">
                        전자금융거래약관
                    </a>
                </li>
                <li>
                    <a href="#">
                        제휴서비스
                    </a>
                </li>
            </ul>
        </div>
        <div class="lower_footer">
            <ul class="lower_footer__content">
                <li>
                    <p>상호명 : (주)올션 / 짜면된다 / 주소: 서울특별시 종로구 삼일대로 서울특별시 서초구 서초4동 강남대로</p>
                    <p>Tel: 02-000-0000 Fax : 02-000-0000 메일 : master@alltion.co.kr</p>
                    <p>사업자등록번호 : ###-##-##### 통신판매업 신고번호 : 제##–###호</p>
                </li>
                <li>
                    <p>올션은 통신판매중개자이며 통신 판매의 당사자가 아닙니다. 따라서 올션은 상품·거래정보 및 거래에 대하여 책임을 지지 않습니다.</p> 
                    <p>Copyright © Alltion All rights reserved.</p>
                </li>
            </ul>
        </div>    
    </div>
    
    <!--  스크립트 영역  -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="./resources/js/index_main.js"></script>
    <script src="./resources/js/banner.js"></script>
</body>
</html>