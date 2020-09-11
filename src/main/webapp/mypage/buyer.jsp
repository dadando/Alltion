<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.alltion.login.MemberVO" %>
<%@ page import = "com.spring.alltion.test.Product_kjVO" %>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%   
   List<Product_kjVO> product_list =
         (List<Product_kjVO>)request.getAttribute("product_list");
   
%>
<%
   List<Product_kjVO> delivery_list =
         (List<Product_kjVO>)request.getAttribute("delivery_list");
%>
<%
   List<Product_kjVO> dealcomplete_list =
         (List<Product_kjVO>)request.getAttribute("dealcomplete_list");
%>
<%
   List<Product_kjVO> delivery_before_list =
         (List<Product_kjVO>)request.getAttribute("delivery_before_list");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/main_style.css?after">
    <link rel="stylesheet" href="./resources/css/buyer.css">
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
    <div id="kakao-talk-channel-chat-button" style='display: none;'></div>
    <div class="main_body">
        <div class="bidding_title">
            <h1>구매 경매</h1>
        </div>
        <div class="bidding_notify">
            <ul>
                <li>
                    회원님께서 현재 구매 중인 경매 리스트입니다.
                <li>
                <li>
                    문의 사항은 고객센터에 문의해주시기 바랍니다.
                </li>
            </ul>
        </div>
        </div>
       <%if(product_list.size()==0) {%>
    
       <div class = "buyer--form">
       <h3>구매중인 상품이 없습니다</h3>
       </div>
       <%}else{%>
       
       
        <div class="buyer--form" id="product_list"></div>
      
      <div class="page_btns" id="product_page_list" align="center"></div>
   
       <%  } %>
          
    <!-- 배송 대기중 상품 -->
    <%if(delivery_before_list.size()!=0) {%>
       
    <div class="buyer--form" id = "delivery_before_list"></div>
    
    <div class="page_btns" id = "delivery_before_page" align="center"></div>
   <%} %>
    <!-- 배송중 상품 -->
   <%if(delivery_list.size()==0) {%>
    
       <div class = "buyer--form">
       <h3>배송중 경매가 없습니다</h3>
       </div>
       <%}else{ %>
   <div class="buyer--form" id = "delivery_complete_list"></div>
   
   <div class="page_btns" id = "delivery_complete_page_list" align="center"></div>
   <%} %>
    <!--구매 완료 -->
    <%if(dealcomplete_list.size()==0) {%>
    <div class="buyer--form">
            <h3>구매 완료된 경매가 없습니다</h3>
    </div>
    <%}else{ %>
    <%
       for(int i = 0; i < dealcomplete_list.size(); i++)
       {
          Product_kjVO dealcompletevo = (Product_kjVO)dealcomplete_list.get(i);
       
    %>
       
        <div class="buyer--form" id = "buyer_complete_list"></div>
        <div class="page_btns" id = "buyer_complete_page_list" align="center"></div>  
        
        <form name = "review<%=i %>" action = "./review.kj" method = "post">
        <input type="hidden" name="review_image" value="<%=dealcompletevo.getProduct_img_1() %>"> 
        <input type="hidden" name="trading_product_number" value="<%=dealcompletevo.getProduct_number() %>">    
        <div id="member_update_modal_email" class="modal">
                                      <div class="modal-content">
                                          <span class="close">&times;</span>
                                          <fieldset id="member_update">
                                              <legend>리뷰 작성</legend>
                                                     
                                                   <li>
                                                    <label>판매자&nbsp;&nbsp;:&nbsp;</label>
                                                    <input type = "hidden"  id = "review_id" name = "review_id" value = "<%=dealcompletevo.getProduct_id() %>">
                                                    <input type = "hidden"  id = "review_evaluator" name = "review_evaluator" value = "<%=dealcompletevo.getTrading_buyer_id() %>">
                                                    <input type = "hidden"  id = "review_subject" name = "review_subject" value = "<%=dealcompletevo.getProduct_subject() %>">                                       
                                                    <span><%=dealcompletevo.getProduct_id() %></span>             
                                                    <br>
                                                    <label>상품번호&nbsp;&nbsp;:&nbsp;</label>
                                                    <span><%=dealcompletevo.getProduct_number() %></span>
                                                    <br>
                                                    <label>상품명&nbsp;&nbsp;:&nbsp;</label>
                                                    <span><%=dealcompletevo.getProduct_subject() %></span>
                                                  <br>
                                                  <label>평점 주기&nbsp;&nbsp;:&nbsp;&nbsp;</label>
                                                  <input type = "checkbox" name = "review_evaluate" id = "review_evaluate" value = "매우 만족" onclick="oneCheckbox(this)">&nbsp;매우만족&nbsp;&nbsp;&nbsp;
                                                  <input type = "checkbox" name = "review_evaluate" id = "review_evaluate" value = "만족" onclick="oneCheckbox(this)">&nbsp;만족&nbsp;&nbsp;&nbsp;
                                                  <input type = "checkbox" name = "review_evaluate" id = "review_evaluate" value = "보통" onclick="oneCheckbox(this)">&nbsp;보통&nbsp;&nbsp;&nbsp;
                                                  <input type = "checkbox" name = "review_evaluate" id = "review_evaluate" value = "불만족" onclick="oneCheckbox(this)">&nbsp;불만족&nbsp;&nbsp;&nbsp;
                                                  <input type = "checkbox" name = "review_evaluate" id = "review_evaluate" value = "매우 불만족" onclick="oneCheckbox(this)">&nbsp;매우불만족&nbsp;&nbsp;&nbsp;
                                                  <br>
                                                  <br>
                                       			 <textarea id = "review_content" name = "review_content" style="width:100%;height:100px;border-style : solid;border-width : 1px; resize: none;"></textarea>
                                        		 <br>
                                       			 <a href="javascript:review<%=i %>.submit()" class="base_btn">리뷰 작성</a>&nbsp;&nbsp;

                                                 </li>   
                                    
                                       </fieldset>
                                   </div>
                               </div>   
                            </form>

    <%
       }}
    %>
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
                    <p>Copyright © eBay Korea LLC All rights reserved.</p>
                </li>
            </ul>
        </div>      
    </div>
    
    <!--  스크립트 영역  -->
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
//            $('ul.deadline-items__category a').removeClass('active');
//            $('.menu-box').removeClass('active');
//            $(this).prop('checked', true);
//            $('div#' + activeTab).addClass('active');
            })
        });
    </script>


   <script src="./resources/js/buyer.js"></script>
   <script>
   //구매중 경매 상품 page처리 ajax.by 계정
      function product_page(prod_page) {
         $("#product_list").empty();
         $("#product_page_list").empty();
         $.ajax({
            url: '/alltion/product_page.bo',
            type: 'POST',
            data: {
               page: prod_page
            },
            dataType: 'json',
            contentType : 'application/x-www-form-urlencoded; charset=utf-8',
            success: function(data) {
               let product_nowpage = prod_page;
               let product_maxpage = parseInt(parseFloat(data.length) + 0.9);
               $.each(data, function(index, item) {
                  var output = '';
                  if(index == prod_page - 1) {
                     output += '<form name = "trading_transaction" action = "./trading_transaction.kj" method = "post">';
                     output += '<h3>구매 중인 상품</h3>';
                     output += '<input type = "hidden" name = "product_number" id = "product_number" value = "' + item.product_number +'">';
                     output += '<div class="buyer--content">';
                     
                     output += '<ul class="buyer_form list">';
                     output += '<li>';
                     output += '<div class="buyer_form__list title">';
                     output += '<span>상품 번호</span>';
                     output += '</div>';
                     output += '<div class="buyer_form__list content">';
                     output += '<span>' + item.product_number + '</span>';
                     output += '</div>';
                     output += '</li>';
                     output += '</ul>';
                     
                     output += '<ul class="buyer_form list">';
                     output += '<li>';
                     output += '<div class="buyer_form__list title">';
                     output += '<span>상품명</span>';
                     output += '</div>';
                     output += '<div class="buyer_form__list content">';
                     output += '<span>' + item.product_subject + '</span>';
                     output += '</div>';
                     output += '</li>';
                     output += '</ul>';
                     
                     output += '<ul class="buyer_form list">';
                     output += '<li>';
                     output += '<div class="buyer_form__list title">';
                     output += '<span>구매 가격</span>';
                     output += '</div>';
                     output += '<div class="buyer_form__list content">';
                     output += '<span>' + item.trading_price + '</span>';
                     output += '</div>';
                     output += '</li>';
                     output += '</ul>';
                     
                     output += '<ul class="buyer_form list">';
                     output += '<li>';
                     output += '<div class="buyer_form__list title">';
                     output += '<span>입금 기한</span>';
                     output += '</div>';
                     output += '<div class="buyer_form__list content">';
                     output += '<span>' + item.trading_deposit_deadline + '</span>';
                     output += '</div>';
                     output += '</li>';
                     output += '</ul>';
                     
                     
                     
                     output += '<ul class="buyer_form list">';
                     output += '<li>';
                     output += '<div class="buyer_form__list title">';
                     output += '<span>거래 방식</span>';
                     output += '</div>';
                     output += '<div class="buyer_form__list content">';
                     output += '<span>거래 방식을 선택하지 않으면 거래를 진행할수 없습니다. </span>';
                     output += '<br>';
                     output += '<span>택배  </span>';
                     output += '&nbsp;&nbsp';
                     output += '<input type = "radio" name = "trading_transaction_method" id = "trading_transaction_method" value = "' + item.product_delivery + '">';
                     output += '&nbsp;&nbsp';
                     output += '<span>' + item.product_delivery + '</span>';
                     output += '&nbsp;&nbsp;'
                     output += '<br>';
                     output += '<span>직거래  </span>'
                     output += '&nbsp;&nbsp';
                     output += '<input type = "radio" name = "trading_transaction_method" id = "trading_transaction_method" value = "' + item.product_transaction_area + '">';
                     output += '<span>' + item.product_transaction_area + '</span>';
                     output += '&nbsp;&nbsp;&nbsp;&nbsp;';
                     output += '<a href = "javascript:trading_transaction.submit()">거래 방식</a>';
                     output += '<br>';
                     output += '<span>거래방식  </span>';
                     output += '&nbsp;&nbsp';
                     output += '<span>' + item.trading_transaction_method + '</span>';
                     output += '</div>';
                     output += '</li>';
                     output += '</ul>';
                     
                     output += '<ul class="buyer_form list">';
                     output += '<li>';
                     output += '<div class="buyer_form__list title">';
                     output += '<span>판매자</span>';
                     output += '</div>';
                     output += '<div class="buyer_form__list content">';
                     output += '<span>' + item.product_id + '</span>';
                     output += '</div>';
                     output += '</li>';
                     output += '</ul>';
                     output += '</div>';
                     if(item.trading_transaction_method==="불가능"||item.trading_transaction_method==="미정"){
                     	output += '<a class="base_btn no_select">입금 하기</a>';
                     }else{
                    	 output += '<a href = "./buyer_emoney.kj?product_number=' + item.product_number + '" class = "base_btn" >입금 하기</a>';
                     }
                  }
                  $("#product_list").append(output);
               });	
               var page_list = '';
               if(product_nowpage>1){
                  page_list += '<button onclick="product_page(' + (product_nowpage-1) + ')">&#171;</button>';
                 }else{
                    page_list += '<button>&#171;</button>';
                 }
                 for(let i=1;i<=product_maxpage;i++){
                    page_list += '<button onclick="product_page(' + i + ')">' + i + '</button>';
                 } 
                 if(product_nowpage<product_maxpage){
                    page_list += '<button onclick="product_page(' + (product_nowpage+1) + ')">&#187;</button>';
                   }else {
                      page_list += '<button>&#187;</button>';
                   }
                 $("#product_page_list").append(page_list);
            },
            error: function(error) {
               alert("ajax 안된다");
            }
         });
      }
      
      $(function() {
         product_page(1);
      });
      
      var click = true;
      $('.no_select').off("click").on('click',function(){
      	if(click){
    	  	click= !click;
      		alert('거래방식을 선택해주세요.'); 
      		
      		setTimeout(function(){
      			click=true;
      		},1000);
      	}else{
      		console.log("중복됨");
      	}
      });
      
   </script>
   
   <script>
   //배송 대기중 경매 상품 page처리 ajax.by 계정
      function delivery_before(before_page){
         $("#delivery_before_list").empty();
         $("#delivery_before_page").empty();
         $.ajax({
            url: '/alltion/before_page.bo',
            type: 'POST',
            data: {
               page: before_page
            },
            dataType: 'json',
            contentType : 'application/x-www-form-urlencoded; charset=utf-8',
            success: function(data) {
               let before_nowpage = before_page;
               let before_maxpage = parseInt(parseFloat(data.length) + 0.9);
               $.each(data, function(index, item) {
                  var output = '';
                  if(index == before_page - 1){
                     output += '<h3>배송 대기중 상품입니다.</h3>';
                     
                     output += '<div class="buyer--content">';
                     output += '<ul class="buyer_form list">';
                     output += '<li>';
                     output += '<div class="buyer_form__list title">';
                     output += '<span>상품 번호</span>';
                     output += '</div>';
                     output += '<div class="buyer_form__list content">';
                     output += '<span>' + item.product_number + '</span>';
                     output += '</div>';
                     output += '</li>';
                     output += '</ul>';
                     
                     output += '<ul class="buyer_form list">';
                     output += '<li>';
                     output += '<div class="buyer_form__list title">';
                     output += '<span>상품명</span>';
                     output += '</div>';
                     output += '<div class="buyer_form__list content">';
                     output += '<span>' + item.product_subject + '</span>';
                     output += '</div>';
                     output += '</li>';
                     output += '</ul>';
                     
                     output += '<ul class="buyer_form list">';
                     output += '<li>';
                     output += '<div class="buyer_form__list title">';
                     output += '<span>상품명</span>';
                     output += '</div>';
                     output += '<div class="buyer_form__list content">';
                     output += '<span>' + item.trading_price + '</span>';
                     output += '</div>';
                     output += '</li>';
                     output += '</ul>';
                     output += '</div>';
                     }
                     $("#delivery_before_list").append(output);
                     });
                  var delivery_list = '';
                  if(before_nowpage>1){
                     delivery_list += '<button onclick="delivery_before(' + (before_nowpage-1) + ')">&#171;</button>';
                    }else{
                       delivery_list += '<button>&#171;</button>';
                    }
                    for(let i=1;i<=before_maxpage;i++){
                       delivery_list += '<button onclick="delivery_before(' + i + ')">' + i + '</button>';
                    } 
                    if(before_nowpage<before_maxpage){
                       delivery_list += '<button onclick="delivery_before(' + (before_nowpage+1) + ')">&#187;</button>';
                      }else {
                         delivery_list += '<button>&#187;</button>';
                      }
                    $("#delivery_before_page").append(delivery_list);
               },
               error: function(error) {
                  alert("ajax 안된다");
               }
            });
         }
         
         $(function() {
            delivery_before(1);
         });
   </script>
      
   <script>
   //운송장번호 확인후 판매자 한태 입금 page처리 ajax.by 계정 
   function delivery_complete(complete_page){
      $("#delivery_complete_list").empty();
      $("#delivery_complete_page_list").empty();
      $.ajax({
         url: '/alltion/delivery_complete.bo',
         type: 'POST',
         data: {
            page: complete_page
         },
         dataType: 'json',
         contentType : 'application/x-www-form-urlencoded; charset=utf-8',
         success: function(data){
            let complete_nowpage = complete_page;
            let complete_maxpage =  parseInt(parseFloat(data.length) + 0.9);
            $.each(data, function(index, item){
               var output = '';
               if(index == complete_page - 1){
                  output += '<h3>배송중 경매 상품입니다.</h3>';
                  output += '<input type = "hidden" name = "product_id" id = "product_id" value = "'+ item.product_id +'">';
                  output += '<div class="buyer--content">';
                  
                  output += '<ul class="buyer_form list">';
                  output += '<li>';
                  output += '<div class="buyer_form__list title">';
                  output += '<span>상품 번호</span>';
                  output += '</div>';
                  output += '<div class="buyer_form__list content">';
                  output += '<span>' + item.product_number + '</span>';
                  output += '</div>';
                  output += '</li>';
                  output += '</ul>';
                  
                  output += '<ul class="buyer_form list">';
                  output += '<li>';
                  output += '<div class="buyer_form__list title">';
                  output += '<span>상품명</span>';
                  output += '</div>';
                  output += '<div class="buyer_form__list content">';
                  output += '<span>' + item.product_subject + '</span>';
                  output += '</div>';
                  output += '</li>';
                  output += '</ul>';
                  
                  output += '<ul class="buyer_form list">';
                  output += '<li>';
                  output += '<div class="buyer_form__list title">';
                  output += '<span>상품 번호</span>';
                  output += '</div>';
                  output += '<div class="buyer_form__list content">';
                  output += '<span>' + item.trading_waybill_number + '</span>';
                  output += '</div>';
                  output += '</li>';
                  output += '</ul>';
                  
                  output += '</div>';
                  output += '<a href = "./delivery.kj?product_number=' + item.product_number + '&product_id='+item.product_id+'" class = "base_btn" >거래 완료</a>';
                  }
                  $("#delivery_complete_list").append(output);
                  });
               var complete_list = '';
               if(complete_nowpage>1){
                  complete_list += '<button onclick="delivery_complete(' + (complete_nowpage-1) + ')">&#171;</button>';
                 }else{
                    complete_list += '<button>&#171;</button>';
                 }
                 for(let i=1;i<=complete_maxpage;i++){
                    complete_list += '<button onclick="delivery_complete(' + i + ')">' + i + '</button>';
                 } 
                 if(complete_nowpage<complete_maxpage){
                    complete_list += '<button onclick="delivery_complete(' + (complete_nowpage+1) + ')">&#187;</button>';
                   }else {
                      complete_list += '<button>&#187;</button>';
                   }
                 $("#delivery_complete_page_list").append(complete_list);
            },
            error: function(error) {
               alert("ajax 안된다");
            }
         });
      }
      
      $(function() {
         delivery_complete(1);
      });

   </script>
   
   <script>
   //최종 구매 완료후 리뷰작성 page처리 ajax.by계정
      function buyer_complete(complete_page_buyer){
         $("#buyer_complete_list").empty();
         $("#buyer_complete_page_list").empty();
         $.ajax({
            url: '/alltion/complete_buyer.bo',
            type: 'POST',
            data: {
               page: complete_page_buyer
            },
            dataType: 'json',
            contentType : 'application/x-www-form-urlencoded; charset=utf-8',
            success: function(data){
               let buyer_nowpage = complete_page_buyer;
               let buyer_maxpage = parseInt(parseFloat(data.length) + 0.9);
               $.each(data, function(index, item){
                  var output = '';
                  if(index == complete_page_buyer - 1){
                     
                     output += '<h3>구매 완료</h3>';
                     output += '<div class="buyer--content">';
                     
                     output += '<ul class="buyer_form list">';
                     output += '<li>';
                     output += '<div class="buyer_form__list title">';
                     output += '<span>상품 번호</span>';
                     output += '</div>';
                     output += '<div class="buyer_form__list content">';
                     output += '<span>' + item.product_number + '</span>';
                     output += '</div>';
                     output += '</li>';
                     output += '</ul>';
                     
                     output += '<ul class="buyer_form list">';
                     output += '<li>';
                     output += '<div class="buyer_form__list title">';
                     output += '<span>상품명</span>';
                     output += '</div>';
                     output += '<div class="buyer_form__list content">';
                     output += '<span>' + item.product_subject + '</span>';
                     output += '</div>';
                     output += '</li>';
                     output += '</ul>';
                     
                     output += '<ul class="buyer_form list">';
                     output += '<li>';
                     output += '<div class="buyer_form__list title">';
                     output += '<span>구매가격</span>';
                     output += '</div>';
                     output += '<div class="buyer_form__list content">';
                     output += '<span>' + item.trading_price + '</span>';
                     output += '</div>';
                     output += '</li>';
                     output += '</ul>';
                     
                     output += '<ul class="buyer_form list">';
                     output += '<li>';
                     output += '<div class="buyer_form__list title">';
                     output += '<span>구매 날짜</span>';
                     output += '</div>';
                     output += '<div class="buyer_form__list content">';
                     output += '<span>' + item.trading_purchase_date + '</span>';
                     output += '</div>';
                     output += '</li>';
                     output += '</ul>';
                     
                     output += '<ul class="buyer_form list">';
                     output += '<li>';
                     output += '<div class="buyer_form__list title">';
                     output += '<span>판매자</span>';
                     output += '</div>';
                     output += '<div class="buyer_form__list content">';
                     output += '<span>' + item.product_id + '</span>';
                     output += '</div>';
                     output += '</li>';
                     output += '</ul>';
                     
                     output += '</div>';
                     if(item.trading_progress==="거래완료"){
                     	output += '<input type = "button" id="modal_product_' + (index+1) + '" onclick = "modal_display_email('+(index)+')" value = "리뷰 작성" class="base_btn">';
                     }
                  }
                     $("#buyer_complete_list").append(output);
                  });
                  var buyer_list = '';
                  if(buyer_nowpage>1){
                     buyer_list += '<button onclick="buyer_complete(' + (buyer_nowpage-1) + ')">&#171;</button>';
                    }else{
                       buyer_list += '<button>&#171;</button>';
                    }
                    for(let i=1;i<=buyer_maxpage;i++){
                       buyer_list += '<button onclick="buyer_complete(' + i + ')">' + i + '</button>';
                    } 
                    if(buyer_nowpage<buyer_maxpage){
                       buyer_list += '<button onclick="buyer_complete(' + (buyer_nowpage+1) + ')">&#187;</button>';
                      }else {
                         buyer_list += '<button>&#187;</button>';
                      }
                    $("#buyer_complete_page_list").append(buyer_list);
               },
               error: function(error) {
                  alert("ajax 안된다");
               }
            });
         }
         $(function() {
            buyer_complete(1);
            
            
         });
         
   </script>
</body>
</html>