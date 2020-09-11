<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	int product_number  = (int)request.getAttribute("product_number");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="./resources/css/main_style.css">
	<link rel="stylesheet" href="./resources/css/member_login.css">
    <link href="https://fonts.googleapis.com/css2?
    family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>All-tion</title>
</head>
<!-- 로그인 화면시 아이디에 포커스 -->
<body onload="document.getElementById('member_id').focus();">

    <!-- 모든 페이지 공통 영역 by 하나  -->
    
    <div class="header">
        <jsp:include page="../header/main_header.jsp"></jsp:include>
    </div>

    <!-- !! 메인 페이지 내용(지워서 사용함) !! start -->
	<form name = "login" action = "./login1.kj" method = "post">   
	<input type="hidden" name="product_number" value="<%=product_number %>">
    <!-- 로그인 영역 by 계정 -->
	<div class="login">
        <div class="login-screen">
            <div class="app-title">
                <h2>로그인</h2>
            </div>

            <div class="login-form">
                <div class="control-group id">
                    <label class="login-field-icon fui-user" for="login-name">아이디</label><br>
                    <input type="text" name = "member_id" class="login-field" id="member_id"  placeholder="아이디를 입력해 주세요" >
                </div>

                <div class="control-group pw">
                    <label class="login-field-icon fui-lock" for="login-pass">비밀번호</label><br>
                    <input type="password" name = "member_password" class="login-field" id="member_password"  placeholder="비밀번호를 입력해 주세요" >
                </div>

                <a class="btn btn-primary btn-large btn-block" onclick = "check_input()">로그인</a>
                <p>아직 회원이 아니신가요?&nbsp;
                    <a class="login-link" href = "./naverjoin.kj">회원가입 바로 가기</a>
                </p>
                
                
            </div>
        </div>
    </div>
	
</form>    
    
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
    <script src="./resources/js/login.js"></script>

</body>
</html>
