<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
	
	<link rel="stylesheet" href="resources/css/main_style.css">
    <link rel="stylesheet" href="resources/css/productRegistration.css">
    <link rel="stylesheet" href="resources/css/summernote/summernote-lite.css">
    <link href="https://fonts.googleapis.com/css2?
    family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <title>All-tion</title>
</head>

<body>
    <!-- 모든 페이지 공통 영역 by 하나  -->
    
    <div class="header">
        <jsp:include page="../header/main_header.jsp"></jsp:include>
    </div>

    <!-- !! 메인 페이지 내용(지워서 사용함) !! start -->
    <!-- 경매등록 시작 -->

    <section id="product" class="product">

        <!-- 타이틀 -->
        <div class="product--title">
            <h1>경매 등록</h1>
        </div>

        <!-- 입력폼 -->
        <form name="product_form" class="product--form">
        	<input type="hidden" name="product_id" value=${userId }>

            <!-- 카테고리 시작 -->
            <div class="form--category">
                <div class="category--subtitle">
                    <span class="material-icons">done</span>
                </div>
                <div class="category--route">
                    <div class="category--route__title">
                        <p>선택한 카테고리 경로</p>
                    </div>
                    <div class="category--route__text">
                        <p></p>
                    </div>
                </div>
                <div class="category--select">
                    <select class="category--select__01" name="product_category_1" size="7"
                        onchange="changeCategory(this)">
                        <option value="">- 선택해주세요 -</option>
                        <option value="cate01">패션</option>
                        <option value="cate02">뷰티</option>
                        <option value="cate03">출산/유아동</option>
                        <option value="cate04">전자기기</option>
                        <option value="cate05">가전제품</option>
                        <option value="cate06">가구/인테리어</option>
                        <option value="cate07">반려동물/취미</option>
                        <option value="cate08">도서/음반/문구</option>
                        <option value="cate09">티켓/쿠폰</option>
                        <option value="cate10">스포츠</option>
                        <option value="cate11">공구/산업용품</option>
                        <option value="cate12">기타잡화</option>
                    </select>

                </div>
            </div>
            <!-- 카테고리 끝 -->

            <!-- 상품 정보 시작 -->
            <div class="form--info">
                <div class="info--subtitle">
                    <span class="material-icons">done</span>
                    <p class="info--notice"> * 표시는 필수 항목입니다</p>
                </div>
                <div class="info--form_wrap">

                    <div class="form_wrap--items">
                        <div class="form_wrap--items__title">
                            <p>상품 제목(<span class="notice">*</span>)</p>
                        </div>
                        <div class="form_wrap--items__contents">
                            <input type="text" name="product_subject">
                        </div>
                    </div>

                    <div class="form_wrap--items">
                        <div class="form_wrap--items__title">
                            <p>상품 설명(<span class="notice">*</span>)</p>
                        </div>
                        <div class="form_wrap--items__contents">
                            <p>
                                ※ 사이즈, 색상 사용감, 사용 기간, 보증 기간 등 상세한 상품 정보를 입력하면 더욱 수월하게 거래할 수 있습니다
                            </p>
                            <textarea id="summernote" name="product_content"></textarea>
                        </div>
                    </div>

                    <div class="form_wrap--items">
                        <div class="form_wrap--items__title">
                            <p>이미지 등록(<span class="notice">*</span>)</p>
                        </div>
                        <div class="form_wrap--items__contents">
                            <div id="drop" class="flexCenter">
                                업로드할 파일을 여기에 놓습니다.
                                <div id="thumbnails" class="flexCenter">
                                </div>
                            </div>
                            <div class="filebox">
                                <label for="fileUpload" class="form_wrap--items__file">파일 첨부</label>
                                <input type="file" id="fileUpload"></input>
                            </div>
                            
                            <p>
                                이미지 형식 : JPG<br>
                                사이즈 규격 : 가로폭 1000px (1000px 보다 클 경우 1000이하로 자동 편집됩니다) 5장까지 등록 가능합니다.<br>
                                원활한 물품 등록을 위하여 이미지 1장 기준으로 3MB 이하로 등록하셔야 합니다.
                            </p>
                        </div>
                    </div>

                </div>
            </div>
            <!-- 상품 정보 끝 -->

            <!-- 경매 설정 시작 -->
            <div class="form--auction">
                <div class="auction--subtitle">
                    <span class="material-icons">done</span>
                </div>
                <div class="auction--form_wrap">

                    <div class="form_wrap--items">
                        <div class="form_wrap--items__title">
                            <p>시작가(<span class="notice">*</span>)</p>
                        </div>
                        <div class="form_wrap--items__contents">
                            <input class="wd150" type="text" name="product_starting_price" maxlength="9"><span> 원</span>
                        </div>
                    </div>

                    <div class="form_wrap--items">
                        <div class="form_wrap--items__title">
                            <p>입찰 단위(<span class="notice">*</span>)</p>
                        </div>
                        <div class="form_wrap--items__contents">
                            <select class="wd120" name="product_bidding_unit">
                                <option value="">선택하세요</option>
                                <option value="100">100원</option>
                                <option value="200">200원</option>
                                <option value="500">500원</option>
                                <option value="1000">1,000원</option>
                                <option value="2000">2,000원</option>
                                <option value="5000">5,000원</option>
                                <option value="10000">10,000원</option>
                                <option value="20000">20,000원</option>
                                <option value="50000">50,000원</option>
                                <option value="100000">100,000원</option>
                            </select>
                        </div>
                    </div>

                    <div class="form_wrap--items">
                        <div class="form_wrap--items__title">
                            <p>경매 기간(<span class="notice">*</span>)</p>
                        </div>
                        <div class="form_wrap--items__contents">
                            <select class="wd90" onchange="changeEndDate(this.value)">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                            </select><span> 일 진행</span>
                            <span class="fw700">마감 </span>
                            <input class="endDate" type="text" name="product_end_date" readonly>
                        </div>
                    </div>

                </div>
            </div>
            <!-- 경매 설정 끝 -->

            <!-- 거래 설정 시작 -->
            <div class="form--delivery">
                <div class="delivery--subtitle">
                    <span class="material-icons">done</span>
                </div>
                <div class="delivery--form_wrap">

                    <div class="form_wrap--items">
                        <div class="form_wrap--items__title">
                            <p>택배 거래(<span class="notice">*</span>)</p>
                        </div>
                        <div class="flexCenter form_wrap--items__contents">
                            <label>
                                <input type="radio" name="product_delivery" value="before" checked>착불
                            </label>
                            <label>
                                <input type="radio" name="product_delivery" value="after">선불
                            </label>
                            <label>
                                <input type="radio" name="product_delivery" value="none">불가능
                            </label>
                        </div>
                    </div>

                    <div class="form_wrap--items">
                        <div class="form_wrap--items__title">
                            <p>직거래(<span class="notice">*</span>)</p>
                        </div>
                        <div class="flexCenter form_wrap--items__contents">
                            <div class="flexCenter minH50">
                                <label>
                                    <input type="radio" name="direct" value="0" 
                                    	onclick="changeInput(this)" checked>불가능
                                </label>
                                <label>
                                    <input type="radio" name="direct" value="1" 
                                    	onclick="changeInput(this)">가능
                                </label>
                            </div>
                            <div>
                                <span class="fw700">가능지역 </span>
                                <input class="directArea readonlyfalse" type="text" name="product_transaction_area"
                                     maxlength="20" readonly>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- 거래 설정 끝 -->

            <!-- 기타 설정 시작 -->
            <div class="form--other">
                <div class="other--subtitle">
                    <span class="material-icons">done</span>
                </div>
                <div class="other--form_wrap">

                    <div class="form_wrap--items">
                        <div class="form_wrap--items__title">
                            <p>즉시 구매(<span class="notice">*</span>)</p>
                        </div>
                        <div class="flexCenter form_wrap--items__contents">
                            <div class="flexCenter minH50">
                                <label>
                                    <input type="radio" name="purchase" value="0" onclick="changeInput(this)"
                                        checked>불가능
                                </label>
                                <label>
                                    <input type="radio" name="purchase" value="1" onclick="changeInput(this)">가능
                                </label>
                            </div>
                            <div>
                                <span class="fw700">금액 </span>
                                <input class="purchasePrice readonlyfalse" type="text" name="product_purchase_price"
                                     maxlength="9" disabled>
                            </div>
                        </div>
                    </div>

                    <div class="form_wrap--items">
                        <div class="form_wrap--items__title">
                            <p>자동 재경매(<span class="notice">*</span>)</p>
                        </div>
                        <div class="form_wrap--items__contents">
                            <p>
                                ※ 재경매 감가금액<br>
                                10,000원 이하: 1,000원 차감<br>
                                30,000원 이하: 3,000원 차감<br>
                                50,000원 이하: 5,000원 차감<br>
                                100,000원 이하: 10,000원 차감<br>
                                300,000원 이하: 20,000원 차감<br>
                                500,000원 이하: 30,000원 차감<br>
                                500,000원 초과: 40,000원 차감<br><br>
                                예시) 시작가 32,000원으로 낙찰이 안 됐을 경우 -&gt; 시작가 29,000원으로 차감 후 경매 시작
                            </p>
                            <div class="flexCenter minH50">
                                <label>
                                    <input type="radio" name="product_re_auction" value="0" checked>불가능
                                </label>
                                <label>
                                    <input type="radio" name="product_re_auction" value="1">가능
                                </label>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- 기타 설정 끝 -->

            <!-- 경고 -->
            <div class="form--warning">
                <p>
                    * 부정확한 정보로 인한 경매사고 발생시 신용도에 반영될 수 있으며 사이트 이용에 대한 제재를 받을 수 있습니다.<br>
                    * 등록된 물품과 관련하여 발생하는 모든 법적 책임은 판매자에게 있습니다
                </p>
            </div>

            <!-- submit -->
            <div class="form--button">
                <a class="form-button__submit" onclick="productSubmit()">등록</a>
                <a class="form-button__cancel" onclick="product_form.reset()">다시 작성</a>
            </div>

        </form>
    </section>
    <!-- 경매등록 끝 -->

    <!-- !! 기재해야 될 코드 여기에서부터 입력 end -->
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
    <script src="resources/js/productRegistration.js"></script>
    <script src="resources/js/summernote/summernote-lite.js"></script>
    <script src="resources/js/summernote/summernote-ko-KR.js"></script>
</body>

</html>