<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.alltion.login.MemberVO" %>
<%
	String id = (String)session.getAttribute("userId");	
%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/main_style.css?after">
    <link rel="stylesheet" href="./resources/css/mypage.css">
    <link href="https://fonts.googleapis.com/css2?
    family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>All-tion - 마이 페이지</title>
</head>
<body>
    <!-- 모든 페이지 공통 영역 by 하나  -->
    
    <div class="header">
        <jsp:include page="../header/main_header.jsp"></jsp:include>
    </div>

    <!-- !! 메인 페이지 내용(지워서 사용함) !! start -->
    <!--  마이 페이지 선택  -->
    <div class="myPage__main">
        <h3 class="myPage__title">마이 페이지</h3>
        <ul class="myPage__category">
            <li>
                <a href="./memberinfo.kj">
                    <span class="material-icons">recent_actors</span><br>
                    <span class="myPage__menu">회원 정보</span>
                    
                </a>
            </li>
            <li>
                <a href="./pay.ms">
                    <span class="material-icons">credit_card</span><br>
                    <span class="myPage__menu">e-머니</span>
                </a>
            </li>
            <li>
                <a href="creditScore.hn">
                    <span class="material-icons">money</span><br>
                    <span class="myPage__menu">신용 등급</span>
                </a>
            </li>
            <li>
                <a href="./review_view.hs?page=1">
                    <span class="material-icons">forum</span><br>
                    <span class="myPage__menu">리뷰 보기</span>
                </a>
            </li>
            <li>
                <a href="./buyer.kj">
                    <span class="material-icons">receipt</span><br>
                    <span class="myPage__menu">구매 내역</span>
                </a>
            </li>
            <li>
                <a href="./seller.kj">
                    <span class="material-icons">list</span><br>
                    <span class="myPage__menu">판매 내역</span>
                </a>
            </li>
            <li>
                <a href="./bidding.hs?page=1">
                    <span class="material-icons">poll</span><br>
                    <span class="myPage__menu">참여 중 경매</span>
                </a>
            </li>
            <li>
                <a href="./selling.hs?page=1">
                    <span class="material-icons">done_all</span><br>
                    <span class="myPage__menu">판매 중 경매</span>
                </a>
            </li>
        </ul>
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