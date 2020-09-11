<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.spring.alltion.pay.*" %>
<%
	String buyer = (String)request.getAttribute("buyer_name");
	String amount = (String)request.getAttribute("amount");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" href="./resources/css/main_style.css?after">
	<link rel="stylesheet" href="<c:url value="/resources/css/pay.css" />">
    <link href="https://fonts.googleapis.com/css2?
    family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>All-tion</title>
    <style>
    </style>
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script>

    function test1(value) {
        $('.text2').val(value);
    }

    </script>
    <script>
    
    function getFormatDate(date) {
        var year = date.getFullYear(); //yyyy
        var month = (1 + date.getMonth()); //M
        month = month >= 10 ? month : '0' + month; //month 두자리로 저장
        var day = date.getDate(); //d
        day = day >= 10 ? day : '0' + day; //day 두자리로 저장
        return year + '' + month + '' + day; //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
    }

    var date = new Date();
    date = getFormatDate(date);
        
    </script>
</head>

<body>
    <!-- 모든 페이지 공통 영역 by 하나  -->

    <div class="header" id="div1">
        <jsp:include page="../header/main_header.jsp"></jsp:include>
    </div>
    <!-- !! 메인 페이지 내용(지워서 사용함) !! start -->
    <div class="main_body">
        <div class="charging_title">
            <h1>E머니 충전/환불</h1>
        </div>
        <div class="pay_notify">
            <ul>
                <li>
         			All-tion에서 이루어지는 모든 현금 결제는 적립되어 있는 사이버머니에서 차감됩니다.
                </li>
                <li>
                </li>
                <li>
			                  회원님께서 일정금액을 미리 사이버머니로 적립해 놓으셔야 응찰권 및 경매물품의
			                  낙찰금액에 대하여 현금 결제가 가능해 집니다.
                </li>
                <li>
                </li>
                <li>
			                  사이버머니가 충분하게 적립되어 있는 상태에서 즉시
			                  경매낙찰을 이용하실 경우, 판매자와의 직거래여부 선택에 따라 빠른 진행이 가능하십니다.
                </li>

            </ul>
        </div>
        <div class="paybox">
            <ul class="tablist" role="tablist">
                <li class="tab" role="tab"><a href="#panel1" onclick="return false;">충 전</a></li>
                <li class="tab" role="tab"><a href="#panel2" onclick="return false;">환 불</a></li>
                <li class="tab-menu">
                    <div class="line"></div>
                    <div class="line"></div>
                </li>
            </ul>
            <div class="tabpanel" id="panel1" role="tabpanel">
                <div class="chargePageBox">
                        <form id="chargeform" method="post" action="./charge.ms">
                            <!-- <input type="hidden" name="merchant_uid"> -->
                            <!-- <input type="hidden" name="id" value="id넣어야한다......"> -->
                            <table class="tb1_money">
                                <colgroup>
                                    <col width="15%">
                                    <col width="35%">
                                    <col width="15%">
                                    <col width="35%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>아이디</th>
                                        <td><input class="text1" type="text" name="buyer_name" title="입금인" size="20" value="${userId}"></td>
                                        <th>현재 사이버 머니</th>
                                        <td>￦ ${currentMoney}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="paylist" href="goPaylist.ms">충전내역 조회</a></td>
                                    </tr>
                                    <tr>
                                        <th>충전할 금액(원)</th>
                                        <td colspan="3">
                                            <div class="won moneyAdd">
                                                <input class="text2" type="text" name="amount" title="입금금액" value size="20"> 원&nbsp;&nbsp; <a href="#" rel="10000" onclick="test1(10000)"> <img src="data:image/gif;base64,R0lGODlhHQATANUAAPn5+aCgoGpqasnJyfv7+5+fn2tra56envT09DQ0NKGhoePj4/Hx8WlpaTU1NV1dXWhoaMrKyuTk5K6urtPT062trYSEhE9PT1xcXDMzM/Ly8ltbW8jIyMbGxvz8/Pj4+P39/fX19fr6+vf39/b29v7+/sfHx////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4zLWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjBDODAwRkEwNTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjBDODAwRjlGNTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzQgV2luZG93cyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDkzNTUwM0E1NkUyMTFBMzVEQkU3NTg3NjZGMTBGIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Af/+/fz7+vn49/b19PPy8fDv7u3s6+rp6Ofm5eTj4uHg397d3Nva2djX1tXU09LR0M/OzczLysnIx8bFxMPCwcC/vr28u7q5uLe2tbSzsrGwr66trKuqqainpqWko6KhoJ+enZybmpmYl5aVlJOSkZCPjo2Mi4qJiIeGhYSDgoGAf359fHt6eXh3dnV0c3JxcG9ubWxramloZ2ZlZGNiYWBfXl1cW1pZWFdWVVRTUlFQT05NTEtKSUhHRkVEQ0JBQD8+PTw7Ojk4NzY1NDMyMTAvLi0sKyopKCcmJSQjIiEgHx4dHBsaGRgXFhUUExIREA8ODQwLCgkIBwYFBAMCAQAAIfkEAAAAAAAsAAAAAB0AEwAABv/Ak2nYGRqPxiKHY2SaOsKTdHoqVanYq3VanG6z3iu2ZGWCtWFx+tSBbt9U+HdsllrJUkZhcFoMBhESJwJgXWsMGA4BJwEXAg+LCWBDaycDFgIKjIsDixkFWZRgGicGmgEKIAOgCYtYlHdpAosVDQYCEyWSoSZkviUgdrNkHAvBJw6/vkMgzc7NHiACByAeBSbR0dXPIEMEHuDhIiAi09EHGwYQAg0U3x7vTCLz9AAiBAQABPT8/fRDAAB8GEjwQ8CBAgseJBjQBIcPJD6MmEixosWKEklMfEIiRAiNJEKKHEky5McRIYuEQDACgceXMGPCRNDxIxQmHTjkRMKz584DE0EAADs=" alt="1만">
                                                </a> <a href="#" rel="20000" onclick="test1(20000)"> <img src="data:image/gif;base64,R0lGODlhHQATANUAAMbGxvn5+cjIyDQ0NMnJyTU1NWpqavv7+/Hx8YWFha6urmlpadbW1mtra+Tk5KGhoTMzM11dXVBQUPDw8EFBQZ+fn6CgoOPj409PT8XFxfT09NXV1ZOTk0JCQq2trVxcXE5OTvPz81tbW56enkNDQ/z8/P39/fj4+PX19ff39/r6+vb29v7+/sfHx////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4zLWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjBDQjE2MjQzNTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjBDQjE2MjQyNTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzQgV2luZG93cyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDkzNTUwM0E1NkUyMTFBMzVEQkU3NTg3NjZGMTBGIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Af/+/fz7+vn49/b19PPy8fDv7u3s6+rp6Ofm5eTj4uHg397d3Nva2djX1tXU09LR0M/OzczLysnIx8bFxMPCwcC/vr28u7q5uLe2tbSzsrGwr66trKuqqainpqWko6KhoJ+enZybmpmYl5aVlJOSkZCPjo2Mi4qJiIeGhYSDgoGAf359fHt6eXh3dnV0c3JxcG9ubWxramloZ2ZlZGNiYWBfXl1cW1pZWFdWVVRTUlFQT05NTEtKSUhHRkVEQ0JBQD8+PTw7Ojk4NzY1NDMyMTAvLi0sKyopKCcmJSQjIiEgHx4dHBsaGRgXFhUUExIREA8ODQwLCgkIBwYFBAMCAQAAIfkEAAAAAAAsAAAAAB0AEwAABv9AV6ZFFBCPxmMLAGgllS1X1EU1Ua+sqzaLvRKp3K2LFR5rz8urFczmls/Z5nn+zr7H3/vkYUG4LgSBDC4Gg3ZZX2IsESAREiwPHQYSBiwFBGUsTnMuCAuDlxUNLhYGLgMJDmhTnC4KFAgPHwQJDSyoqlqJdRskCq4GDQscpwJzRIdkZA4UCcoCHmYDAsrKRCbY2SYTIhhECCYjCywl2SUs2kQHJesl7gAFAwMQLQcV8wMFBS0lKu7uRFQIHDgwwAGCBAMgFEgkgMMTECOqOBGAYkSIFS9CJJKi44kUJ1Z0HEmyZMkVS1asQLEyhcqXMGPKTEFEAwqWK0KsvMmzp88QmztbaCLSREATKEiVHI0SBAA7" alt="2만">
                                                </a> <a href="#" rel="30000" onclick="test1(30000)"> <img src="data:image/gif;base64,R0lGODlhHQATANUAAPv7+/j4+P39/aCgoGpqasnJyeTk5GlpacbGxvHx8U9PT66url1dXaGhofDw8NbW1kJCQoWFhTU1NZ+fn2tra62trdfX1zMzM5GRkZOTk8rKyl5eXp6enuLi4k5OTlBQUNXV1Xl5ecjIyDQ0NPz8/Pn5+fr6+vX19fb29vf39/7+/sfHx////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4zLWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjBDQjE2MjRCNTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjBDQjE2MjRBNTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzQgV2luZG93cyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDkzNTUwM0E1NkUyMTFBMzVEQkU3NTg3NjZGMTBGIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Af/+/fz7+vn49/b19PPy8fDv7u3s6+rp6Ofm5eTj4uHg397d3Nva2djX1tXU09LR0M/OzczLysnIx8bFxMPCwcC/vr28u7q5uLe2tbSzsrGwr66trKuqqainpqWko6KhoJ+enZybmpmYl5aVlJOSkZCPjo2Mi4qJiIeGhYSDgoGAf359fHt6eXh3dnV0c3JxcG9ubWxramloZ2ZlZGNiYWBfXl1cW1pZWFdWVVRTUlFQT05NTEtKSUhHRkVEQ0JBQD8+PTw7Ojk4NzY1NDMyMTAvLi0sKyopKCcmJSQjIiEgHx4dHBsaGRgXFhUUExIREA8ODQwLCgkIBwYFBAMCAQAAIfkEAAAAAAAsAAAAAB0AEwAABv9A1kq0KhpFCBHRWEQYnUYha0plqajX6jRbVRW7YK01PB1ixVrVNcstr85jNDzuTk8dg4aD9RBpCgYWBHRWRWtjKgkKCh4MLAQfBBADIiNbVV9iBg0JICMJBwMsoQUjom2ZbVMGIQwqFBEFDAOlonSGdnwKGywZBwQEC6WXVF9qLAJWBiIsCSMrKgsiapVrx14rJAIq2gIkCCMLFSMdJAQT2+kk3ALtRSQAJPLaABgXEhwAAAcj/f3x8+QVMUGQYAkABhESVKjvYImCD4uUmJgiQIkAGE1ctJhi4sUSFTdaLJKipMmTKFOmHIKipcuXMGPGLHKips2bOHPmZMakp88Fn0ymBQEAOw==" alt="3만">
                                                </a> <a href="#" rel="50000" onclick="test1(50000)"> <img src="data:image/gif;base64,R0lGODlhHQATANUAAGpqavv7+/z8/MjIyDQ0NMnJycbGxqCgoDU1NZ+fn09PT2tra+Tk5NbW1q6urqGhoYWFhWlpaa2trXd3d5OTk4SEhK+vr+Xl5UFBQV1dXUBAQJKSkkNDQ05OTrq6uvj4+Pn5+f39/fr6+vb29vX19ff39/7+/sfHx////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4zLWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjBDRjA0NDRENTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjBDRjA0NDRDNTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzQgV2luZG93cyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDkzNTUwM0E1NkUyMTFBMzVEQkU3NTg3NjZGMTBGIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Af/+/fz7+vn49/b19PPy8fDv7u3s6+rp6Ofm5eTj4uHg397d3Nva2djX1tXU09LR0M/OzczLysnIx8bFxMPCwcC/vr28u7q5uLe2tbSzsrGwr66trKuqqainpqWko6KhoJ+enZybmpmYl5aVlJOSkZCPjo2Mi4qJiIeGhYSDgoGAf359fHt6eXh3dnV0c3JxcG9ubWxramloZ2ZlZGNiYWBfXl1cW1pZWFdWVVRTUlFQT05NTEtKSUhHRkVEQ0JBQD8+PTw7Ojk4NzY1NDMyMTAvLi0sKyopKCcmJSQjIiEgHx4dHBsaGRgXFhUUExIREA8ODQwLCgkIBwYFBAMCAQAAIfkEAAAAAAAsAAAAAB0AEwAABv9A1GlILBYNp8EgSTQsT0IUyiStUqtWqhYrhFqnYOn1miUjv1w0lnwdisNjsGkrtya/V8fhkGAwCoANJgANa0IGaVIACgCEDxoLjCgEBWluiQAPVwcAKJwmCBUXXJdwKJEIEygJGQUQnQQQDKRehhsUHhwSDgsRABQmlJZQcyFbIVMAB0IWWgQDYnMmQyEhAijW1QoTAxgSJgkR1cYCAuPVQwHm6uUiJx2hAQEJBAgIBAQnISIh8gJDIgIKFBEARMGBCEWAUBgg4BAQED98KCERYkQRFSVmBPEB4pASIEOKHEmS5AkDI1KqXMmy5UoSI5KQmEmzps2bNw1MM8Kzp08DFEEAADs=" alt="5만">
                                                </a> <a href="#" rel="100000" onclick="test1(100000)"> <img src="data:image/gif;base64,R0lGODlhHQATANUAAGpqavz8/KCgoDU1NZ+fn66uruTk5F1dXfHx8dbW1jMzM4WFhZ2dncrKykJCQlBQUOPj40FBQWlpaaGhoWtra9fX162trVFRUbu7u5OTk+Li4rq6uvDw8E9PT8jIyPv7+/j4+Pn5+cbGxsnJyf39/TQ0NPr6+vb29vX19ff39/7+/sfHx////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4zLWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjBEMTM0OEQ0NTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjBEMTM0OEQzNTY0NjExRTJBNzU2QUVCMEQyQ0JCOEVGIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzQgV2luZG93cyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDkzNTUwM0E1NkUyMTFBMzVEQkU3NTg3NjZGMTBGIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjFCNTRGNzgyNkJBNUUxMTE5OEE5RTBGNzkzNUY1QThGIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+Af/+/fz7+vn49/b19PPy8fDv7u3s6+rp6Ofm5eTj4uHg397d3Nva2djX1tXU09LR0M/OzczLysnIx8bFxMPCwcC/vr28u7q5uLe2tbSzsrGwr66trKuqqainpqWko6KhoJ+enZybmpmYl5aVlJOSkZCPjo2Mi4qJiIeGhYSDgoGAf359fHt6eXh3dnV0c3JxcG9ubWxramloZ2ZlZGNiYWBfXl1cW1pZWFdWVVRTUlFQT05NTEtKSUhHRkVEQ0JBQD8+PTw7Ojk4NzY1NDMyMTAvLi0sKyopKCcmJSQjIiEgHx4dHBsaGRgXFhUUExIREA8ODQwLCgkIBwYFBAMCAQAAIfkEAAAAAAAsAAAAAB0AEwAABv9A1mooGnpExeJwdfQQl0oha0pVqajVK1ZLXYmwLO3VGgZzy8IVGF2ditHc4Xi9XXO1w/IVMjFcEQICUwkNHiMGFQBsTlgJDiUjUw8HDwssFB0ADgIeJW5TRVgCBSUeLCMlHBgKLACCEgKognhqbggskCydKqitCyMHBCMDBJ95bQMjKg2eqCoZANEFw59pVlckKrm7zioWyiq7YVZDJObZJCUrJBoDGwwX2QAE6NkBKuZDAR/7/CUiJD4wGBBBxD4AJUooSMiv3xATED9AnDgxhAmJHyxe3DhxSIiPKUKAGPlRJAgTIUGIXDmy5ZAUMGPKnEmT5pATKE7o3Mmzp08VnkhQCB1KtKhRo6aWKF3KtCkTFkEAADs=" alt="10만">
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>결제수단</th>
                                        <td colspan="3"><label> <input type="radio" class="radio" title="결제방법" checked="checked">카카오페이
                                            </label></td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="submit">
                                <input type="submit" value="충전하기">
                            </div>
                        </form>
                    </div>
                </div>
                <div class="tabpanel" id="panel2" role="tabpanel">
                        <form id="drawbackform" method="post" action="./drawback.ms">
                            <table class="tbl_money" border="0" align="center" cellpadding="0" cellspacing="0">
                                <colgroup>
                                    <col width="15%">
                                    <col width="35%">
                                    <col width="15%">
                                    <col width="35%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>결제 주문번호</th>
                                        <td><input class="text3" type="text" name="merchant_uid" title="결제 주문번호"></td>

                                        <th>현재 사이버머니</th>
                                        <td>￦ ${currentMoney}</td>
                                    </tr>
                                    <tr>

                                    </tr>
                                </tbody>
                            </table>
                            <div class="submit" style="text-align: center;">
                                <input type="submit" value="환불요청하기">
                            </div>
                        </form>
                    </div>
                </div>
            </div>


    <!-- 푸터 영역 -->
    <div class="footer">
        <div class="upper_footer">
            <ul class="upper_footer--list">
                <li><a href="#"> 올션소개 </a></li>
                <li><a href="#"> 채용정보 </a></li>
                <li><a href="#"> 공지사항 </a></li>
                <li><a href="#"> 이용약관 </a></li>
                <li><a href="#"> 개인정보처리방침 </a></li>
                <li><a href="#"> 전자금융거래약관 </a></li>
                <li><a href="#"> 제휴서비스 </a></li>
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
    <script>
        (function() {

            function activateTab() {
                if (activeTab) {
                    resetTab.call(activeTab);
                }
                this.parentNode.className = 'tab tab-active';
                activeTab = this;
                activePanel = document.getElementById(activeTab.getAttribute('href').substring(1));
                activePanel.className = 'tabpanel show';
                activePanel.setAttribute('aria-expanded', true);
            }

            function resetTab() {
                activeTab.parentNode.className = 'tab';
                if (activePanel) {
                    activePanel.className = 'tabpanel hide';
                    activePanel.setAttribute('aria-expanded', false);
                }
            }

            var doc = document,
                tabs = doc.querySelectorAll('.tab a'),
                panels = doc.querySelectorAll('.tabpanel'),
                activeTab = tabs[0],
                activePanel;

            activateTab.call(activeTab);

            for (var i = tabs.length - 1; i >= 0; i--) {
                tabs[i].addEventListener('click', activateTab, false);
            }

        })();

    </script>
    <script>
        // 충전
        $('.Tab_menu1').on('click', function() {
            $('.XenoTabLayer').hide();
            $('.Tab_box1').show();
        });

        // 환불
        $('.Tab_menu2').on('click', function() {
            $('.XenoTabLayer').hide();
            $('.Tab_box2').show();
        });

        $('.Tab_menu1').click();

    </script>
	<!--  스크립트 영역  -->
	<script src="<c:url value="https://code.jquery.com/jquery-3.5.1.min.js"/>"></script>
	<script src="<c:url value="/resources/js/pay.js" />"></script>
</body>

</html>
