<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.alltion.creditScore.SaleCreditScoreVO" %>
<%@ page import = "com.spring.alltion.creditScore.PurchaseCreditScoreVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    SaleCreditScoreVO saleCreditVO = (SaleCreditScoreVO)request.getAttribute("saleCreditVO");
    PurchaseCreditScoreVO purchaseCreditVO  = (PurchaseCreditScoreVO)request.getAttribute("purchaseCreditVO");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/main_style.css?after">
    <link rel="stylesheet" href="./resources/css/creditScore.css?after">
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
    <div class="credit_score_form">
    	<h2>신용도</h2>
        <ul class="member_credit_score">
            <li class="sale_credit_score">
                <h3>판매 신용도</h3>
                <ul class="sale_credit_score-info"> 
                    <li>
                        <div class="sale_credit_score-form title">
                            <label>정상 거래</label>
                        </div>
                        <div class="sale_credit_score-form content">
                            <span><%=saleCreditVO.getSale_normal() %> 건</span>
                            <!-- 
                            <a href="saleNormalCount.hn">정상 거래</a>
                             -->
                        </div>
                    </li>
                    <li>
                        <div class="sale_credit_score-form title">
                            <label>판매 거부</label>
                        </div>
                        <div class="sale_credit_score-form content">
                            <span><%=saleCreditVO.getSale_denial() %> 건</span>
                            <!-- 
                            <a href="saleDenialCount.hn">판매 거부</a>
                             -->
                        </div>
                    </li>
                    <li>
                        <div class="sale_credit_score-form title">
                            <label>미배송</label>
                        </div>
                        <div class="sale_credit_score-form content">
                            <span><%=saleCreditVO.getSale_undelivered() %> 건</span>
                            <!-- 
                            <a href="saleUndeliveredCount.hn">미배송</a>
                             -->
                        </div>
                    </li>

                    <li>
                        <div class="sale_credit_score-form title">
                            <label>반품</label>
                        </div>
                        <div class="sale_credit_score-form content">
                            <span><%=saleCreditVO.getSale_return() %> 건</span>
                            <!-- 
                            <a href="saleReturnCount.hn">반품</a>
                             -->
                        </div>
                    </li>
                    <li>
                        <div class="sale_credit_score-form title">
                            <label>판매 성사율</label>
                        </div>
                        <div class="sale_credit_score-form content">
                            <span><%=saleCreditVO.getSale_success_rate() %> %</span>
                        </div>
                    </li>
                    <li>
                        <div class="sale_credit_score-form title">
                            <label>판매 신용도</label>
                        </div>
                        <div class="sale_credit_score-form content">
                            <span><%=saleCreditVO.getSale_credit_score() %> 점</span>
                        </div>
                    </li>
                </ul>
            </li>
            <li class="purchase_credit_score">
                <h3>구매 신용도</h3>
                <ul class="purchase_credit_score-info">
                    <li>
                        <div class="purchase_credit_score-form title">
                            <label>정상 거래</label>
                        </div>
                        <div class="purchase_credit_score-form content">
                            <span><%=purchaseCreditVO.getPurchase_normal() %> 건</span>
                            <!-- 
                            <a href="purchaseNormalCount.hn">정상 거래</a>
                             -->
                        </div>
                    </li>
                    <li>
                        <div class="purchase_credit_score-form title">
                            <label>구매 거부</label>
                        </div>
                        <div class="purchase_credit_score-form content">
                            <span><%=purchaseCreditVO.getPurchase_denial() %> 건</span>
                            <!-- 
                            <a href="purchaseDenialCount.hn">구매 거부</a>
                             -->
                        </div>
                    </li>
                    <li>
                        <div class="purchase_credit_score-form title">
                            <label>미입금</label>
                        </div>
                        <div class="purchase_credit_score-form content">
                            <span><%=purchaseCreditVO.getPurchase_undelivered() %> 건</span>
                            <!-- 
                            <a href="purchaseUndeliveredCount.hn">미입금</a>
                             -->
                        </div>
                    </li>
                    <li>
                        <div class="purchase_credit_score-form title">
                            <label>반품</label>
                        </div>
                        <div class="purchase_credit_score-form content">
                            <span><%=purchaseCreditVO.getPurchase_return() %> 건</span>
                            <!-- 
                            <a href="purchaseReturnCount.hn">반품</a>
                             -->
                        </div>
                    </li>
                    <li>
                        <div class="purchase_credit_score-form title">
                            <label>판매 성사율</label>
                        </div>
                        <div class="purchase_credit_score-form content">
                            <span><%=purchaseCreditVO.getPurchase_success_rate() %> %</span>
                        </div>
                    </li>
                    <li>
                        <div class="purchase_credit_score-form title">
                            <label>판매 신용도</label>
                        </div>
                        <div class="purchase_credit_score-form content">
                            <span><%=purchaseCreditVO.getPurchase_credit_score() %> 점</span>
                        </div>
                    </li>
                </ul>
            </li>
        </ul>
        <div class="credit_score-btn">
            <a class="back_to_myPage" href="./mypage.kj">뒤로 가기</a>
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
</body>
</html>