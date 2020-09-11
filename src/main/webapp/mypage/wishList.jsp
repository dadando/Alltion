<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/main_style.css?after">
    <link rel="stylesheet" href="resources/css/wishList.css">
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
    <!-- 찜목록 시작 -->

    <section class="wishList">

        <!-- 타이틀 -->
        <div class="wishList--title">
            <h1>찜목록</h1>
        </div>

        <!-- 내용 -->
        <div class="wishList--container">
            <ul class="wishList--noticeList">
                <li>
                    회원님께서 관심물품으로 직접 등록하신 물품의 리스트입니다.
                </li>
                <li>
                    물품정보가 변경되었을 수 있으니 입찰하시기전에 반드시 경매정보 및 물품정보를 재확인하시기 바랍니다.
                </li>
                <li>
                    해당 자료는 최대 10일간 저장됩니다.
                </li>
            </ul>

            <div class="wishList--caption">
                <p><span class="wishList--conut">찜목록</span>에 대해서 모두 <span class="wishList--conut"></span>개가 검색되었습니다</p>
                <button class="wishList--changeEndDateFormBtn" type="button">남은시간 표기</button>
            </div>

            <div class="wishList--tableWarp">
                <div class="wishList--columnTitle">
                    <div class="wishList--deleteCheck">
                        <input class="wishList--deleteCheck__allDeleteCheck" type="checkbox" onclick="checkAll()">
                    </div>
                    <div class="wishList--info">
                        <p>상품정보</p>
                    </div>
                    <div class="wishList--currentPrice">
                        <p>현재가</p>
                    </div>
                    <div class="wishList--delivery">
                        <p>배송</p>
                    </div>
                    <div class="wishList--endDate">
                        <p>마감시간</p>
                    </div>
                </div>
    
                <div class="wishList--contentsWarp"></div>
                
                <button class="wishList--delete" type="button" onclick="wishListDelete()">선택상품 삭제</button>
                
                <div class="wishList--pageWarp"></div>
            </div>
            
        </div>

    </section>

    <!-- 찜목록 끝 -->

    <!-- !! 기재해야 될 코드 여기에서부터 입력 end -->
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
    <script src="resources/js/wishList.js"></script>
</body>

</html>