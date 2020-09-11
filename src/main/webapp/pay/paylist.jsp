<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.alltion.pay.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	List<PayVO> chargevo = (List<PayVO>) request.getAttribute("chargevo");
List<PayVO> cancelvo = (List<PayVO>) request.getAttribute("cancelvo");
List<PaymentVO> paymentvo = (List<PaymentVO>) request.getAttribute("paymentvo");

int listcount1 = ((Integer) request.getAttribute("listcount1")).intValue();
int nowpage1 = ((Integer) request.getAttribute("page1")).intValue();
int maxpage1 = ((Integer) request.getAttribute("maxpage1")).intValue();
int startpage1 = ((Integer) request.getAttribute("startpage1")).intValue();
int endpage1 = ((Integer) request.getAttribute("endpage1")).intValue();

int listcount2 = ((Integer) request.getAttribute("listcount2")).intValue();
int nowpage2 = ((Integer) request.getAttribute("page2")).intValue();
int maxpage2 = ((Integer) request.getAttribute("maxpage2")).intValue();
int startpage2 = ((Integer) request.getAttribute("startpage2")).intValue();
int endpage2 = ((Integer) request.getAttribute("endpage2")).intValue();

int listcount3 = ((Integer) request.getAttribute("listcount3")).intValue();
int nowpage3 = ((Integer) request.getAttribute("page3")).intValue();
int maxpage3 = ((Integer) request.getAttribute("maxpage3")).intValue();
int startpage3 = ((Integer) request.getAttribute("startpage3")).intValue();
int endpage3 = ((Integer) request.getAttribute("endpage3")).intValue();

String tab = (String)request.getAttribute("tab");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/main_style.css">
<link rel="stylesheet" href="./resources/css/paylist.css?after">
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<link rel="stylesheet" href="./resources/css/button.css">
<link
	href="https://fonts.googleapis.com/css2?
    family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<title>Alltion E머니 거래내역 조회</title>
</head>
<body>
	<!-- 모든 페이지 공통 영역 by 하나  -->

	<div class="header">
		<jsp:include page="../header/main_header.jsp"></jsp:include>
	</div>
	<!-- 메인 페이지 내용 -->
	<div class="main_body">
	<div class="list_title">
				<h3>E머니 관리페이지</h3>
			</div>
	<div class="wrap">
	<!-- 위 내용 -->
			
	<!-- 이머니 상세내역 -->
	
            <div class="row mt30">
                
                <div class="list_notify">
                    <ul>
                        <li>이머니 충전신청 후 입금을 해주시면 입금 30분~1시간 이내로 이머니 충전됩니다. <span class="fcBlue">(단, 충전신청 금액, 입금액 및 입금자명 동일시)</span></li>
                        <li>입금[충전]신청 후 7일 동안 입금확인이 되지 않는 경우 입금오류로 변경되오며, 고객님의 이의제기가 없을 시 자동 삭제됩니다.</li>
                        <li>이머니 충전신청 후 입금하였으나 1시간 이후로도 정상적으로 이머니 충전이 되지 않을 경우 <strong class="fcBlue">일대일상담</strong>으로 문의바랍니다.</li>
                    </ul>
                </div>
                <div class="row mt30 clearfix" style="width: 85%;margin:0 auto;">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="box my-money-box text-left" style="height: 110px">
                            <div class="row fs18 fcBlack">
                                <strong>사용 가능 이머니</strong>
                            </div>
                            <div class="row fs18 fcBlue text-right">
                                <strong>${currentMoney}&nbsp;원</strong>
                                &nbsp;&nbsp;&nbsp;<a href="/alltion/pay.ms" class="btn btn-blue-green w60">충전</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="box my-money-box text-left" style="height: 110px">
                            <div class="row fs18 fcBlack">
                                <strong>출금 가능 이머니</strong>
                            </div>
                            <div class="root row fs18 fcBlue text-right">
                            	<div class="intro"></div>
                                <strong>${currentMoney}&nbsp;원</strong>
                                &nbsp;&nbsp;&nbsp;<button id="modal_opne_btn" class="btn btn-blue-green w60">출금</button>
                            </div>
                        </div>
                    </div>
                    <div class="row clearfix visible-md visible-lg">
                        <div class="col-md-12 col-sm-6 col-xs-12 mt10">
                        
                        </div>
                    </div>
                </div>
            </div>
	<!-- Moa Modal-->
	<div id="modal">
   
	<div class="modal_content">
        <h3>출금하실 e머니를 입력해주세요&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="modal_close_btn" style="color: #BBBBBB; float: right; font-size: 30px;
    font-weight: bold;
    background-color: white;">&times;</button></h3>
	    <form name="outMoney" action="outMoney.ms">
	    	<input type="text" name="money" style="border: 1px solid black;width: 300px;padding: 10px;margin-top: 15px;">
	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    	<input type="submit" id="modal_close_btn" value="출 금" style="width: 44px; height: 40px; background: #2ea5b9; border: 1px #2ea5b9 solid; color: #fff !important;>
