<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.alltion.detailpage.*" %>
<%@ page import="com.spring.alltion.productRegistration.*" %>
<%@ page import="com.spring.alltion.login.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 로그인한 세션 아이디
	String id = (String)session.getAttribute("userId");
	// 상품 정보
	ProductVO productvo = (ProductVO)request.getAttribute("productvo");
	String category_2_eng = (String)request.getAttribute("category_2_eng");
	// 판매자 정보
	String writerId = productvo.getProduct_id();
	// 판매자 정보
	MemberVO membervo = (MemberVO)request.getAttribute("membervo");
	Seller_Credit_Score_TestVO scstvo = (Seller_Credit_Score_TestVO)request.getAttribute("scstvo");
	String sale_credit = (String)request.getAttribute("sale_credit");
	
	String top_bidder_id = (String)request.getAttribute("top_bidder_id");
	int bid_listcount = (int)request.getAttribute("bid_listcount");
	int bid_nowpage = (int)request.getAttribute("bid_page");
	int bid_maxpage=(int)request.getAttribute("bid_maxpage");
	int bid_startpage=(int)request.getAttribute("bid_startpage");
	int bid_endpage=(int)request.getAttribute("bid_endpage");
	
	int comment_listcount = (int)request.getAttribute("comment_listcount");
	int comment_nowpage = (int)request.getAttribute("comment_page");
	int comment_maxpage=(int)request.getAttribute("comment_maxpage");
	int comment_startpage=(int)request.getAttribute("comment_startpage");
	int comment_endpage=(int)request.getAttribute("comment_endpage");
	
	int review_listcount = (int)request.getAttribute("review_listcount");
	int review_nowpage = (int)request.getAttribute("review_page");
	int review_maxpage=(int)request.getAttribute("review_maxpage");
	int review_startpage=(int)request.getAttribute("review_startpage");
	int review_endpage=(int)request.getAttribute("review_endpage");
	
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/main_style.css?after">
    <link rel="stylesheet" href="./resources/css/product_detail.css?after"> <!-- 상세페이지 스타일시트 참조 (by.HONG)-->
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
    <!--  !! 여기에 내용 넣기 !!  by.Hong  -->
    <div align="center">
    <div class="main_body" align="left">
        <div class="product_summary">
            <!-- ↓↓경매 정보//사진,대략적인 정보↓↓-->
            <div class="summary_slideshow" align="center">
                <div class="slideshow-container">
                    <div class="mySlides fade">
                        <img class="target1" src="<%=productvo.getProduct_img_1() %>" data-zoom="2">
                    </div>
                    <%if(productvo.getProduct_img_2()!=null){ %>
                    <div class="mySlides fade">
                        <img class="target2" src="<%=productvo.getProduct_img_2() %>" data-zoom="2">
                    </div>
                    <%} %>
                    <%if(productvo.getProduct_img_3()!=null){ %>
                    <div class="mySlides fade">
                        <img class="target3" src="<%=productvo.getProduct_img_3() %>" data-zoom="2">
                    </div>
                    <%} %>
                    <%if(productvo.getProduct_img_4()!=null){ %>
                    <div class="mySlides fade">
                        <img class="target4" src="<%=productvo.getProduct_img_4() %>" data-zoom="2">
                    </div>
                    <%} %>
                    <%if(productvo.getProduct_img_5()!=null){ %>
                    <div class="mySlides fade">
                        <img class="target5" src="<%=productvo.getProduct_img_5() %>" data-zoom="2">
                    </div>
                    <%} %>
                    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                    <a class="next" onclick="plusSlides(1)">&#10095;</a>
                </div>
                <br>
                <div class="dot_group">
                    <span class="dot" onclick="currentSlide(1)"><img src="<%=productvo.getProduct_img_1() %>" style="width:100px; height:100px;"></span>
                    <%if(productvo.getProduct_img_2()!=null){ %>
                    <span class="dot" onclick="currentSlide(2)"><img src="<%=productvo.getProduct_img_2() %>" style="width:100px; height:100px;"></span>
                    <%} %>
                    <%if(productvo.getProduct_img_3()!=null){ %>
                    <span class="dot" onclick="currentSlide(3)"><img src="<%=productvo.getProduct_img_3() %>" style="width:100px; height:100px;"></span>
                    <%} %>
                    <%if(productvo.getProduct_img_4()!=null){ %>
                    <span class="dot" onclick="currentSlide(4)"><img src="<%=productvo.getProduct_img_4() %>" style="width:100px; height:100px;"></span>
                    <%} %>
                    <%if(productvo.getProduct_img_5()!=null){ %>
                    <span class="dot" onclick="currentSlide(5)"><img src="<%=productvo.getProduct_img_5() %>" style="width:100px; height:100px;"></span>
                 	<%} %>
                 
                </div>
                <button type="button" class="mag_btn"><img src="./resources/img/product/magicon.png"></button>&nbsp;&nbsp;&nbsp;
                <button type="button" class="mag_close"><img src="./resources/img/product/mag_close.png"></button>
            </div>
            <!-- ↓↓경매 요약 정보에서 텍스트 부분↓↓ -->
            <div class="summary_information">
                <div class="summary_info_nowPrice">
                    <div class="summary_info_category" style="display: inline-block;">
                        <span><font><%=productvo.getProduct_category_1() %></font></span>
                        <span>&nbsp;&nbsp;&#10095;&nbsp;&nbsp;</span>
                        <span><font><%=productvo.getProduct_category_2() %></font></span>
                    </div>
                    <ul>
                        <li>
                            <p class="product_detail name" style="font-size: 28px;"><%=productvo.getProduct_subject() %></p>
                        </li>
                        <li>
                            <label for="now_price">현재가</label>
                            <p id="now_price"><%=productvo.getProduct_current_price() %>원</p>
                        </li>
                    </ul>
                </div>
                <div class="summary_info">
                    <ul>
                       <li>
                            <label for="product_number">상품 번호</label>
                            <p>NO <%=productvo.getProduct_number() %></p>
                        </li>
                        <li>
                            <label for="id">판매자</label>
                            <font><%=productvo.getProduct_id().substring(0,3) %>****&nbsp;님</font>&nbsp;&nbsp; 
                            <button id="seller_check_btn" onclick="modal_display(1)" style="background-color: #616161; color:white;">
                                	판매자 정보 확인하기
                            </button>
                            <!-- ↓↓판매자 정보확인하기 눌렀을때↓↓ Modal by.HONG-->
                            <div id="seller_info_modal" class="modal">
                                <div class="modal-content">
                                    <span class="close">&times;</span>
                                    <fieldset id="seller_info">
                                        <legend>판매자 정보</legend>
                                        <ul>
                                            <li>
                                                <label>아이디</label>
                                                <font><%=productvo.getProduct_id().substring(0,3) %>****</font>
                                            </li>
                                            <li>
                                                <label>이메일</label>
                                                <font><%=membervo.getEmail() %></font>
                                            </li>
                                            <li>
                                                <label>정상거래</label>
                                                <font><%=scstvo.getSale_normal() %> 건</font>
                                            </li>
                                            <li>
                                                <label>신고횟수</label>
                                                <font>0 건</font>
                                            </li>
                                            <li>
                                                <label>판매자 등급</label>
                                                <font><%=sale_credit %></font>
                                            </li>
                                            <li>
                                                <label>판매 성사율</label>
                                                <font><%=scstvo.getSale_success_rate() %>%</font>
                                            </li>
                                        </ul>
                                    </fieldset>
                                </div>
                            </div>
                        </li>
                        <li>
                            <label for="boarddate">경매기간</label>
                            <p><%=productvo.getProduct_issue_date().substring(0,16) %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=productvo.getProduct_end_date().substring(0,16) %></p>
                        </li>
                        <li>
                            <label for="start_price">시작가</label>
                            <p><%=productvo.getProduct_starting_price() %>원</p>
                        </li>
                        <li>
                            <label for="purchase_price">즉시 구매가</label>
                            <p style="color:#F9A825;font-weight:bold;font-size:18px;"><%if(productvo.getProduct_purchase_price()!=0){%><%=productvo.getProduct_purchase_price() %>원<%} %>&nbsp;</p>
                        </li>
                        <li>
                            <label for="top_bidder_id">최고 응찰자</label>
                            <p id="top_bidder_id"><%=top_bidder_id %><br></p>
                        </li>
                        <li>
                            <label for="sale_credit">판매자 등급</label>
                            <p id="sale_credit"><%=sale_credit %> </p>
                        </li>
                        <li>
                            <label for="howtotransaction">거래방법</label>
                            <p>택배: <%=productvo.getProduct_delivery() %>/ 직거래:<%=productvo.getProduct_transaction_area() %> </p>
                        </li>
                        <li>
                            <label for="boarddate">남은시간</label>
                            <p style="font-weight:bold;font-size:18px;">
                            	<span class="auction_countdown"
									data-endTime="<%=productvo.getProduct_end_date() %>"
									data-complete="<%=productvo.getProduct_progress() %>">&nbsp;
								</span>
							</p>
                        </li>
                        <li>
                            <label for="boarddate">응찰단위</label>
                            <font><%=productvo.getProduct_bidding_unit() %>&nbsp;원</font>&nbsp;&nbsp; 
                            <button class="btns1" type="button" id="bid_notify_btn" onclick="modal_display(2)">응찰 유의사항</button>
                            <!-- ↓↓응찰 유의사항을 눌렀을때↓↓-->
                            <div id="bid_notify_modal" class="modal">
                                <div class="modal-content">
                                    <span class="close">&times;</span>
                                    <fieldset id="bid_notify">
                                        <legend>응찰시 유의사항!</legend>
                                        <ul>
                                            <li>
                                                <label>1조 1항</label>
                                                <font>응찰시 취소 불가능</font>
                                            </li>
                                            <li>
                                                <label>1조 2항</label>
                                                <font>응찰 후에는 물품을 열람하지 않았다는 이유 등으로 여하한 이의도 제기할 수 없습니다.
