<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.spring.alltion.login.MemberVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberVO membervo = (MemberVO)request.getAttribute("membervo");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./resources/css/main_style.css?after">
    <link rel="stylesheet" href="./resources/css/member_update.css">
    <link href="https://fonts.googleapis.com/css2?
    family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>Alltion 회원 정보 수정</title>
    
<!-- 주소 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
    <!-- 모든 페이지 공통 영역 by 하나  -->
    
    <div class="header">
        <jsp:include page="../header/main_header.jsp"></jsp:include>
    </div>

    <!-- !! 메인 페이지 내용(지워서 사용함) !! start -->
    <!-- 등급 페이지 by 하나 -->
    <!-- 회원 정보 수정 -->
        <div class="member_update--form">
            <h3>회원 정보 수정</h3>
            <div class="member_update--content">
                <ul class="update_form list">
                    <li>
                        <div class="update_form__list title">
                            <span>아이디</span>
                        </div>
                        <div class="update_form__list content">
                            <span><%=membervo.getMember_id() %></span>
                        </div>
                    </li>
                    <li>
                        <div class="update_form__list title">
                            <span>이름</span>
                        </div>
                        <div class="update_form__list content">
                            <span><%=membervo.getMember_name() %></span>
                        </div>
                    </li>
                    <form name = "updatePassword" action="./updatePassword.kj" method="post">
                    <ul>
                    <li>
                        <div class="update_form__list title">
                            <span>비밀번호 변경</span>
                        </div>
                        <div class="update_form__list content">
                            <input type="password" id="member_password" name = "member_password" class= "int" placeholder="변경할 비밀번호를 입력해주세요"><br>
                            <input type="password" id="member_password2"  name = "member_password2" class = "int" onchange="checkpassword()" placeholder="변경된 비밀번호를 재입력해주세요">
                            <span id="alert-success1" style="display: none; color: #1ec700;">비밀번호가 일치합니다.</span>
    						<span id="alert-danger1" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
                            <a href = "javascript:updatePassword.submit()" class="update_btn__submit" style="font-size:12px;background-color:#EFEFEF;margin-left:8px;">비밀번호 변경</a>
                        </div>
                    </li>  
                    </ul>
                    </form>                  
                    <form name="updateEmail" action="./updateEmail.kj" method="post">
                    <ul>
                    <li>
                        <div class="update_form__list title">
                            <span>이메일</span>
                            
                        </div>
                        <div class="update_form__list content">
                            <span><%=membervo.getEmail() %></span>&nbsp;&nbsp;&nbsp;
                            	<input type ="button" onclick = "modal_display_email()"  value = "이메일 변경" style="font-size:12px;cursor:pointer;">                         
                            		<div id="member_update_modal_email" class="modal">
                               		 <div class="modal-content">
                                   		 <span class="close">&times;</span>
                                    		<fieldset id="member_update">
                                       		 <legend>이메일 변경</legend>
                                        			<br>	
                                            		<li>
                                                	 <label>이메일&nbsp;&nbsp;:&nbsp;</label>
                                                  <input type="text" class = "input_border" id="email"  name ="email" style="ime-mode:inactive; width:356px;" placeholder="변경할 이메일을 입력하세요." required >     
				                                  <a href="javascript:updateEmail.submit()" class="update_btn__submit">이메일 변경</a>&nbsp;&nbsp;
                                            </li>   
                                        
                                   </fieldset>
                                </div>
                            </div>	
            				</div> 
            			</li>
            			</ul>
            			</form>	
            			<form name = "updatePhone" action = "./updatePhone.kj" method = "post">
                    	<ul>
                    	<li>                   	
                        <div class="update_form__list title">
                            <span>휴대 전화 번호</span>
                            
                        </div>
                        <div class="update_form__list content">
                           <span><%=membervo.getMember_phone().substring(0,3) %>-<%=membervo.getMember_phone().substring(3,7) %>-<%=membervo.getMember_phone().substring(7) %></span>&nbsp;&nbsp;&nbsp;                
                           <input type ="button" onclick = "modal_display_phone()" value = "휴대전화 변경" style="font-size:12px;cursor:pointer;">
                           <span style="font-size:12px;">&nbsp;&nbsp;'-' 없이 입력해 주세요</span>
                           <div id="member_update_modal_phone" class="modal">
                           	<div class="modal-content">
                                   		 <span class="close">&times;</span>
                                    		<fieldset id="member_update">
                                       		 <legend>휴대전화 변경</legend>
                                        			<br>
                                            		<li>
                                                	 <label>휴대전화&nbsp;&nbsp;:&nbsp;</label>
                                                  <input type="text" class = "input_border"  id="member_phone"  name ="member_phone"  placeholder="휴대전화를 입력하세요." maxlength = "11" style="ime-mode:inactive; width:356px;">     
				                                  <a href="javascript:updatePhone.submit()" class="update_btn__submit">휴대전화 변경</a>&nbsp;&nbsp;
                                            </li>   
                                        
                                   </fieldset>
                                </div>
                       		 </div>         
                        </div>               
                    </li>
                    </ul>
                    </form>
                    <form name = "updateAddress" action = "./updateAddress.kj" method = "post">
                    <ul>
                    <li>
                        <div class="update_form__list title">
                            <p class = "join_title" text-align = "left">주소</span>
                        </div>
                        <div class="update_form__list content">
                        	<!-- jstl바뀐점 주소있을때와 주소없을떄 -by계정 -->
                        	<c:choose>

							<c:when test ="${sample4_postcode != null}">
                            <span><%=membervo.getSample4_postcode() %></span>
                            <span><%=membervo.getSample4_roadAddress() %>&nbsp;
								  <%=membervo.getSample4_jibunAddress() %>&nbsp;                            
	                              <%=membervo.getSample4_detailAddress() %>&nbsp;&nbsp;
                            </span>
                            </c:when>
                            <c:otherwise>
                            <span><%=membervo.getSample4_postcode() %></span>
                            <span><%=membervo.getSample4_roadAddress() %>&nbsp;
								  <%=membervo.getSample4_jibunAddress() %>&nbsp;                            
	                              <%=membervo.getSample4_detailAddress() %>&nbsp;&nbsp;
                            </span>
                            </c:otherwise>
                            </c:choose>
                            
                            <input type ="button" onclick = "modal_display_address()" value = "주소 변경" style="font-size:12px;cursor:pointer;" > 
                            <div id="member_update_modal_address" class="modal">
                            	<div class="modal-content">
                                <span class="close">&times;</span>
                                <fieldset id="member_update">
                                <legend>주소 변경</legend>
                                <br>
                                
                                <li>
                                <label>우편 번호</label>
                                <input type="text" id="sample4_postcode" class = "input_border" name="sample4_postcode" placeholder="우편번호">                             
                                <label>도로명 주소</label>
                                <input type="text" class = "input_border" id="sample4_roadAddress" name = "sample4_roadAddress" placeholder="도로명 주소">                                
                                <label>지번 주소</label>
                                <input type="text" class = "input_border" id="sample4_jibunAddress" name = "sample4_jibunAddress" placeholder="지번 주소">                               
                                <label>상세 주소</label>
                                <input type="text" class = "input_border" id="sample4_detailAddress" name = "sample4_detailAddress" placeholder="상세 주소를 입력해 주세요">				                                
                                <input type="button" class = "base_btn address" onclick="sample4_execDaumPostcode()" value="검색">&nbsp;&nbsp;&nbsp;&nbsp;
                                <span id="guide" style="color:#999;display:none;"></span>
                                <a href="javascript:updateAddress.submit()" class="update_btn__submit" >주소 변경</a>&nbsp;&nbsp;
                                </li>

                                   </fieldset>
                                </div>
                       		 </div>         
                        </div>               
                    </li>
                    </ul>
            </form>
        </div>
    	<!--회원 정보 삭제  -->  
        <form name = "member_delete" action = "./delete.kj" method = "post">
        <div class="member_update--form">
            <h3>회원 정보 탈퇴</h3>
            <div class="member_update--content">
                <ul class="update_form list">
                    <li>
                        <div class="update_form__list title">
                            <span>회원 정보 탈퇴</span>
                        </div>
                        <div class="update_form__list content">
                        <h4>회원 정보 삭제시 다시는 회원정보를 불러올수 없습니다</h4>
                            <span><input type ="button" onclick = "modal_display_delete_member()" value = "회원정보 삭제" style="font-size:12px;cursor:pointer;">
                            <div id="member_update_modal_delete_member" class="modal">
                            	<div class="modal-content">
                                <span class="close">&times;</span>
                                <fieldset id="member_update">
                                <legend>회원 탈퇴</legend>
                                <ul>
                                <li>
                                <label>회원 탈퇴 : &nbsp;</label>
                                
                                <span>회원 탈퇴시 무슨 불이행이 있어도 책임질수 없습니다.</span>&nbsp;&nbsp;&nbsp;
                                <br>
                                <button type = "submit">회원 삭제</button>
                                </li>
                                </ul>                                
                                </fieldset>
                                </div>
                                </div>
                            </span>
                        </div>
                    </li>
                    </ul>
                    </div>
                    </div>
                </div>
            	</form>
 
            	
            	<div class="member_update--btn">
               	 <button class="update_btn__back" onclick="history.back()">뒤로 가기</button>
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
    <script src="./resources/js/update.js"></script>
</body>
</html>