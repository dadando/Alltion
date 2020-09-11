<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="resources/css/admin_product.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <title>All-tion</title>
</head>
<body>
    <jsp:include page="admin_header.jsp" flush="false" />

    <section class="flex-column">

        <h1 class="title">상품 관리</h1>
        
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
                                <input name="adminProductNumber" type="text" maxlength="20">
                            </div>
                        </div>
                        <div class="search-row listSearch--subject">
                            <div class="listSearch--subtitle">
                                <p>상품 제목</p>
                            </div>
                            <div class="listSearch--input">
                                <input name="adminProductSubject" type="text" maxlength="5">
                            </div>
                        </div><div class="search-row listSearch--id">
                            <div class="listSearch--subtitle">
                                <p>판매자 아이디</p>
                            </div>
                            <div class="listSearch--input">
                                <input name="adminProductId" type="text" maxlength="30">
                            </div>
                        </div>
                    </div>

                    <div class="search-rowWarp">
                        <div class="search-row listSearch--cate">
                            <div class="listSearch--subtitle">
                                <p>상품 분류</p>
                            </div>
                            <select name="adminProductCate">
                                <option value="all" selected>전체</option>
                                <option value="cate01">패션</option>
                                <option value="cate02">뷰티</option>
                                <option value="cate03">출산/유아동</option>
                                <option value="cate04">전자기기</option>
                                <option value="cate05">패션</option>
                                <option value="cate06">가전제품</option>
                                <option value="cate07">가구/인테리어</option>
                                <option value="cate08">반려동물/취미</option>
                                <option value="cate09">도서/음반/문구</option>
                                <option value="cate10">티켓/쿠폰</option>
                                <option value="cate11">스포츠</option>
                                <option value="cate12">공구/산업용품</option>
                            </select>
                        </div>
                        <div class="search-row listSearch--date">
                            <div class="listSearch--subtitle">
                                <p>등록 기간</p>
                            </div>
                            <div class="listSearch--input">
                                <input id="listSearch--startDate" name="adminProductStartDate" type="text" readonly>
                                <span>~</span>
                                <input id="listSearch--endDate" name="adminProductEndDate" type="text" readonly>
                            </div>
                        </div>
                    </div>

                    <div class="search-rowWarp">
                        <div class="search-row listSearch--status">
                            <div class="listSearch--subtitle">
                                <p>진행 상태</p>
                            </div>
                            <select name="adminProductStatus">
                                <option value="0" selected>진행중</option>
                                <option value="1">마감</option>
                                <option value="2">전체</option>
                            </select>
                        </div>
                        <div class="search-row listSearch--sort">
                            <div class="listSearch--subtitle">
                                <p>정렬</p>
                            </div>
                            <select name="adminProductSort">
                                <option value="0" selected>등록일(내림차순)</option>
                                <option value="1">등록일(올림차순)</option>
                                <option value="2">마감일(내림차순)</option>
                                <option value="3">마감일(올림차순)</option>
                                <option value="4">입찰수(내림차순)</option>
                                <option value="5">입찰수(올림차순)</option>
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
			            <th style="width:8%">상품 번호</th>
			            <th style="width:10%">상품 제목</th>
			            <th style="width:10%">판매자 아이디</th>
			            <th style="width:8%">상품 분류</th>
			            <th style="width:8%">경매현재가</th>
			            <th style="width:8%">입찰수</th>
			            <th style="width:14%">경매종료일</th>
			            <th style="width:14%">등록일</th>
			            <th style="width:10%">진행상태</th>
			            <th style="width:10%">마감처리</th>
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
    <script src="resources/js/admin_product.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="resources/js/datepicker-ko.js"></script>
</body>
</html>