</font>
                                            </li>
                                            <li>
                                                <label>2조 1항</label>
                                                <font>택배 배송시 발생한 손상은 판매자에게 없습니다. (또한, 반품사유가 되지 않음.)</font>
                                            </li>
                                            <li>
                                                <label>2조 2항</label>
                                                <font>경매가격에 택배 배송 관련 요금은 포함되어 있지 않습니다.</font>
                                            </li>
                                            <li>
                                                <label>3조 1항</label>
                                                <font>판매자나 관리자가 임의로 응찰을 취소할 수 없음.</font>
                                            </li>
                                            <li>
                                                <label>3조 2항</label>
                                                <font>응찰을 참여한 순간 판매자는 판매를 취소할 수 없습니다.</font>
                                            </li>
                                            <li>
                                                <label>3조 3항</label>
                                                <font>즉시 구매를 할 시 경매 남은시간에 관련없이 경매가 종료됩니다.</font>
                                            </li>
                                            <li>
                                                <label>4조 1항</label>
                                                <font>즉시 구매가가 설정되어 있을 시 즉시 구매가를 상한가로 간주합니다.</font>
                                            </li>
                                            <li>
                                            	<label>4조 2항</label>
                                            	<font>즉시 구매가가 설정되어 있지 않을 시 경매시간이 종료함에 따라 경매가 종료됩니다.</font>
                                            </li>
                                        </ul>
                                    </fieldset>
                                </div>
                            </div>
                        </li>
                        <li>
                        	<label>판매자 구매후기</label>
                        	<%=review_listcount %> 건 &nbsp;&nbsp; <button class="review_viewer" onclick="modal_display(3)">더보기 ></button>
                        	<!-- 판매자 구매후기 더보기 클릭시 -->
                        	<div id="seller_review_modal" class="modal">
                        		
                        		<div class="modal_content">
                        			<div class="review_top">	
                        				<span>구매 후기</span>
                        				<span class="close">&times;</span>
                        			</div>
                        			<table class="review_list">
                        			<thead>
	                        			<tr class="review_title" align="center">
	                        				<th class="review_no">번호</th>
	                       					<th class="review_evaluate">평가</th>
	                       					<th class="review_image">이미지</th>
	                       					<th class="review_subject">물품명</th>
	                       					<th class="review_content">구매후기</th>
	                       					<th class="review_writer">작성자</th>
	                       					<th class="review_date">작성일</th>
	                       				</tr>
                       				</thead>
                       				<tbody id="review_list_content">
                       					
                       				</tbody>	
                       				</table>
                       				<div class="paging_btns" align="center">
	                       				<%for(int i=review_startpage;i<=review_endpage;i++){%>
											<a type="button" onclick="reviewList(<%=i%>)"><button><%=i %></button></a>
										<%}%>
                       				</div>
                        		</div>
                        	</div>
                        </li>
						
                    </ul>
                </div>
                <div class="btns" align="center">
                <%if(productvo.getProduct_progress()==1) {%>
                	<font style="color: red;">마감 종료된 경매입니다.</font><br>
                <%}else if(id!=null&&!id.equals(productvo.getProduct_id())){ %>
                    <button type="button" id="bid_btn">응찰하기</button>
                    <%if(productvo.getProduct_purchase_price()!=0) {%>
                    	<button type="button" id="bid_btn2">즉시구매</button>
                    <%} %>
                    <button type="button" id="bid_btn4">찜하기</button>
                    <a href=./getCategorylist.ms?product_category_2=<%=category_2_eng%>><button type="button" id="bid_btn3">목록으로 돌아가기</button></a>
				<%}else if(id==null){%>
					<button type="button" class="no_login">응찰하기</button>
					<button type="button" class="no_login">즉시구매</button>
					<button type="button" class="no_login">찜하기</button>
					<a href=./getCategorylist.ms?product_category_2=<%=category_2_eng%>><button type="button" id="bid_btn3">목록으로 돌아가기</button></a>
				<%}else if(id.equals(productvo.getProduct_id())){ %>
					<a href=./getCategorylist.ms?product_category_2=<%=category_2_eng%>><button type="button" id="bid_btn3">목록으로 돌아가기</button></a>
				<%} %>
				</div>

            </div>
        </div>
        <!-- ↓↓상세정보페이지 네비게이션바↓↓ -->
        <ul class="detail_page_nav">
            <li style="border-radius: 4px 4px 0 0;background-color:#BBBBBB;font-weight: bold;">
                <a class="bid_list_count" style="color:white;">응찰 현황 (<%=bid_listcount %>)</a>
            </li>
            <li>
                <a type="button" onclick="move(2)">상품 정보</a>
            </li>
            <li>
                <a type="button" onclick="move(3)">교환 / 반품</a>
            </li>
            <li>
                <a class="comment_list_count" type="button" onclick="move(4)">댓 글 (<%=comment_listcount %>)</a>
            </li>
        </ul>

        <!-- ↓↓응찰자 리스트↓↓ -->
        <div class="bid_list" align="center">
			<div class="bid_list_column">
                <div class="bid_list_no">응찰 번호</div>
                <div class="bid_price">응찰 가격</div>
                <div class="bidder_id">응찰자</div>
                <div class="bid_time">응찰 시간</div>
            </div>
            
            <div class="bidder">
               
            </div>
           	
			
        </div>
		<!-- 응찰리스트 페이징 -->
		<div class="paging_btns" align="center">
			<%for(int i=bid_startpage;i<=bid_endpage;i++){%>
				<a type="button" onclick="bidList(<%=i%>)"><button><%=i %></button></a>
			<%}%>
		</div>
		
        <ul class="detail_page_nav">
            <li>
                <a class="bid_list_count" type="button" onclick="move(1)">응찰 현황 (<%=bid_listcount %>)</a>
            </li>
            <li style="border-radius: 4px 4px 0 0;background-color:#BBBBBB;font-weight: bold;">
                <a style="color:white;">상품 정보</a>
            </li>
            <li>
                <a type="button" onclick="move(3)">교환 / 반품</a>
            </li>
            <li>
                <a class="comment_list_count" type="button" onclick="move(4)">댓 글 (<%=comment_listcount %>)</a>
            </li>
        </ul>

        <!-- ↓↓경매의 사진들 펼쳐놓음.↓↓ -->
        <div class="product_information">
			
            <div class="product_information_text">
				<%=productvo.getProduct_content()%>
            </div>
            

            <ul class="detail_page_nav">
                <li>
                    <a class="bid_list_count" type="button" onclick="move(1)">응찰 현황 (<%=bid_listcount %>)</a>
                </li>
                <li>
                    <a type="button" onclick="move(2)">상품 정보</a>
                </li>
                <li style="border-radius: 4px 4px 0 0;background-color:#BBBBBB;font-weight: bold;">
                    <a style="color:white;">교환 / 반품</a>
                </li>
                <li>
                    <a class="comment_list_count" type="button" onclick="move(4)">댓 글 (<%=comment_listcount %>)</a>
                </li>
            </ul>
        </div>

        <!-- ↓↓경매물품의 상세정보↓↓ -->
        <div class="exchange_rule">
            <ul>
            	<li>
            		<label>배송지역</label>
            		<font>전국※제주권 및 도서산간 지역은 배송비가 추가될 수 있습니다.</font>
            	</li>
            	<li>
            		<label>배송방법</label>
            		<font>택배, 선불/착불 [선/착불 4,000원]</font>
            	</li>
            	<li>
            		<label>반품기간</label>
            		<font>수령일로 부터 7일 이내에 반품을 신청 하실 수 있습니다.</font>
            	</li>
            	<li>
            		<label>반품비용</label>
            		<font>원인제공자 부담을 원칙으로 합니다.</font>
            	</li>
            </ul>
            <br>
            <div>● 반품시 주의사항</div>
            <p>
            	1) 소비자의 책임 있는 사유로 상품 등이 멸실 / 훼손된 경우(단지 확인을 위한 포장 훼손 제외) <br>
            	2) 소비자의 사용 / 소비에 의해 상품 등의 가치가 현저히 감소한 경우 <br>
            	3) 시간의 경과에 의해 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우 <br>
            	4) 복제가 가능한 상품 등의 포장을 훼손한 경우 <br>
            	5) 판매 / 생산방식의 특성상, 반품 시 판매자 에게 회복할 수 없는 손해가 발생하는 경우(주문 접수 후 개별생산, 맞춤 제작 등)
            </p>
            <div>● 파손물품 반품시 주의사항</div>
            <p>
            	물품 수령시 택배기사와 함께 물품의 파손여부를 확인하신 후, <br>
            	반품 신청시 파손 이미지를 등록해 주시면 안전하고 신속하게 반품 / 교환 처리를 해드리고 있습니다.
            </p>
        </div>

        <ul class="detail_page_nav">
            <li>
                <a class="bid_list_count" type="button" onclick="move(1)">응찰 현황 (<%=bid_listcount %>)</a>
            </li>
            <li>
                <a type="button" onclick="move(2)">상품 정보</a>
            </li>
            <li>
                <a type="button" onclick="move(3)">교환 / 반품</a>
            </li>
            <li style="border-radius: 4px 4px 0 0;background-color:#BBBBBB;font-weight: bold;">
                <a class="comment_list_count" style="color:white;">댓 글 (<%=comment_listcount %>)</a>
            </li>
        </ul>

        <!-- ↓↓댓 글 항목.↓↓-->
        <div class="comment_div">
            <div class="comment_title">댓 글 <font size="2"> |악의적인 비방글이나 욕설글은 무통보 삭제 되오니 이점 유의바랍니다</font>&nbsp;&nbsp;<input type="checkbox" id="secret"><font size="3" style="color:cornflowerblue;"> 비밀글</font></div>
            <textarea id="comment_content_input" placeholder="<%if(id!=null){ %>  *댓글을 작성해주세요..
  *비밀글 입력시 판매자와 관리자만 볼 수 있습니다.<%}else{%>댓글은 로그인 후 이용 가능합니다<%}%>" <%if(id==null){ %>onclick="togologin()" style="cursor:pointer;"<%} %>></textarea>
            <br>
            <%if(id!=null){ %>
            <button type="button" id="comment_btn">작 성</button>
            <%} %>
            <div class="comment_list">
            
            </div>
        </div>
        <div class="paging_btns" align="center" style="margin-bottom:100px; margin-top:50px;">
			<%for(int j=comment_startpage;j<=comment_endpage;j++){%>
				<a type="button" onclick="commentList(<%=j%>)"><button><%=j %></button></a>
			<%}%>
		</div>

    </div>
    </div>

    <!-- !! 메인 페이지 내용(지워서 사용함) !! end -->

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
    <script type="text/javascript" src="./resources/js/board_detail.js?bno=<%=productvo.getProduct_number()%>&limit_price=<%=productvo.getProduct_purchase_price()%>&sessionid=<%=id%>&writerId=<%=writerId%>"></script>
    

</body>
</html>
