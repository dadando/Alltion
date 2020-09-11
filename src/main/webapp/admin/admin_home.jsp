<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>
    <link rel="stylesheet" href="resources/css/admin_home.css">

    <title>All-tion</title>
</head>
<body>
	<jsp:include page="admin_header.jsp" flush="false" />

    <section class="flex-column">

        <h1 class="title">메인</h1>

        <ul class="mainConut--cardWarp flex-row">
            <li class="card flex-column">
                <span class="mainConut--title">회원수</span>
                <div class="mainConut--content flex-row">
                    <span class="memberCount"></span>
                    <i class="far fa-address-card"></i>
                </div>
            </li>
            <li class="card flex-column">
                <span class="mainConut--title">경매건수</span>
                <div class="mainConut--content flex-row">
                    <span class="productCount"></span>
                    <i class="far fa-folder-open"></i>
                </div>
            </li>
            <li class="card flex-column">
                <span class="mainConut--title">거래건수</span>
                <div class="mainConut--content flex-row">
                    <span class="tradingCount"></span>
                    <i class="fas fa-exchange-alt"></i>
                </div>
            </li>
            <li class="card flex-column">
                <span class="mainConut--title">입찰건수</span>
                <div class="mainConut--content flex-row">
                    <span class="bidCount"></span>
                    <i class="far fa-hand-paper"></i>
                </div>
            </li>
            <li class="card flex-column">
                <span class="mainConut--title">결제금액</span>
                <div class="mainConut--content flex-row">
                    <span class="paySum"></span>
                    <i class="fas fa-hand-holding-usd"></i>
                </div>
            </li>
        </ul>
        
        <div class="card dailyAuction--chartWarp">
            <p class="dailyAuction--title"><i class="fas fa-chart-area"></i>최근 일주일 경매등록수</p>
            <div class="dailyAuction--chart"></div>
        </div>

        <div class="flex-row">
            <div class="card cateCount--chartWarp">
                <p class="cateCount--title"><i class="fas fa-chart-pie"></i>카테고리별 상품수</p>
                <div class="cateCount--chart"></div>
            </div>

            <div class="card dailySubscribers--chartWarp">
                <p class="dailySubscribers--title"><i class="fas fa-chart-bar"></i>최근 일주일 가입자수</p>
                <div class="dailySubscribers--chart"></div>
            </div>
        </div>
    </section>

    <!--  스크립트 영역  -->
    <script src="https://d3js.org/d3.v3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
    <script src="resources/js/admin_home.js"></script>
</body>
</html>