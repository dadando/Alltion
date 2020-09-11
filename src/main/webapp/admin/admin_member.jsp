<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="resources/css/admin_member.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <title>All-tion</title>
</head>
<body>
    <jsp:include page="admin_header.jsp" flush="false" />

    <section class="flex-column">

        <h1 class="title">회원 관리</h1>
        
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
                                <input name="adminMemberId" type="text" maxlength="20">
                            </div>
                        </div>
                        <div class="search-row listSearch--name">
                            <div class="listSearch--subtitle">
                                <p>이름</p>
                            </div>
                            <div class="listSearch--input">
                                <input name="adminMemberName" type="text" maxlength="5">
                            </div>
                        </div><div class="search-row listSearch--email">
                            <div class="listSearch--subtitle">
                                <p>이메일</p>
                            </div>
                            <div class="listSearch--input">
                                <input name="adminMemberEmail" type="text" maxlength="30">
                            </div>
                        </div>
                    </div>

                    <div class="search-rowWarp">
                        <div class="search-row listSearch--phone">
                            <div class="listSearch--subtitle">
                                <p>연락처</p>
                            </div>
                            <div class="listSearch--input">
                                <input name="adminMemberPhone" type="text" maxlength="13">
                            </div>
                        </div>
                        <div class="search-row listSearch--date">
                            <div class="listSearch--subtitle">
                                <p>가입 기간</p>
                            </div>
                            <div class="listSearch--input">
                                <input id="listSearch--startDate" name="adminMemberStartDate" type="text" readonly>
                                <span>~</span>
                                <input id="listSearch--endDate" name="adminMemberEndDate" type="text" readonly>
                            </div>
                        </div>
                    </div>

                    <div class="search-rowWarp">
                        <div class="search-row listSearch--status">
                            <div class="listSearch--subtitle">
                                <p>계정 상태</p>
                            </div>
                            <select name="adminMemberStatus">
                                <option value="0" selected>정상</option>
                                <option value="1">탈퇴</option>
                                <option value="2">정상&amp;탈퇴</option>
                                <option value="3">관리자</option>
                            </select>
                        </div>
                        <div class="search-row listSearch--sort">
                            <div class="listSearch--subtitle">
                                <p>정렬</p>
                            </div>
                            <select name="adminMemberSort">
                                <option value="0" selected>가입일(내림차순)</option>
                                <option value="1">가입일(올림차순)</option>
                                <option value="2">아이디(내림차순)</option>
                                <option value="3">아이디(올림차순)</option>
                                <option value="4">이름(내림차순)</option>
                                <option value="5">이름(올림차순)</option>
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
                        <th style="width:15%">아이디</th>
                        <th style="width:15%">이름</th>
                        <th style="width:20%">이메일</th>
                        <th style="width:15%">연락처</th>
                        <th style="width:10%">계정상태</th>
                        <th style="width:15%">가입일</th>
                        <th style="width:10%">수정</th>
                    </tr>
                </table>
                <div class="flex-row list--pagingWarp">
                    <p><span class="list--count"></span>개의 회원정보가 검색되었습니다</p>
                    <ul class="list--paging"></ul>
                </div>
            </div>
        </div>
    </section>

    <!--  스크립트 영역  -->
    <script src="resources/js/admin_member.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="resources/js/datepicker-ko.js"></script>
</body>
</html>