">
	    </form>
       
        <!-- <button type="button" id="modal_close_btn">모달 창 닫기</button> -->
       
    </div>
   
    <div class="modal_layer"></div>
	</div>
	<!-- 조회 테이블 -->
	<div class="wrapper">
		<div id="cTabs" class="cTabs cf">
			<div class="<%=tab.equals("1") ? "active" : "" %>">충전 내역</div>
			<div class="<%=tab.equals("2") ? "active" : "" %>">환불 내역</div>
			<div class="<%=tab.equals("3") ? "active" : "" %>">거래 내역</div>
		</div>
		<div id="cTabContent" class="cTabContent">
			<div id="ctab1">
					<ul class="firstcharge">
						<li><span class="charge__list title">No</span></li>
						<li><span class="charge__list title">결제주문번호</span></li>
						<li><span class="charge__list title">결제 금액</span></li>
						<li><span class="charge__list title">이전 금액 </span></li>
						<li><span class="charge__list title">변동 후 금액</span></li>
						<li><span class="charge__list title">결제 상태</span></li>
					</ul>
					<%
						if (!chargevo.isEmpty()) {
						for (int i = 0; i < chargevo.size(); i++) {
							PayVO vo = (PayVO) chargevo.get(i);
					%>
					<ul class="charge">
						<li><span class="charge__list content"><%=vo.getRnum()%></span>
						</li>
						<li><span class="charge__list content"><%=vo.getPay_merchant_uid()%></span>
						</li>
						<li><span class="charge__list content"><%=vo.getPay_amount()%></span>
						</li>
						<li><span class="charge__list content"><%=vo.getPay_lastmoney()%></span>
						<li><span class="charge__list content"><%=vo.getPay_nowmoney()%></span>
						</li>
						<li><span class="charge__list content">결제</span></li>
					</ul>
					<%
						}
					}
					%>
					<ul class="page_number paging">
						
							<%
								if (nowpage1 <= 1) {
							%><li></li><%
 	} else {
 %> <li><a href="./goPaylist.ms?page1=<%=nowpage1 - 1%>&tab=1">&#60;</a></li> <%
 	}
 %>
						
						<%
							for (int a = startpage1; a <= endpage1; a++) {
							if (a == nowpage1) {
						%>
						<li><a href="" class="active num"><%=a%></a></li>
						<%
							} else {
						%>
						<li><a href="./goPaylist.ms?page1=<%=a%>&tab=1" class="num" onclick="ctab1.focus();"><%=a%></a></li>
						<%
							}
						%>
						<%
							}
						%>

						<%
							if (nowpage1 >= maxpage1) {
						%>
						<li></li>
						<%
							} else {
						%>
						<li><a href="./goPaylist.ms?page1=<%=nowpage1 + 1%>&tab=1">&#62;</a>
						</li>
						<%
							}
						%>
					</ul>
			</div>
			<div id="ctab2">
					<ul class="firstcancel">
						<li><span class="cancel__list title">No</span></li>
						<li><span class="cancel__list title">결제주문번호</span></li>
						<li><span class="cancel__list title">결제 금액</span></li>
						<li><span class="cancel__list title">이전 금액 </span></li>
						<li><span class="cancel__list title">변동 후 금액</span></li>
						<li><span class="cancel__list title">결제 상태</span></li>
					</ul>
					<%
						if (!cancelvo.isEmpty()) {
						for (int i = 0; i < cancelvo.size(); i++) {
							PayVO vo = (PayVO) cancelvo.get(i);
					%>
					<ul class="cancel">
						<li><span class="cancel__list content"><%=vo.getRnum()%></span>
						</li>
						<li><span class="cancel__list content"><%=vo.getPay_merchant_uid()%></span>
						</li>
						<li><span class="cancel__list content"><%=vo.getPay_amount()%></span>
						</li>
						<li><span class="cancel__list content"><%=vo.getPay_lastmoney()%></span>
						</li>
						<li><span class="cancel__list content"><%=vo.getPay_nowmoney()%></span>
						</li>
						<li><span class="cancel__list content"><%=vo.getPay_status()%></span>
						</li>
					</ul>
					<%
						}
					}
					%>
					<ul class="page_number paging">
						
							<%
								if (nowpage2 <= 1) {
							%><li></li> <%
 	} else {
 %><li><a href="./goPaylist.ms?page2=<%=nowpage2 - 1%>&tab=2">&#60;</a></li> <%
 	}
 %>
						
						<%
							for (int a = startpage2; a <= endpage2; a++) {
							if (a == nowpage2) {
						%>
						<li><a href="" class="active num"><%=a%></a></li>
						<%
							} else {
						%>
						<li><a href="./goPaylist.ms?page2=<%=a%>&tab=2" class="num" onclick="ctab2.focus();"><%=a%></a>
						</li>
						<%
							}
						%>
						<%
							}
						%>

						<%
							if (nowpage2 >= maxpage2) {
						%>
						<li></li>
						<%
							} else {
						%>
						<li><a href="./goPaylist.ms?page2=<%=nowpage2 + 1%>&tab=2">&#62;</a>
						</li>
						<%
							}
						%>
					</ul>
			</div>
			<div id="ctab3">
					<ul class="firstline">
						<li>
								<span class="cancel__list title">No</span>
						</li>
						<li>
								<span class="cancel__list title">상품 제목</span>
						</li>
						<li>
								<span class="cancel__list title">결제 금액</span>
						</li>
						<li>
								<span class="cancel__list title">이전 금액 </span>
						</li>
						<li>
								<span class="cancel__list title">변동 후 금액</span>
						</li>
						<li>
								<span class="cancel__list title">결제 상태</span>
						</li>
					</ul>
					<%
						if (!paymentvo.isEmpty()) {
						for (int i = 0; i < paymentvo.size(); i++) {
							PaymentVO vo = (PaymentVO) paymentvo.get(i);
							if (vo.getPayment_product_subject().length() > 5) {
						vo.setPayment_product_subject(vo.getPayment_product_subject().substring(0, 5) + "..");
							}
					%>
					<ul class="paymentlist">
						<li>
								<span class="cancel__list content"><%=vo.getRnum()%></span>
						</li>
						<li>
								<span class="cancel__list content"><%=vo.getPayment_product_subject()%></span>
						</li>
						<li>
								<span class="cancel__list content"><%=vo.getPayment_amount()%></span>
						</li>
						<li>
								<span class="cancel__list content"><%=vo.getPayment_lastmoney()%></span>
						</li>
						<li>
								<span class="cancel__list content"><%=vo.getPayment_nowmoney()%></span>
						</li>
						<li>
								<span class="cancel__list content"><%=vo.getPayment_status()%></span>
						</li>
					</ul>
					<%
						}
					}
					%>
					<ul class="page_number paging">
						<%if (nowpage3 <= 1) {%>
							<li></li> 
 						<%} else { %>
							<li><a href="./goPaylist.ms?page3=<%=nowpage3 - 1%>&tab=3">&#60;</a></li> 
						<%} %>
						<%
							for (int a = startpage3; a <= endpage3; a++) {
							if (a == nowpage3) {
						%>
						<li><a href="" class="active num"><%=a%></a></li>
						<%
							} else {
						%>
						<li><a href="./goPaylist.ms?page3=<%=a%>&tab=3" class="num" onclick="ctab3.focus();"><%=a%></a>
						</li>
						<%
							}
						%>
						<%
							}
						%>

						<%
							if (nowpage3 >= maxpage3) {
						%>
						<li></li>
						<%
							} else {
						%>
						<li><a href="./goPaylist.ms?page3=<%=nowpage3 + 1%>&tab=3">&#62;</a>
						</li>
						<%
							}
						%>
					</ul>
			</div>
		</div>
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
					<p>올션은 통신판매중개자이며 통신 판매의 당사자가 아닙니다. 따라서 올션은 상품·거래정보 및 거래에 대하여
						책임을 지지 않습니다.</p>
					<p>Copyright © Alltion All rights reserved.</p>
				</li>
			</ul>
		</div>
	</div>
