<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="resources/css/admin_pay.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <title>All-tion</title>
</head>
<body>
    <jsp:include page="admin_header.jsp" flush="false" />

    <section class="flex-column">

        <h1 class="title">결제 관리</h1>
        
        <div class="card listSearch--cardWarp">
            <p class="listSearch--title"><i class="fas fa-search"></i>검색 조건</p>
            <div class="flex-column">
                <form id="searchForm">
                    <div class="search-rowWarp">
                        <div class="search-row listSearch--id">
                            <div class="listSearch--subtitle">
                                <p>아이디</p>
                            </div>
                            <div class="listSearch--input">
                                <input name="adminPayId" type="text" maxlength="20">
                            </div>
                        </div>
                        <div class="search-row listSearch--date">
                            <div class="listSearch--subtitle">
                                <p>결제 기간</p>
                            </div>
                            <div class="listSearch--input">
                                <input id="listSearch--startDate" name="adminPayStartDate" type="text" readonly>
                                <span>~</span>
                                <input id="listSearch--endDate" name="adminPayEndDate" type="text" readonly>
                            </div>
                        </div>
                    </div>
                    
                    <div class="search-rowWarp">
                        <div class="search-row listSearch--number">
                            <div class="listSearch--subtitle">
                                <p>결제 번호</p>
                            </div>
                            <div class="listSearch--input">
                                <input name="adminPayNumber" type="text" maxlength="20">
                            </div>
                        </div>
                        <div class="search-row listSearch--money">
                            <div class="listSearch--subtitle">
                                <p>결제 금액</p>
                            </div>
                            <div class="listSearch--input">
                                <input name="adminPayMoney" type="text" maxlength="20" disabled>
                            </div>
                        </div>
                        <div class="search-row listSearch--moneyFilter">
	                        <label>
	                            <input type="radio" name="adminPayMoneyFilter" value="1" onclick="changeInput(this)">이상
	                        </label>
	                        <label>
	                            <input type="radio" name="adminPayMoneyFilter" value="2" onclick="changeInput(this)">이하
	                        </label>
	                        <label>
	                            <input type="radio" name="adminPayMoneyFilter" value="0" onclick="changeInput(this)"
	                                checked>제한없음
	                        </label>
                        </div>
                    </div>

                    <div class="search-rowWarp">
                        <div class="search-row listSearch--status">
                            <div class="listSearch--subtitle">
                                <p>결제 상태</p>
                            </div>
                            <select name="adminPayStatus">
                                <option value="전체" selected>전체</option>
                                <option value="paid">결제</option>
                                <option value="결제취소">결제취소</option>
                            </select>
                        </div>
                        <div class="search-row listSearch--sort">
                            <div class="listSearch--subtitle">
                                <p>정렬</p>
                            </div>
                            <select name="adminPaySort">
                                <option value="0" selected>결제일(내림차순)</option>
                                <option value="1">결제일(올림차순)</option>
                                <option value="2">결제금액(내림차순)</option>
                                <option value="3">결제금액(올림차순)</option>
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
					    <th style="width:14%">결제 번호</th>
					    <th style="width:14%">아이디</th>
					    <th style="width:14%">결제 상태</th>
					    <th style="width:14%">결제 금액</th>
					    <th style="width:14%">이전 금액</th>
					    <th style="width:14%">변동 후 금액</th>
					    <th style="width:16%">결제일</th>
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
    <script src="resources/js/admin_pay.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="resources/js/datepicker-ko.js"></script>
</body>
</html>