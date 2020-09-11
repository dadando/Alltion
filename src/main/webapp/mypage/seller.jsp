<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.alltion.test.Product_kjVO" %>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
	List<Product_kjVO> getSale_list = (List<Product_kjVO>)request.getAttribute("getSale_list");
%>
<%
	List<Product_kjVO> dealcompleteseller_list = (List<Product_kjVO>)request.getAttribute("dealcompleteseller_list");
%>
<%
	List<Product_kjVO> getdeposit_before_list = (List<Product_kjVO>)request.getAttribute("getdeposit_before_list");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/main_style.css">
    <link rel="stylesheet" href="./resources/css/seller.css">
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
	<div id="kakao-talk-channel-chat-button" style='display: none;'></div>
 	<div class="main_body">
    <div class="bidding_title">
            <h1>판매 경매</h1>
    </div>
        <div class="bidding_notify">
            <ul>
                <li>
                    회원님께서 현재 판매 중인 경매 리스트입니다.
                <li>
                <li>
                    문의 사항은 고객센터에 문의해주시기 바랍니다.
                </li>

            </ul>
        </div>
       </div>
	
		
    <!--판매 대기중-->
		<%if(getdeposit_before_list.size()==0) {%>
    		<div class="seller--form">
    		<h3>판매 대기중 경매가 없습니다</h3>
    		</div>
    	<%}else{ %>
		<div class="seller--form" id = "wait_sell_list"></div>
  		
  		<div class="page_btns" id = "wait_sell_page_list" align = "center"></div>
		<%} %>
    <!-- 판매중 -->
    	
    	<%if(getSale_list.size()==0) {%>
    		<div class="seller--form">
    		<h3>판매중 경매가 없습니다</h3>
    		</div>
    	<%}else{ %>
    	
    	<div class="seller--form" id ="sell_list"></div>
    	
        <div class="page_btns" id ="sell_list_page" align = "center"></div>
    	<%} %>
    <!-- 판매완료 -->

    	<%if(dealcompleteseller_list.size()==0) {%>
    		<div class="seller--form">
    		<h3>판매 완료된 경매가 없습니다</h3>
    		</div>
    	<%}else{ %>

        <div class="seller--form" id ="sale_list"></div>
    	
        <div class="page_btns" id ="sale_list_page" align = "center"></div>
		<%} %>
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
    
    <script>
        $(function(){
            // 광고 없애기
            $(".ad__banner--closeBtn").click(function(){
                $(".ad__banner").hide();
			})
            
            // 헤더 고정
            var header = $('.lower_header');
            $(window).scroll(function(){
                if($(this).scrollTop() > 0){
                        header.addClass('sticky');
                   }else{
                        header.removeClass('sticky');
                   }
            })
            
            // 카테고리 누를 때마다 이동
            $("ul.deadline-items__category a").click(function(){
//                
//                var activeTab = $(this).attr('id');
//                
//				$('ul.deadline-items__category a').removeClass('active');
//				$('.menu-box').removeClass('active');
//				$(this).prop('checked', true);
//				$('div#' + activeTab).addClass('active');
            })
        });
    </script>
    
    <script>
    	function Waiting_selling_page(wait_page){
    		$("#wait_sell_list").empty();
    		$("#wait_sell_page_list").empty();
    		$.ajax({
    			url: '/alltion/wait_sell.bo',
    			type: 'POST',
    			data:{
    				page : wait_page
    			},
    			dataType: 'json',
    			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
    			success: function(data){
    				let wait_nowpage = wait_page;
    				let wait_maxpage = parseInt(parseFloat(data.length) + 0.9);
    				$.each(data, function(index, item){
    					var output = '';
    					if(index == wait_page - 1){
    						output += '<h3>판매 대기중 경매</h3>';
    						
    						output += '<div class="seller--content">';
    						
    						output += '<ul class="seller_form list">';
    						output += '<li>';
    						output += '<div class="seller_form__list title">';
    						output += '<span>상품 번호</span>';
    						output += '</div>';
    						output += '<div class="seller_form__list content">';
    						output += '<span>' + item.product_number + '</span>';
    						output += '</div> ';
    						output += '</li>';
    						output += '</ul>';
    						
    						output += '<ul class="seller_form list">';
    						output += '<li>';
    						output += '<div class="seller_form__list title">';
    						output += '<span>상품명</span>';
    						output += '</div>';
    						output += '<div class="seller_form__list content">';
    						output += '<span>' + item.product_subject + '</span>';
    						output += '</div>';
    						output += '</il>';
    						output += '</ul>';
    						
    						output += '<ul class="seller_form list">';
    						output += '<li>';
    						output += '<div class="seller_form__list title">';
    						output += '<span>판매 가격</span>';
    						output += '</div>';
    						output += '<div class="seller_form__list content">';
    						output += '<span>' + item.trading_price + '</span>';
    						output += '</div>';
    						output += '</li>';
    						output += '</ul>';
    						output += '</div>';
    					}
    					$("#wait_sell_list").append(output);
    				});
    				var wait_list = '';
    				if(wait_nowpage>1){
    					wait_list += '<button onclick="Waiting_selling_page(' + (wait_nowpage-1) + ')">&#171;</button>';
			        }else{
			        	wait_list += '<button>&#171;</button>';
			        }
			        for(let i=1;i<=wait_maxpage;i++){
			        	wait_list += '<button onclick="Waiting_selling_page(' + i + ')">' + i + '</button>';
			        } 
			        if(wait_nowpage<wait_maxpage){
			        	wait_list += '<button onclick="Waiting_selling_page(' + (wait_nowpage+1) + ')">&#187;</button>';
			       	}else {
			       		wait_list += '<button>&#187;</button>';
			       	}
    				$("#wait_sell_page_list").append(wait_list);
    			},
    			error: function(error) {
					alert("ajax 안된다");
				}
    		});
    	}
    	$(function() {
    		Waiting_selling_page(1);
		});
    </script>
    
    <script>
    
    		function Selling_page(sell_page){
    			$("#sell_list").empty();
    			$("#sell_list_page").empty();
    			$.ajax({
    				url: '/alltion/sell.bo',
    				type: 'POST',
        			data:{
        				page : sell_page
        			},
        			dataType: 'json',
        			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
        			success: function(data){
        				let sell_nowpage = sell_page;
        				let sell_maxpage = parseInt(parseFloat(data.length) + 0.9);
        				$.each(data, function(index, item){
        					var output = '';
        					if(index == sell_page - 1){
        						output += '<h3>판매중 경매</h3>';
        						
        						output += '<div class="seller--content">';
        						
        						output += '<ul class="seller_form list">';
        						output += '<li>';
        						output += '<div class="seller_form__list title">';
        						output += '<span>상품 번호</span>';
        						output += '</div>';
        						output += '<div class="seller_form__list content">';
        						output += '<span>' + item.product_number + '</span>';
        						output += '</div> ';
        						output += '</li>';
        						output += '</ul>';	
        						
        						output += '<ul class="seller_form list">';
        						output += '<li>';
        						output += '<div class="seller_form__list title">';
        						output += '<span>상품명</span>';
        						output += '</div>';
        						output += '<div class="seller_form__list content">';
        						output += '<span>' + item.product_subject + '</span>';
        						output += '</div>';
        						output += '</il>';
        						output += '</ul>';
        						
        						output += '<ul class="seller_form list">';
        						output += '<li>';
        						output += '<div class="seller_form__list title">';
        						output += '<span>판매 가격</span>';
        						output += '</div>';
        						output += '<div class="seller_form__list content">';
        						output += '<span>' + item.trading_price + '</span>';
        						output += '</div>';
        						output += '</li>';
        						output += '</ul>';
        						
        						output += '<ul class="seller_form list">';
        						output += '<li>';
        						output += '<div class="seller_form__list title">';
        						output += '<span>운송장번호 입력기한</span>';
        						output += '</div>';
        						output += '<div class="seller_form__list content">';
        						output += '<span>' + item.trading_waybill_deadline + '</span>';
        						output += '</div>';
        						output += '</li>';
        						output += '</ul>';
        						
        						
        						output += '<ul class="seller_form list">';
        						output += '<li>';
        						output += '<div class="seller_form__list title">';
        						output += '<span>거래 방식</span>';
        						output += '</div>';
        						output += '<div class="seller_form__list content">';
        						output += '<span>' + item.trading_transaction_method + '</span>';
        						output += '</div>';
        						output += '</li>';
        						output += '</ul>';
        						
        						
        						output += '<ul class="seller_form list">';
        						output += '<li>';
        						output += '<div class="seller_form__list title">';
        						output += '<span>구매자 아이디</span>';
        						output += '</div>';
        						output += '<div class="seller_form__list content">';
        						output += '<span>' + item.trading_buyer_id + '</span>';
        						output += '</div>';
        						output += '</li>';
        						output += '</ul>';
        						
        						
        						output += '<ul class="seller_form list">';
        						output += '<li>';
        						output += '<div class="seller_form__list title">';
        						output += '<span>구매자 이름</span>';
        						output += '</div>';
        						output += '<div class="seller_form__list content">';
        						output += '<span>' + item.member_name + '</span>';
        						output += '</div>';
        						output += '</li>';
        						output += '</ul>';
        						
        						
        						output += '<ul class="seller_form list">';
        						output += '<li>';
        						output += '<div class="seller_form__list title">';
        						output += '<span>구매자 번호</span>';
        						output += '</div>';
        						output += '<div class="seller_form__list content">';
        						output += '<span>' + item.trading_phone + '</span>';
        						output += '</div>';
        						output += '</li>';
        						output += '</ul>';
        						
        						
        						output += '<ul class="seller_form list">';
        						output += '<li>';
        						output += '<div class="seller_form__list title">';
        						output += '<span>구매자 주소</span>';
        						output += '</div>';
        						output += '<div class="seller_form__list content">';
        						output += '<span>' + item.sample4_postcode + '</span>';
        						output += '&nbsp;&nbsp;'
        						output += '<span>' + item.sample4_roadAddress + '</span>'; 
        						output += '&nbsp;&nbsp;'
        						output += '<span>' + item.sample4_jibunAddress + '</span>';
        						output += '&nbsp;&nbsp;'
        						output += '<span>' + item.sample4_detailAddress + '</span>';
        						output += '</div>';
        						output += '</li>';
        						output += '</ul>';
        						output += '</div>';
        						
        						output += '<a href = "./waybill.kj?product_number=' + item.product_number + '" class = "base_btn" >운송장 번호 입력하기</a>';
        						
        						}
        					$("#sell_list").append(output);
        				});
        				var selling_list = '';
        				if(sell_nowpage>1){
        					selling_list += '<button onclick="Selling_page(' + (sell_nowpage-1) + ')">&#171;</button>';
    			        }else{
    			        	selling_list += '<button>&#171;</button>';
    			        }
    			        for(let i=1;i<=sell_maxpage;i++){
    			        	selling_list += '<button onclick="Selling_page(' + i + ')">' + i + '</button>';
    			        } 
    			        if(sell_nowpage<sell_maxpage){
    			        	selling_list += '<button onclick="Selling_page(' + (sell_nowpage+1) + ')">&#187;</button>';
    			       	}else {
    			       		selling_list += '<button>&#187;</button>';
    			       	}
        				$("#sell_list_page").append(selling_list);
        			},
        			error: function(error) {
    					alert("ajax 안된다");
    				}
        		});
        	}
        	$(function() {
        		Selling_page(1);
    		});
    </script>
    
    <script>
    
    	function Sale_complete(sale_page){
    		$("#sale_list").empty();
			$("#sale_list_page").empty();
			$.ajax({
				url: '/alltion/sale_complete.bo',
				type: 'POST',
				data: {
					page: sale_page
				},
				dataType: 'json',
				contentType : 'application/x-www-form-urlencoded; charset=utf-8',
				success: function(data) {
					let sale_nowpage = sale_page;
					let sale_maxpage = parseInt(parseFloat(data.length) + 0.9);
					$.each(data, function(index, item) {
						var output = '';
						if(index == sale_page - 1){
							output += '<h3>판매 완료</h3>';
    						
    						output += '<div class="seller--content">';
    						
    						output += '<ul class="seller_form list">';
    						output += '<li>';
    						output += '<div class="seller_form__list title">';
    						output += '<span>상품 번호</span>';
    						output += '</div>';
    						output += '<div class="seller_form__list content">';
    						output += '<span>' + item.product_number + '</span>';
    						output += '</div>';
    						output += '</li>';
    						output += '</ul>';
    						
    						output += '<ul class="seller_form list">';
    						output += '<li>';
    						output += '<div class="seller_form__list title">';
    						output += '<span>상품명</span>';
    						output += '</div>';
    						output += '<div class="seller_form__list content">';
    						output += '<span>' + item.product_subject + '</span>';
    						output += '</div>';
    						output += '</li>';
    						output += '</ul>';
    						
    						output += '<ul class="seller_form list">';
    						output += '<li>';
    						output += '<div class="seller_form__list title">';
    						output += '<span>판매 가격</span>';
    						output += '</div>';
    						output += '<div class="seller_form__list content">';
    						output += '<span>' + item.trading_price + '</span>';
    						output += '</div>';
    						output += '</li>';
    						output += '</ul>';
    						
    						output += '<ul class="seller_form list">';
    						output += '<li>';
    						output += '<div class="seller_form__list title">';
    						output += '<span>판매 날짜</span>';
    						output += '</div>';
    						output += '<div class="seller_form__list content">';
    						output += '<span>' + item.trading_purchase_date + '</span>';
    						output += '</div>';
    						output += '</li>';
    						output += '</ul>';
    						
    						output += '<ul class="seller_form list">';
    						output += '<li>';
    						output += '<div class="seller_form__list title">';
    						output += '<span>구매자</span>';
    						output += '</div>';
    						output += '<div class="seller_form__list content">';
    						output += '<span>' + item.trading_buyer_id + '</span>';
    						output += '</div>';
    						output += '</li>';
    						output += '</ul>';
    						
    						output += '</div>';
							}
							$("#sale_list").append(output);
	    				});
	    				var saleing_list = '';
	    				if(sale_nowpage>1){
	    					saleing_list += '<button onclick="Sale_complete(' + (sale_nowpage-1) + ')">&#171;</button>';
				        }else{
				        	saleing_list += '<button>&#171;</button>';
				        }
				        for(let i=1;i<=sale_maxpage;i++){
				        	saleing_list += '<button onclick="Sale_complete(' + i + ')">' + i + '</button>';
				        } 
				        if(sale_nowpage<sale_maxpage){
				        	saleing_list += '<button onclick="Sale_complete(' + (sale_nowpage+1) + ')">&#187;</button>';
				       	}else {
				       		saleing_list += '<button>&#187;</button>';
				       	}
	    				$("#sale_list_page").append(saleing_list);
	    			},
	    			error: function(error) {
						alert("ajax 안된다");
					}
	    		});
	    	}
	    	$(function() {
	    		Sale_complete(1);
			});
    
    </script>
    
</body>
</html>