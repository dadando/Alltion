<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.alltion.productList.*" %>
<%@ page import="com.spring.alltion.productRegistration.ProductVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 <% 

	 List<ProductVO> categorylist=(List<ProductVO>)request.getAttribute("categorylist");
	 List<ProductVO> pricelist=(List<ProductVO>)request.getAttribute("pricelist");
	 List<ProductVO> participantslist=(List<ProductVO>)request.getAttribute("participantslist");
	 List<ProductVO> viewslist=(List<ProductVO>)request.getAttribute("viewslist");
	 
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
	
	String sort = (String)request.getAttribute("sort");
	String category1 = (String) request.getAttribute("category1");
	String category2 = (String) request.getAttribute("category2");
	String product_category_2 = (String)request.getAttribute("product_category_2");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<c:url value="/resources/css/product_list.css?after" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/main_style.css" />">
    <link href="https://fonts.googleapis.com/css2?
    family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>All-tion</title>
</head>
<body>
    <!-- 모든 페이지 공통 영역 by 하나  -->
    
    <div class="header">
        <jsp:include page="../header/main_header.jsp"></jsp:include>
    </div>

    <!-- !! 메인 페이지 내용(지워서 사용함) !! start -->
    <!-- 목록 페이지 -->
    <div class="product_list">
        <!-- 카테고리 영역 -->
        <div class="left_session cate">
            <div class="list_sidebar">
                <li class="mainmenu" id="mainmenu1" style="cursor:pointer">패션</li>
                <ul class="submenu" style="display:none;">
                    <li class="cate0101">
                        <a href="./getCategorylist.ms?product_category_2=cate0101">여성의류</a>
                    </li>
                    <li class="cate0102">
                        <a href="./getCategorylist.ms?product_category_2=cate0102">남성의류</a>
                    </li>
                    <li class="cate0103">
                        <a href="./getCategorylist.ms?product_category_2=cate0103">여성신발</a>
                    </li>
                    <li class="cate0104">
                        <a href="./getCategorylist.ms?product_category_2=cate0104">남성신발</a>
                    </li>
                    <li class="cate0105">
                        <a href="./getCategorylist.ms?product_category_2=cate0105">악세서리</a>
                    </li>
                    <li class="cate0106">
                        <a href="./getCategorylist.ms?product_category_2=cate0106">귀금속</a>
                    </li>
                    <li class="cate0107">
                        <a href="./getCategorylist.ms?product_category_2=cate0107">모자</a>
                    </li>
                    <li class="cate0108">
                        <a href="./getCategorylist.ms?product_category_2=cate0108">기타잡화/관련용품</a>
                    </li>
                    <li class="cate0109">
                        <a href="./getCategorylist.ms?product_category_2=cate0109">수입명품</a>
                    </li>
                </ul>
                <li class="mainmenu" id="mainmenu2" style="cursor:pointer">뷰티</li>
                <ul class="submenu" style="display:none;">
                    <li class="cate0201">
                        <a href="./getCategorylist.ms?product_category_2=cate0201">스킨케어</a>
                    </li>
                    <li class="cate0202">
                        <a href="./getCategorylist.ms?product_category_2=cate0202">메이크업</a>
                    </li>
                    <li class="cate0203">
                        <a href="./getCategorylist.ms?product_category_2=cate0203">헤어/바디</a>
                    </li>
                    <li class="cate0204">
                        <a href="./getCategorylist.ms?product_category_2=cate0204">향수</a>
                    </li>
                    <li class="cate0205">
                        <a href="./getCategorylist.ms?product_category_2=cate0205">네일케어</a>
                    </li>
                    <li class="cate0206">
                        <a href="./getCategorylist.ms?product_category_2=cate0206">남성 화장품</a>
                    </li>
                    <li class="cate0207">
                        <a href="./getCategorylist.ms?product_category_2=cate0207">가발/기타용품</a>
                    </li>
                </ul>
                <li class="mainmenu" id="mainmenu3" style="cursor:pointer">출산/유아동</li>
                <ul class="submenu" style="display:none;">
                    <li class="cate0301">
                        <a href="./getCategorylist.ms?product_category_2=cate0301">출산/육아용품</a>
                    </li>
                    <li class="cate0302">
                        <a href="./getCategorylist.ms?product_category_2=cate0302">유아동안전/실내용품</a>
                    </li>
                    <li class="cate0303">
                        <a href="./getCategorylist.ms?product_category_2=cate0303">유아동의류</a>
                    </li>
                    <li class="cate0304">
                        <a href="./getCategorylist.ms?product_category_2=cate0304">유아동잡화</a>
                    </li>
                    <li class="cate0305">
                        <a href="./getCategorylist.ms?product_category_2=cate0305">유아동가구</a>
                    </li>
                    <li class="cate0306">
                        <a href="./getCategorylist.ms?product_category_2=cate0306">기타 유아동용품</a>
                    </li>
                </ul>
                <li class="mainmenu" id="mainmenu4" style="cursor:pointer">전자기기</li>
                <ul class="submenu" style="display:none;">
                    <li class="cate0401">
                        <a href="./getCategorylist.ms?product_category_2=cate0401">모바일</a>
                    </li>
                    <li class="cate0402">
                        <a href="./getCategorylist.ms?product_category_2=cate0402">태블릿 PC</a>
                    </li>
                    <li class="cate0403">
                        <a href="./getCategorylist.ms?product_category_2=cate0403">노트북</a>
                    </li>
                    <li class="cate0404">
                        <a href="./getCategorylist.ms?product_category_2=cate0404">데스크탑</a>
                    </li>
                    <li class="cate0405">
                        <a href="./getCategorylist.ms?product_category_2=cate0405">카메라</a>
                    </li>
                    <li class="cate0406">
                        <a href="./getCategorylist.ms?product_category_2=cate0406">캠코더</a>
                    </li>
                </ul>
                <li class="mainmenu" id="mainmenu5" style="cursor:pointer">가전제품</li>
                <ul class="submenu" style="display:none;">
                    <li class="cate0501">
                        <a href="./getCategorylist.ms?product_category_2=cate0501">냉장고</a>
                    </li>
                    <li class="cate0502">
                        <a href="./getCategorylist.ms?product_category_2=cate0502">TV</a>
                    </li>
                    <li class="cate0503">
                        <a href="./getCategorylist.ms?product_category_2=cate0503">세탁기/건조기</a>
                    </li>
                    <li class="cate0504">
                        <a href="./getCategorylist.ms?product_category_2=cate0504">주방가전</a>
                    </li>
                    <li class="cate0505">
                        <a href="./getCategorylist.ms?product_category_2=cate0505">스마트홈</a>
                    </li>
                    <li class="cate0506">
                        <a href="./getCategorylist.ms?product_category_2=cate0506">영상가전</a>
                    </li>
                    <li class="cate0507">
                        <a href="./getCategorylist.ms?product_category_2=cate0507">계절가전</a>
                    </li>
                    <li class="cate0508">
                        <a href="./getCategorylist.ms?product_category_2=cate0508">생활가전</a>
                    </li>
                    <li class="cate0509">
                        <a href="./getCategorylist.ms?product_category_2=cate0509">기타 가전제품</a>
                    </li>
                </ul>
                <li class="mainmenu" id="mainmenu6" style="cursor:pointer">가구/인테리어</li>
                <ul class="submenu" style="display:none;">
                    <li class="cate0601">
                        <a href="./getCategorylist.ms?product_category_2=cate0601">침실가구</a>
                    </li>
                    <li class="cate0602">
                        <a href="./getCategorylist.ms?product_category_2=cate0602">거실가구</a>
                    </li>
                    <li class="cate0603">
                        <a href="./getCategorylist.ms?product_category_2=cate0603">주방가구</a>
                    </li>
                    <li class="cate0604">
                        <a href="./getCategorylist.ms?product_category_2=cate0604">수납/선반/공간 박스</a>
                    </li>
                    <li class="cate0605">
                        <a href="./getCategorylist.ms?product_category_2=cate0605">사무용가구</a>
                    </li>
                    <li class="cate0606">
                        <a href="./getCategorylist.ms?product_category_2=cate0606">기타가구</a>
                    </li>
                    <li class="cate0607">
                        <a href="./getCategorylist.ms?product_category_2=cate0607">침구</a>
                    </li>
                    <li class="cate0608">
                        <a href="./getCategorylist.ms?product_category_2=cate0608">커튼/카페트</a>
                    </li>
                    <li class="cate0609">
                        <a href="./getCategorylist.ms?product_category_2=cate0609">인테리어소품</a>
                    </li>
                    <li class="cate0610">
                        <a href="./getCategorylist.ms?product_category_2=cate0610">이벤트/파티용품</a>
                    </li>
                    <li class="cate0611">
                        <a href="./getCategorylist.ms?product_category_2=cate0611">리빙생활</a>
                    </li>
                </ul>
                <li class="mainmenu" id="mainmenu7" style="cursor:pointer">반려동물/취미</li>
                <ul class="submenu" style="display:none;">
                    <li class="cate0701">
                        <a href="./getCategorylist.ms?product_category_2=cate0701">반려동물</a>
                    </li>
                    <li class="cate0702">
                        <a href="./getCategorylist.ms?product_category_2=cate0702">키덜트</a>
                    </li>
                    <li class="cate0703">
                        <a href="./getCategorylist.ms?product_category_2=cate0703">핸드메이드/DIY</a>
                    </li>
                    <li class="cate0704">
                        <a href="./getCategorylist.ms?product_category_2=cate0704">악기</a>
                    </li>
                    <li class="cate0705">
                        <a href="./getCategorylist.ms?product_category_2=cate0705">예술작품/골동품 수집</a>
                    </li>
                    <li class="cate0706">
                        <a href="./getCategorylist.ms?product_category_2=cate0706">미술재료/미술도구</a>
                    </li>
                    <li class="cate0707">
                        <a href="./getCategorylist.ms?product_category_2=cate0707">게임</a>
                    </li>
                </ul>
                <li class="mainmenu" id="mainmenu8" style="cursor:pointer">도서/음반/문구</li>
                <ul class="submenu" style="display:none;">
                    <li class="cate0801">
                        <a href="./getCategorylist.ms?product_category_2=cate0801">유아동도서/음반</a>
                    </li>
                    <li class="cate0802">
                        <a href="./getCategorylist.ms?product_category_2=cate0802">학습/교육</a>
                    </li>
                    <li class="cate0803">
                        <a href="./getCategorylist.ms?product_category_2=cate0803">소설/만화책</a>
                    </li>
                    <li class="cate0804">
                        <a href="./getCategorylist.ms?product_category_2=cate0804">여행/취미/레저</a>
                    </li>
                    <li class="cate0805">
                        <a href="./getCategorylist.ms?product_category_2=cate0805">문화/과학/경영</a>
                    </li>
                    <li class="cate0806">
                        <a href="./getCategorylist.ms?product_category_2=cate0806">예술/디자인</a>
                    </li>
                    <li class="cate0807">
                        <a href="./getCategorylist.ms?product_category_2=cate0807">잡지</a>
                    </li>
                    <li class="cate0808">
                        <a href="./getCategorylist.ms?product_category_2=cate0808">기타 도서</a>
                    </li>
                    <li class="cate0809">
                        <a href="./getCategorylist.ms?product_category_2=cate0809">음반/DVD/굿즈</a>
                    </li>
                    <li class="cate0810">
                        <a href="./getCategorylist.ms?product_category_2=cate0810">문구/사무용품</a>
                    </li>
                </ul>
                <li class="mainmenu" id="mainmenu9" style="cursor:pointer">티켓/쿠폰</li>
                <ul class="submenu" style="display:none;">
                    <li class="cate0901">
                        <a href="./getCategorylist.ms?product_category_2=cate0901">티켓</a>
                    </li>
                    <li class="cate0902">
                        <a href="./getCategorylist.ms?product_category_2=cate0902">상품권/쿠폰</a>
                    </li>
                    <li class="cate0903">
                        <a href="./getCategorylist.ms?product_category_2=cate0903">여행숙박/이용권</a>
                    </li>
                    <li class="cate0904">
                        <a href="./getCategorylist.ms?product_category_2=cate0904">기타 티켓/쿠폰/이용권</a>
                    </li>
                </ul>
                <li class="mainmenu" id="mainmenu10" style="cursor:pointer">스포츠</li>
                <ul class="submenu" style="display:none;">
                    <li class="cate1001">
                        <a href="./getCategorylist.ms?product_category_2=cate1001">골프</a>
                    </li>
                    <li class="cate1002">
                        <a href="./getCategorylist.ms?product_category_2=cate1002">자전거</a>
                    </li>
                    <li class="cate1003">
                        <a href="./getCategorylist.ms?product_category_2=cate1003">인라인/스케이트/전동</a>
                    </li>
                    <li class="cate1004">
                        <a href="./getCategorylist.ms?product_category_2=cate1004">축구</a>
                    </li>
                    <li class="cate1005">
                        <a href="./getCategorylist.ms?product_category_2=cate1005">야구</a>
                    </li>
                    <li class="cate1006">
                        <a href="./getCategorylist.ms?product_category_2=cate1006">농구</a>
                    </li>
                    <li class="cate1007">
                        <a href="./getCategorylist.ms?product_category_2=cate1007">라켓스포츠</a>
                    </li>
                    <li class="cate1008">
                        <a href="./getCategorylist.ms?product_category_2=cate1008">헬스/요가</a>
                    </li>
                    <li class="cate1009">
                        <a href="./getCategorylist.ms?product_category_2=cate1009">수상스포츠</a>
                    </li>
                    <li class="cate1010">
                        <a href="./getCategorylist.ms?product_category_2=cate1010">검도/격투/권투</a>
                    </li>
                    <li class="cate1011">
                        <a href="./getCategorylist.ms?product_category_2=cate1011">기타 스포츠</a>
                    </li>
                    <li class="cate1012">
                        <a href="./getCategorylist.ms?product_category_2=cate1012">레저/여행</a>
                    </li>
                </ul>
                <li class="mainmenu" id="mainmenu11" style="cursor:pointer">공구/산업용품</li>
                <ul class="submenu" style="display:none;">
                    <li class="cate1101">
                        <a href="./getCategorylist.ms?product_category_2=cate1101">드릴/전동공구</a>
                    </li>
                    <li class="cate1102">
                        <a href="./getCategorylist.ms?product_category_2=cate1102">에어/유압</a>
                    </li>
                    <li class="cate1103">
                        <a href="./getCategorylist.ms?product_category_2=cate1103">작업공구</a>
                    </li>
                    <li class="cate1104">
                        <a href="./getCategorylist.ms?product_category_2=cate1104">측정공구</a>
                    </li>
                    <li class="cate1105">
                        <a href="./getCategorylist.ms?product_category_2=cate1105">초경/절삭/접착윤활</a>
                    </li>
                    <li class="cate1106">
                        <a href="./getCategorylist.ms?product_category_2=cate1106">전기/전자</a>
                    </li>
                    <li class="cate1107">
                        <a href="./getCategorylist.ms?product_category_2=cate1107">배관설비/포장운송</a>
                    </li>
                    <li class="cate1108">
                        <a href="./getCategorylist.ms?product_category_2=cate1108">금형공작</a>
                    </li>
                    <li class="cate1109">
                        <a href="./getCategorylist.ms?product_category_2=cate1109">용접기자재</a>
                    </li>
                    <li class="cate1110">
                        <a href="./getCategorylist.ms?product_category_2=cate1110">산업/안전/공구함</a>
                    </li>
                    <li class="cate1111">
                        <a href="./getCategorylist.ms?product_category_2=cate1111">산업자재</a>
                    </li>
                    <li class="cate1112">
                        <a href="./getCategorylist.ms?product_category_2=cate1112">농기계/농업용공구</a>
                    </li>
                </ul>
                <li class="mainmenu" id="mainmenu12" style="cursor:pointer">기타잡화</li>
                <ul class="submenu" style="display:none;">
                    <li class="cate1201">
                        <a href="./getCategorylist.ms?product_category_2=cate1201">기타잡화</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 상품 목록 영역 -->
        <div class="right_session slideshow-container">
            <!-- 인기 경매 영역 -->
            <div class="hot_item">
                <h4>인기 경매</h4>
                <div class="slide1 fade" id="1">
                 <% if(!pricelist.isEmpty()) { %>
                    <ul class="items__list list">
						<% for(int i=0; i<3;i++) { 
							if(i == pricelist.size()) {break;}
		                    	ProductVO vo = (ProductVO)pricelist.get(i);	%>
                        <li> 
                            <a href="/alltion/boarddetail.hs?product_number=<%=vo.getProduct_number() %>">
                                <div class="product-box">
                                   <img src="<%=vo.getProduct_img_1() %>"><br>
                                </div>
                                <div class="items__product--info list">
                                    <p class="product_name"><%=vo.getProduct_subject() %></p>
                                    <span class="material-icons timer">timer</span>
                                    <span class="countdown" data-endTime="<%=vo.getProduct_end_date() %>" data-complete="<%=vo.getProduct_progress() %>"><%=vo.getProduct_issue_date() %> 00:00</span>
                                    <span class="view_count_text">입찰</span>
	                                <span class="view_count"><%=vo.getProduct_bids() %> 건</span>
	                                <div class="price-txt">
	                                    <span class="price_text">현재가</span>
	                                    <span class="current_price"><%=vo.getProduct_current_price() %> 원</span><br>
	                                    <span class="price_text">즉구가</span>
	                                    <%if (vo.getProduct_purchase_price() == 0) {%>
                                            <span class="direct_price">없음</span><br>
                                        <%}else { %>    
                                            <span class="direct_price"><%=vo.getProduct_purchase_price() %> 원</span><br>
                                        <%} %>
	                                </div>
                                </div>
                            </a>
                        </li>


                     <%} %>
                    </ul>
                <%} %>
                </div>
                <div class="slide1 fade" id="2">
                    <% if(!participantslist.isEmpty()) { %>
                    <ul class="items__list list">
						<%	for(int i=0; i<3;i++) { 
							if(i == participantslist.size()) {break;}
		                    	ProductVO vo = (ProductVO)participantslist.get(i);	%>
                        <li>
                        <a href="/alltion/boarddetail.hs?product_number=<%=vo.getProduct_number() %>">
                            <div class="product-box">
                               <img src="<%=vo.getProduct_img_1() %>"><br>
                            </div>
                            <div class="items__product--info list">
                                <p class="product_name"><%=vo.getProduct_subject() %></p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown" data-endTime="<%=vo.getProduct_end_date() %>" data-complete="<%=vo.getProduct_progress() %>"><%=vo.getProduct_issue_date() %> 00:00</span>
                                <span class="view_count_text">입찰</span>
                                <span class="view_count"><%=vo.getProduct_bids() %> 건</span>
                                <div class="price-txt">
                                    <span class="price_text">현재가</span>
	                                <span class="current_price"><%=vo.getProduct_current_price() %> 원</span><br>
	                                <span class="price_text">즉구가</span>
	                                <%if (vo.getProduct_purchase_price() == 0) {%>
                                        <span class="direct_price">없음</span><br>
                                    <%}else { %>    
                                        <span class="direct_price"><%=vo.getProduct_purchase_price() %> 원</span><br>
                                    <%} %>
                                </div>
                            </div>
                        </a>
                    	</li>

                    	<%} %>
                    </ul>
                <%} %>  
                </div>
                <div class="slide1 fade" id="3">
                    <% if(!viewslist.isEmpty()) { %>
                    <ul class="items__list list">
						<%	for(int i=0; i<3;i++) { 
							if(i == viewslist.size()) {break;}
		                    	ProductVO vo = (ProductVO)viewslist.get(i);	%>
                        <li>
                        <a href="/alltion/boarddetail.hs?product_number=<%=vo.getProduct_number() %>">
                            <div class="product-box">
                               <img src="<%=vo.getProduct_img_1() %>"><br>
                            </div>
                            <div class="items__product--info list">
                                <p class="product_name"><%=vo.getProduct_subject() %></p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown" data-endTime="<%=vo.getProduct_end_date() %>" data-complete="<%=vo.getProduct_progress() %>"><%=vo.getProduct_issue_date() %> 00:00</span>
                                <span class="view_count_text">입찰</span>
                                <span class="view_count"><%=vo.getProduct_bids() %> 건</span>
                                <div class="price-txt">
                                    <span class="price_text">현재가</span>
	                                <span class="current_price"><%=vo.getProduct_current_price() %> 원</span><br>
	                                <span class="price_text">즉구가</span>
	                                <%if (vo.getProduct_purchase_price() == 0) {%>
                                        <span class="direct_price">없음</span><br>
                                    <%}else { %>    
                                        <span class="direct_price"><%=vo.getProduct_purchase_price() %> 원</span><br>
                                    <%} %>
                                </div>
                            </div>
                        </a>
                    	</li>
                      <%} %>
                    </ul>
                    <%} %>
                </div>
                <% if(!categorylist.isEmpty()){%>
                <div style="text-align:center">
                    <% if(!pricelist.isEmpty()) { %>
                    <span class="dot"></span>
                    <%} %>
                    <% if(!participantslist.isEmpty()) { %>
                    <span class="dot"></span>
                    <%} %>
                    <% if(!viewslist.isEmpty()) { %>
                    <span class="dot"></span>
                    <%} %>
                </div>
                <%}%>
            </div>
            <!-- 경매 목록 -->
            <div class="product_li">
                <div class="product_li-category">
                
                </div>
                <form name="form">
                <select class="sort_list" name = "sort_list" onChange="getSelectValue(this.form)">
                    <option value="./getCategorylist.ms?product_category_2=<%=product_category_2 %>&sort=1" <%=sort.equals("1") ? "selected" : "" %>>최신 순</option>
                    <option value="./getCategorylist.ms?product_category_2=<%=product_category_2 %>&sort=2" <%=sort.equals("2") ? "selected" : "" %>>조회수 높은 순</option>
                    <option value="./getCategorylist.ms?product_category_2=<%=product_category_2 %>&sort=3" <%=sort.equals("3") ? "selected" : "" %>>낮은 가격 순</option>
                    <option value="./getCategorylist.ms?product_category_2=<%=product_category_2 %>&sort=4" <%=sort.equals("4") ? "selected" : "" %>>높은 가격 순</option>
                </select>
                </form>
				<%
				if(!categorylist.isEmpty()){
				loop : for(int i=0; i<categorylist.size();i++){ 
				%>
                <ul class="items__list product">
                <%
            	for(int j=i; j<i+3;j++){
            		if(j == categorylist.size()) {break loop;}
                    		ProductVO vo = (ProductVO)categorylist.get(j);
            	%>
                    <li>
                        <a href="/alltion/boarddetail.hs?product_number=<%=vo.getProduct_number() %>">
                            <div class="product-box">
                               <img src="<%=vo.getProduct_img_1() %>"><br>
                            </div>
                            <div class="items__product--info product">
                                <p class="product_name"><%=vo.getProduct_subject() %></p>
                                <span class="material-icons timer">timer</span>
                                <span class="countdown" data-endTime="<%=vo.getProduct_end_date() %>" data-complete="<%=vo.getProduct_progress() %>"><%=vo.getProduct_issue_date() %> 00:00</span>
                                <span class="view_count_text">입찰</span>
                                <span class="view_count"><%=vo.getProduct_bids() %> 건</span>
                                <div class="price-txt">
                                	<span class="price_text">현재가</span>
	                                <span class="current_price"><%=vo.getProduct_current_price() %> 원</span><br>
	                                <span class="price_text">즉구가</span>
	                                <%if (vo.getProduct_purchase_price() == 0) {%>
                                        <span class="direct_price">없음</span><br>
                                    <%}else { %>    
                                        <span class="direct_price"><%=vo.getProduct_purchase_price() %> 원</span><br>
                                    <%} %>
                                </div>
                            </div>
                        </a>
                    </li>
                    <%if(j==i+2){
                    i=j;
                    break;}
                    }%>
                </ul>
                <%}
				} %>
			</div>
			<div class="paging">
			<ul class="page_number">
					<li>
                    <%if(nowpage<=1){ %>
                    <!-- &#60; -->
                    <%}else{ %>
                        <a href="./getCategorylist.ms?product_category_2=<%=product_category_2 %>&page=<%=nowpage-1 %>&sort=<%=sort%>">&#60;</a>
                    </li>
                    <%} %>
                    
                    <%for(int a=startpage;a<=endpage;a++){
						if(a==nowpage){%>
						<li>
						<a href="" class="active num"><%=a %></a>
						</li>
						<%}else{ %>
						<li>
						<a href="./getCategorylist.ms?product_category_2=<%=product_category_2 %>&page=<%=a %>&sort=<%=sort%>" class="num"><%=a %></a>
						</li>
						<%} %>
					<%} %>
					<li>
                    <%if(nowpage>=maxpage){ %>
                    <!-- &#62; -->
                    <%}else{ %>
                        <a href="./getCategorylist.ms?product_category_2=<%=product_category_2 %>&page=<%=nowpage+1 %>&sort=<%=sort%>">&#62;</a>
                    </li>
                    <%} %>
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
    <script src="<c:url value="https://code.jquery.com/jquery-3.5.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/product_detail.js" />"></script>
    
    <!-- 리스트쪽 카테고리 1차 > 카테고리 2차 부분 js -->
    <script>
	var category1 = '<%=category1 %>';
	var category2 = '<%=category2 %>';
	
	$(document).ready(function () {
		$(".product_li-category").html("<h4>"+ category1 +"</h4> <span>&#62;</span> " + category2);
	})
	</script>
	<script>
    //남은시간 카운팅
		var _second = 1000; // 1초
		var _minute = _second * 60; // 1분
		var _hour = _minute * 60; // 1시간
		var _day = _hour * 24; // 1일
        
		$(document).ready(function auctionConutDown() {
			$('.countdown').each(function(idx, element){
				// 상품의 마감여부
				var complete = element.getAttribute("data-complete");
				
				if (complete == 0) {
					// 현재시간을 얻어온다
					var now = new Date();
					// ".countdown" 클래스의 "data"속성의 값을 가져온다
					var endTime = new Date(element.getAttribute("data-endTime"));
					// 마감시간에서 현재시간을 차감해준다
					var subtractTime = endTime - now;
					// 남은시간이 들어갈 변수
					var resultTime = "";
				
					// 남은시간이 마이너스라면 실행
					if(subtractTime < 0) {
						$(element).html("종료되었습니다");
					
						// 컴플리트를 0으로 바꾸는 함수 실행해야됨
						return;
					}
				
				// 소수점버림(남은시간 / 1일)
				// 예) 1일 1시간 1분 / 1일 = 1일 1시간 1분
				// 소수점을 버리기에 "1일"이 된다
				var days = Math.floor(subtractTime / _day);
				if (days > 0) {
					resultTime += days + "일 "
				}
				
				// 소수점버림(남은시간 % 1일 / 1시간)
				// 예) 1일 1시간 1분 % 1일 = 1시간 1분
				// 1시간 1분 / 1시간 = 1시간 1분 
				// 소수점을 버리기에 "1시간"이 된다
				var hours = Math.floor((subtractTime % _day) / _hour);
				if (hours > 0) {
					resultTime += hours + "시간 "
				}
				var minutes = Math.floor((subtractTime % _hour) / _minute);
				if (minutes > 0) {
					resultTime += minutes + "분 "
				}
				$(element).html(resultTime);
			}else{
				$(element).html("종료되었습니다");
			}
			})
		})
	</script>
	<script>
	function getSelectValue(frm) {
		/*if(frm.sort_list.options.selectedIndex != 0) {*/
			location.href = frm.sort_list.options[frm.sort_list.selectedIndex].value;
		/*}*/
	}
	</script>=
</body>
</html>