</body>
<script>
	var makeCtab = {

		config : {
			tabNavContainer : '#cTabs',
			tabNavElement : 'div',
			tabContentContainer : '#cTabContent',
			tabContentElement : 'div'
		},

		init : function(config) {
			$.extend(makeCtab.config, config);
			$(makeCtab.config.tabNavContainer).on('click',
					makeCtab.config.tabNavElement, this.changeContent);
			myIndex = $(this).index();
			if(<%=tab%> == 1){
				makeCtab.showFirstTab();
			}else if (<%=tab%> == 2){
				makeCtab.showSecondTab();
			}else{
			$(makeCtab.config.tabContentContainer).find(
					makeCtab.config.tabContentElement).eq(myIndex).show()
					.siblings().hide();
			}
		},

		showFirstTab : function() {
			$(makeCtab.config.tabContentContainer).find(
					makeCtab.config.tabContentElement).hide().filter(":first")
					.show();
			$(makeCtab.config.tabNavContainer).find(
					makeCtab.config.tabNavElement).removeClass('active')
					.filter(":first").addClass('active');
		},showSecondTab : function() {
			$(makeCtab.config.tabContentContainer).find(
					makeCtab.config.tabContentElement).hide().filter(":second")
					.show();
			$(makeCtab.config.tabNavContainer).find(
					makeCtab.config.tabNavElement).removeClass('active')
					.filter(":second").addClass('active');
		},
		showActiveTab : function(a) {
			$(a).addClass('active').siblings().removeClass('active');
		},
		changeContent : function(event) {
			event.preventDefault();
			myIndex = $(this).index();

			makeCtab.showActiveTab(this);
			$(makeCtab.config.tabContentContainer).find(
					makeCtab.config.tabContentElement).eq(myIndex).show()
					.siblings().hide();
		}
	};

	$(document).ready(function() {
		makeCtab.init({
			'tabNavContainer' : '#cTabs'
		});
	});
</script>
<script>
    document.getElementById("modal_opne_btn").onclick = function() {
        document.getElementById("modal").style.display="block";
    }
   
    document.getElementById("modal_close_btn").onclick = function() {
        document.getElementById("modal").style.display="none";
    }
</script>
</html>