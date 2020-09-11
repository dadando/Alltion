<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/main_style.css?after">
    <link rel="stylesheet" href="./resources/css/member_joinform.css">
    <link href="https://fonts.googleapis.com/css2?
    family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>All-tion</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <!-- 주소 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<body>
    <!-- 모든 페이지 공통 영역 by 하나  -->
    
    <div class="header">
        <jsp:include page="../header/main_header.jsp"></jsp:include>
    </div>

    <!-- !! 메인 페이지 내용(지워서 사용함) !! start -->
<form name="joinform" action="./joinprocess.kj" method="post" onsubmit="return validate();">

    <div class = "joinWrap">
        <h2>All-tion 통합 회원 가입</h2>
        <div class = "row_group">
            <div class = "join_row">
                <h3 class = "join_title_title" text-align = "left">
                    &lt;필수 입력 사항&gt;
                </h3>    
                <div class = "join_row">
                <label class = "join_title" text-align = "left">이름</label><br>
                <input type = "text" id = "member_name" name = "member_name" class = "int" maxlength = "5" placeholder="이름">
            	</div>            
                <label class = "join_title" text-align = "left">아이디</label>
                <span id="alert-danger" style="display: none; color: #1ec700; font-weight: bold; ">*&nbsp;사용가능 아이디</span>   			
    			<span id="alert-success" style="display: none; color: #d92742;">일치하는 아이디가 존재합니다.</span>
                <input type = "text" id = "member_id" name = "member_id"  class = "int" maxlength = "20" placeholder="최소6~최대20, 숫자와알파벳만 사용해 주세요">
                <input type = "button" class = "base_btn1" value = "중복 확인" onclick="usercheck()">
                <input type = "hidden" id = "purchase_id" name = "purchase_id">
                <input type = "hidden" id = "sale_id" name = "sale_id" >
            </div>
            	
            <div class = "join_row">
                <label class = "join_title" text-align = "left">비밀번호</label>
                <input type = "password" id = "member_password" name = "member_password" class = "int" maxlength = "20" placeholder="최소6~최대20, 숫자와 알파벳만 사용해 주세요">
            </div>
            <div class = "join_row">
                <label class = "join_title" text-align = "left">비밀번호 재확인</label>
                <input type = "password" id = "member_password2" name = "member_password2" class = "int" maxlength = "20" placeholder="최소6~최대20, 숫자와 알파벳만 사용해 주세요"
                onchange="checkpassword()">
            	<span id="alert-success1" style="display: none; color: #1ec700;">비밀번호가 일치합니다.</span>
    			<span id="alert-danger1" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
            </div>
			
            <div class = "join_row">
                <label class = "join_title" text-align = "left">이메일</label>
            <!-- jstl 바뀐점 일반 회원가입, 네이버 회원가입 이메일 -by계정 -->
            <c:choose>

			<c:when test="${email != null}"><!-- naver 연동시 email 값이 있을때 -->    
                <div>
                <input type="hidden" class = "int" id="email"  name ="email" style="ime-mode:inactive; width:356px;" placeholder="이메일 아이디" value = "${email}">     
            	${email}
            	</div>
            </c:when>	
            <c:otherwise><!-- 일반 회원가입 -->	
            <div>
                    <input type="text" class = "int" id="email1" name="email1" size="35" style="ime-mode:inactive" placeholder="이메일 아이디">
                    <span>&nbsp;@&nbsp;</span>
                    <select name="email2" id = "email2">
                        <option value="">메일선택</option>
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="gmail.com">gmail.com</option>
                    </select>
                </div>
                 
            </c:otherwise>
            </c:choose>	
            </div>  
            <div class = "join_row">
                <label class = "join_title" text-align = "left">휴대 전화 번호</label>
                <input type = "text" id = "member_phone" name = "member_phone" class = "int" maxlength = "11" placeholder="'-' 없이 입력해 주세요">
            </div>
        </div>    
        <div class = "row_group">
            <div class = "join_row" style="margin-bottom: 0;">
                <h3 class = "join_title_title" text-align = "left">
                    &lt;추가 입력 사항&gt;
                </h3>
                <label class = "join_title" text-align = "left">주소</label><br>
                <input type="text" id="sample4_postcode" class = "int" name="sample4_postcode" placeholder="우편번호">
                <input type="button" class = "base_btn address" onclick="sample4_execDaumPostcode()" value="검색">
            </div>
        </div>
        <div class = "row_group">
            <div class = "join_row">
            <input type="text" class="int" id="sample4_roadAddress" name = "sample4_roadAddress" placeholder="도로명 주소">
            <input type="text" class="int" id="sample4_jibunAddress" name = "sample4_jibunAddress" placeholder="지번 주소">
            <span id="guide" style="color:#999;display:none;"></span>
            <input type="text" class="int" id="sample4_detailAddress" name = "sample4_detailAddress" placeholder="상세 주소를 입력해 주세요">
            </div>
        </div>
        <h3>
            <a href ="javascript:joinform.submit()" class = "base_btn submit" >회원가입</a> 
            <a href ="javascript:joinform.reset()" class = "base_btn cancel">다시작성</a>                         
        </h3> 
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
	<script src="./resources/js/joinform.js"></script>
</form>
</body>
</html>