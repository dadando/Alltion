<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.alltion.test.Product_kjVO" %>
<%@ page import = "java.util.*" %>
<%	
	Product_kjVO Product_kjvo = (Product_kjVO)request.getAttribute("Product_kjvo");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/style.css?after">
    <link rel="stylesheet" href="./resources/css/waybill.css">
    <link href="https://fonts.googleapis.com/css2?
    family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>All-tion</title>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
    <!-- 모든 페이지 공통 영역 by 하나  -->
    
    <div class="header">
        <jsp:include page="../header/header.jsp"></jsp:include>
    </div>

    <!-- !! 메인 페이지 내용(지워서 사용함) !! start -->
    <!-- 운송장번호by.계정 -->
    	
    <div class="waybill_update--form">
            <h3>운송장 번호</h3>
            <div class="waybill_update--content">
                <ul class="update_form list">
                    <li>
                        <div class="update_form__list title">
                            <span>상품 번호</span>
                        </div>
                        <div class="update_form__list content">
                        <span><%=Product_kjvo.getTrading_product_number() %></span>
                        
                        </div>    
                    </li>
                </ul>
                <form name = "insert_waybill" action = "./insert_waybill.kj" method = "post"> 
                <input type = "hidden" id = "trading_progress" name = "trading_progress" value = "<%=Product_kjvo.getTrading_progress() %>">
                <input type = "hidden" id = "trading_product_number" name = "trading_product_number" value="<%=Product_kjvo.getTrading_product_number() %>">
                <ul class="update_form list">
                    <li>
                        <div class="update_form__list title">
                            <span>운송장번호</span>
                        </div>
                        <div class="update_form__list content">
                            <span><input type = "text" id = "trading_waybill_number" name = "trading_waybill_number" placeholder="운송장 번호를 입력해 주세요" required></span>
                            <br>
                            <br>                               
                            <h5>운송장 번호 입력후</h5>    
                            <h5>구매자가 구매완료 버튼을 누를시 이머니가 입금됩니다</h5>                                        
                        </div>
                    </li>  
                    </ul>                    
                    </div>
                    <div class="waybill_update--btn">
       				<a href = "javascript:insert_waybill.submit()"  class ="base_btn">운송장 번호 입력</a>    
					</div> 
					 </form>                
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
    <script src="./resources/js/buyer_emoney.js"></script>
</body>
</html>