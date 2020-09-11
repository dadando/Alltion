<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="resources/css/admin_trading.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <title>All-tion</title>
</head>
<body>
    <jsp:include page="admin_header.jsp" flush="false" />

    <section class="flex-column">

        <h1 class="title">거래 관리</h1>
        
        <div class="card listSearch--cardWarp">
            <p class="listSearch--title"><i class="fas fa-search"></i>검색 조건</p>
            <div class="flex-column">
                <form id="searchForm">
                    <div class="search-rowWarp">
                        <div class="search-row listSearch--number">
                            <div class="listSearch--subtitle">
                                <p>상품 번호</p>
                            </div>
                            <div class="listSearch--input">
                                <input name="adminTradingNumber" type="text" maxlength="20">
                            </div>
                        </div>
                        <div class="search-row listSearch--buyerId">
                            <div class="listSearch--subtitle">
                                <p>구매자 아이디</p>
                            </div>
                            <div class="listSearch--input">
                                <input name="adminTradingBuyerId" type="text" maxlength="5">
                            </div>
                        </div><div class="search-row listSearch--sellerId">
                            <div class="listSearch--subtitle">
                                <p>판매자 아이디</p>
                            </div>
                            <div class="listSearch--input">
                                <input name="adminTradingSellerId" type="text" maxlength="30">
                            </div>
                        </div>
                    </div>

                    <div class="search-rowWarp">
                        <div class="search-row listSearch--system">
                            <div class="listSearch--subtitle">
                                <p>거래 방식</p>
                            </div>
                            <select name="adminTradingSystem">
                                <option value="전체" selected>전체</option>
                                <option value="택배">택배</option>
                                <option value="직거래">직거래</option>
                                <option value="미정">미정</option>
                            </select>
                        </div>
                        <div class="search-row listSearch--date">
                            <div class="listSearch--subtitle">
                                <p>등록 기간</p>
                            </div>
                            <div class="listSearch--input">
                                <input id="listSearch--startDate" name="adminTradingStartDate" type="text" readonly>
                                <span>~</span>
                                <input id="listSearch--endDate" name="adminTradingEndDate" type="text" readonly>
                            </div>
                        </div>
                    </div>

                    <div class="search-rowWarp">
                        <div class="search-row listSearch--status">
                            <div class="listSearch--subtitle">
                                <p>진행 상태</p>
                            </div>
                            <select name="adminTradingStatus">
                                <option value="전체" selected>전체</option>
                                <option value="입금대기">입금대기</option>
                                <option value="입금후">입금후</option>
                                <option value="운송장번호입력">운송장번호입력</option>
                                <option value="거래완료">거래완료</option>
                                <option value="리뷰완료">리뷰완료</option>
                            </select>
                        </div>
                        <div class="search-row listSearch--sort">
                            <div class="listSearch--subtitle">
                                <p>정렬</p>
                            </div>
                            <select name="adminTradingSort">
                                <option value="0" selected>등록일(내림차순)</option>
                                <option value="1">등록일(올림차순)</option>
                                <option value="2">거래가격(내림차순)</option>
                                <option value="3">거래가격(올림차순)</option>
                            </select>
                        </div>
                        <div class="search-row listSearch--btn">
                            <button class="listSearch--sendSearchBtn" type="button">검색</button>
                            <button class="listSearch--sendResetBtn" type="reset">초기화</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="card list--cardWarp">
            <p class="list--title"><i class="fas fa-list-ul"></i>검색 결과</p>
            <div class="flex-column list--content">
                <table class="list--table">
                    <tr class="list--tableHeader">
					    <th style="width:5%">상품 번호</th>
					    <th style="width:9%">구매자 아이디</th>
					    <th style="width:9%">판매자 아이디</th>
					    <th style="width:7%">거래 가격</th>
					    <th style="width:9%">입금 기한</th>
					    <th style="width:9%">운송장번호 입력기한</th>
					    <th style="width:9%">구매확정기한</th>
					    <th style="width:6%">거래방식</th>
					    <th style="width:10%">운송장번호</th>
					    <th style="width:8%">진행상태</th>
					    <th style="width:9%">등록일</th>
					    <th style="width:10%">거래변경</th>
                    </tr>
                </table>
                <div class="flex-row list--pagingWarp">
                    <p><span class="list--count"></span>개의 상품정보가 검색되었습니다</p>
                    <ul class="list--paging"></ul>
                </div>
            </div>
        </div>
    </section>

    <!--  스크립트 영역  -->
    <script src="resources/js/admin_trading.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="resources/js/datepicker-ko.js"></script>
</body>
</html>