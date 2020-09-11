<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.alltion.productRegistration.*" %>
<%@ page import = "java.util.*" %>  
<%
	List<ProductVO> productvolist = (List<ProductVO>)request.getAttribute("productvolist");
	List<String> top_bidder_idlist = (List<String>)request.getAttribute("top_bidder_idlist");
	int nowpage = (int)request.getAttribute("page");
	int maxpage = (int)((double)productvolist.size()/5.0 + 0.99);
	int productvolist_size = productvolist.size();
%>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/main_style.css">
    <link rel="stylesheet" href="./resources/css/bidding.css">
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
    <!-- 등급 페이지 by 하나 -->
    <!-- 메인 내용 -->
    <div class="main_body">
        <div class="bidding_title">
            <h1>판매 중 경매</h1>
        </div>
        <div class="bidding_notify">
            <ul>
                <li>
                    회원님께서 현재 판매 중인 물품의 리스트입니다.
                <li>
                <li>
                    이미 판매 등록된 경매에 대해서는 판매 취소를 하실 수 없습니다. 문의 사항은 고객센터에 문의해주시기 바랍니다.
                </li>
                <li>
                    해당 물품이 낙찰이 되거나 경매시간이 종료될 경우 해당 물품의 정보는 확인하실 수 없습니다.
                </li>
            </ul>
        </div>
        <div class="table_title">
            <p>현재 <font style="color:cornflowerblue;border-bottom: 1px solid #FFA30E;">판매중인 경매</font>에 대해서 모두 <%=productvolist.size()%>개가 검색되었습니다.</p>
        </div>
        <div class="bidding_list">
            <div class="bidding_list_header">
                <div class="product_info">상품 정보</div>
                <div class="current_price">응찰현황</div>
                <div class="product_delivery">배송</div>
                <div class="bid_deadline">마감 시간</div>
            </div>
            <%if(productvolist.size()==0){%>
				<div class="no_list" align="center">
					<p>출력할 내용이 없습니다.</p>
				</div>
  			<%}%>
            <%
            for(int i=0;i<productvolist.size();i++){  
  				ProductVO productvo = productvolist.get(i);
  				String top_bidder_id = top_bidder_idlist.get(i).toString();
  				if(i >= 5 * (nowpage - 1) && i<=4 + 5 * (nowpage - 1) ){
  	  		%>
            <div class="bidding_list_content">
                <div class="product_info">
                    <img src="<%=productvo.getProduct_img_1()%>">
                    <div class="product_info_content">
                        <p><%=productvo.getProduct_category_1()%>> <%=productvo.getProduct_category_2()%></p>
                        <p><%=productvo.getProduct_subject()%></p>
                        <p>시작가: <%=productvo.getProduct_starting_price() %> 원 / 즉시 구매가: <%if(productvo.getProduct_purchase_price()==0){%>설정되어있지 않음.<%}else{%><%=productvo.getProduct_purchase_price() %> 원<%} %></p>
                    	<p>등록일: <%=productvo.getProduct_issue_date() %>
                    </div>
                </div>
                <div class="current_price">
                    <div class="current_price_content">
                        <p>최고 응찰자 : <%=top_bidder_id%><%if(top_bidder_id!=""){ %> 님<%} %></p>
                        <p>경매 현재가 : <%=productvo.getProduct_current_price() %> 원</p>
                        <p>참가자 수 : <%=productvo.getProduct_participants() %> 명</p>
                        <p>입찰 수: <%=productvo.getProduct_bids() %> 건</p>
                    </div>
                </div>
                <div class="product_delivery">
                    <div class="product_delivery_content1">
                        <p><%=productvo.getProduct_delivery() %></p>
                    </div>
                    <div class="product_delivery_content2">
                        <p>직거래 가능지역:<br> <%=productvo.getProduct_transaction_area() %></p>
                    </div>
                </div>
                <div class="bid_deadline">
                    <div class="bid_deadline_content">
                    	<p>
                           	<span class="auction_countdown date<%=i %>"
								data-endTime="<%=productvo.getProduct_end_date() %>"
								data-complete="<%=productvo.getProduct_progress() %>">&nbsp;
							</span>
						</p>
                    	<p><%=productvo.getProduct_end_date() %>
						</p>
                        <p><a href="./boarddetail.hs?product_number=<%=productvo.getProduct_number()%>"><button>페이지로 이동하기</button></a></p>
                    </div>
                </div>
            </div>
            <%}} %>
        </div>
        <div class="page_btns" align="center">
        	<%if(nowpage>1){ %>
	        <a href="./selling.hs?page=<%=nowpage-1%>"><button>&#171;</button></a>
	        <%}
	        for(int i=1;i<=maxpage;i++){ %>
	        	<%if(i==nowpage){ %>
        		<a href="./selling.hs?page=<%=i %>"><button style="background-color:darkgray; cursor:default;" disabled="true"><%=i %></button></a>
	        <%}else{%>
	        	<a href="./selling.hs?page=<%=i %>"><button><%=i %></button></a>
	        <%}} %>
	        <%if(nowpage<maxpage){ %>
	        <a href="./selling.hs?page=<%=nowpage+1%>"><button>&#187;</button></a>
        	<%}%>
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
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="./resources/js/common.js"></script>
    <script type="text/javascript" src="./resources/js/selling.js?productvolist_size=<%=productvolist_size%>"></script>
    
</body></html>